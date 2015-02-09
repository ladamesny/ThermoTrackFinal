class ThermometersController < ApplicationController
  before_action :set_thermometer, except: [:new, :index, :create]
  before_action :set_house
  before_action :require_same_user
  layout "thermometerHome"


  def index
    @thermometers = @house.thermometers.all
  end

  def show
    @readings = @thermometer.readings.all
    render layout: "showreadings"
  end

  def new
    @thermometer = @house.thermometers.new(email_list_ids: EmailList.find_by(name: current_user.name).id)
  end

  def create
    @thermometer = @house.thermometers.build(thermometer_params)

    if @thermometer.save
      respond_to do |format|
        flash.now[:notice] = "#{@thermometer.name} thermometer was added!"
        format.html {redirect_to house_thermometers_path}
        format.js
      end
    else
      respond_to do |format|
        flash.now[:alert] = "#{@thermometer.name} thermometer was not added!"
        format.html{ redirect_to house_thermometers_path}
        format.js {render 'fail_create.js.erb'}
      end
    end
  end

  def edit
    
  end

  def update
    if @thermometer.update(thermometer_params)
      respond_to do |format|
        format.html {redirect_to house_thermometers_path, notice: "Thermometer update added!"}
        format.js
      end
    else
      respond_to do |format|
        format.html{ redirect_to house_thermometers_path, alert: 'Unable to update thermometer'}
        format.js {render 'fail_create.js.erb'}
      end
    end

  end

  def destroy
      if @thermometer.destroy
        respond_to do |format|
          flash.now[:alert] = "#{@thermometer.name} thermometer was deleted!"
          format.html {redirect_to house_thermometers_path}
          format.js
          end
      else
        respond_to do |format|
          flash.now[:alert] = "#{@thermometer.name} thermometer could not be deleted!"
          format.html {redirect_to house_thermometers_path}
          format.js { render 'fail_create.js.erb'}
          end        
      end
  end

  def upread
    @thermometer.readings_on = !@thermometer.readings_on
    if @thermometer.save
      respond_to do |format|
        flash.now[:notice] = "#{@thermometer.name}'s thermometer readings status was changed!"
        format.html {redirect_to house_thermometers_path}
        format.js
      end
    else
      respond_to do |format|
        flash.now[:notice] = "#{@thermometer.name}'s thermometer readings status was not changed!"
        format.html{ redirect_to house_thermometers_path}
        format.js {render 'fail_create.js.erb'}
      end
    end
  end

  def removereads
    @thermometer.delete_readings
    respond_to do |format|
      flash.now[:alert] = "#{@thermometer.name}'s theremometer readings were deleted."
      format.js {render 'removereads.js.erb'}
    end

  end

  private

  def set_thermometer
    @thermometer = Thermometer.find(params[:id])
  end

  def thermometer_params
    params.require(:thermometer).permit( :name, :max_temp, :min_temp, :readings_on, email_list_ids:[])
  end

  def set_house
    @house = House.find(params[:house_id])
  end

  def require_same_user
    if current_user != @house.user
      flash[:error] = "You are not the owner of that house"
      redirect_to root_path
    end
  end

end