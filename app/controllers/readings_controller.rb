class ReadingsController < ApplicationController
 
  def index
    @readings = []
    @house = House.find(params[:house_id])
    @house.thermometers.each do |therm|
      therm.readings.each do |reading|
        @readings << reading
      end    
    end

  end

  def new
  end

  def create    
  end

  def removelist
  
    if params[:format]
      @reading = Reading.find(params[:format])
      @house = @reading.thermometer.house 
      @house.thermometers.each do |therm|
        therm.readings.delete_all
        therm.save
      end
      flash[:notice] = "Readings deleted."
      redirect_to house_thermometers_path(@house, @house.thermometers)
    else
      flash[:error] = "There are no readings to delete"
      redirect_to root_path
    end
  end
  
end