class InterventionController < ApplicationController
  before_action :set_intervention, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

 def index
  redirect_to index_url
  @interventions = Intervention.all
 end

 #need create method
 def create
  @intervention = Intervention.new

  # Content from the intervention form
  @intervention.user_id = current_user.employee.id
  @intervention.employee_id = params[:employee]
  @intervention.customer_id = params[:customer]
  @intervention.building_id = params[:building]
  @intervention.battery_id = params[:battery]
  @intervention.column_id = params[:column]
  @intervention.elevator_id = params[:elevator]
  @intervention.result = "Pending"
  @intervention.report = params[:report]
  @intervention.status = "Pending"
  @intervention.employee = nil

  if @intervention.save!
    create_intervention_ticket
    redirect_back fallback_location: root_path
  end
 end

 # buildings related to a selected customer
 def get_building
    @buildings = Building.where("customer_id = ?", params[:id])
    respond_to do |format|
      format.json { render :json => @buildings }
    end
 end

  # batteries related to a selected building
  def get_battery
    @batteries = Battery.where("building_id= ?", params[:id])
    respond_to do |format|
      format.json { render :json => @batteries }
    end
  end

    # columnns related to a selected battery
    def get_column
      @column = Column.where("battery_id= ?", params[:id])
      respond_to do |format|
        format.json { render :json => @column }
      end
    end

  # elevators related to a selected column
  def get_elevator
    @elevators = Elevator.where("column_id= ?", params[:id])
    respond_to do |format|
      format.json { render :json => @elevators }
    end
  end

   # employee
   def get_employee
    @employee = Employee.all
    respond_to do |format|
      format.json { render :json => @employee }
    end
  end

  # PATCH/PUT /intervention/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to "/intervention" }
        # format.html { redirect_to quotes_url}
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intervention/1.json
  def destroy
    @intervention.destroy
    respond_to do |format|
      format.html { redirect_to "/intervention" }
      format.json { head :no_content }
    end
  end

  
  # Use callbacks to share common setup or constraints between actions.
  def set_intervention
    redirect_to index_url
    @intervention = Intervention.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def intervention_params
    params.require(:intervention).permit( :author, :employee, :customer, :building, :battery, :column, :created_at, :updated_at, :elevator, :result, :report, :status)
  end

  #intervention zendesk
  def create_intervention_ticket
    client = ZendeskAPI::Client.new do |config|
    config.url = ENV['ZENDESK_URL']
    config.username = ENV['ZENDESK_USERNAME']
    config.token = ENV['ZENDESK_TOKEN']
  end
  ZendeskAPI::Ticket.create!(client, 
    :subject => "The user has requested an intervention for customer: #{Customer.find(params[:customer]).company_name} ", 
    :comment => { 
        :value => "The information for the customer that requires for an intervention is as follows:
            Requester ID is: #{params[:author]}.
            Customer is: #{Customer.find(params[:customer]).company_name}.
            Building ID is: #{Building.find(params[:building]).id}. 
            Battery ID is: #{Battery.find(params[:battery]).id}.
            Column ID is: #{Column.find(params[:column]).id unless "null"}. 
            Elevator ID is: #{Elevator.find(params[:elevator]).id unless "null"}.
            The Employee to be assigned to the task is: #{Employee.find(params[:employee]).first_name + " " + Employee.find(params[:employee]).last_name }.
            Request Description: #{params[:report]}. 
            "
          #  elevator and column should be able to be null
    }, 
    :requester => { 
        "name": User.find(current_user.id).email
        # "email": User.find(current_user.id).email,
    },
    :priority => "normal",
    :type => "question",
    )
  end
end