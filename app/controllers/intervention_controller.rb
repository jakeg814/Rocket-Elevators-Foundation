class InterventionController < ApplicationController

  # GET /interventions or /interventions.json
  def index
    
  end

  def show

  end
    # Method to get buildings related to a selected customer
    def get_building
      if params[:customer].present?
          @buildings = Customer.find(params[:customer]).buildings
      else
          @buildings = Customer.all
      end
      if request.xhr?
          respond_to do |format|
              format.json {
                  render json: {buildings: @buildings}
              }
          end
      end
  end

  # Method to get batteries related to a selected building
  def get_battery
      if params[:building].present?
          @batteries = Building.find(params[:building]).batteries
      else
          @batteries = Building.all
      end
      if request.xhr?
          respond_to do |format|
              format.json {
                  render json: {batteries: @batteries}
              }
          end
      end
  end

  # Method to get columnns related to a selected battery
  def get_column
      if params[:battery].present?
          @columns = Battery.find(params[:battery]).columns
      else
          @columns = Battery.all
      end
      if request.xhr?
          respond_to do |format|
              format.json {
                  render json: {columns: @columns}
              }
          end
      end
  end

  # Method to get elevators related to a selected column
  def get_elevator
      if params[:column].present?
          @elevators = Column.find(params[:column]).elevators
      else
          @elevators = Column.all
      end
      if request.xhr?
          respond_to do |format|
              format.json {
                  render json: {elevators: @elevators}
              }
          end
      end
  end
end