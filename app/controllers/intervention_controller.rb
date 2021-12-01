class InterventionController < ApplicationController

 def index
 end

 #need create method
 def create
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
end