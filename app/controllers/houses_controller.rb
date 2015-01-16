class HousesController < ApplicationController
  before_action :set_house, except: [:index, :new, :create]
  before_action :requrie_same_user, only: [:edit, :destroy]
  def index
    @houses = []
    House.all.each do |house|
      if house.user == current_user
        @houses << house
      end
    end
  end

  def show
    redirect_to controller: 'thermometers', action: 'index'
  end

  def new
    @house = current_user.houses.new
  end

  def create
    @house = current_user.houses.build(house_params)
    if @house.save
      respond_to do |format|
        format.html {redirect_to houses_path, notice: "House was added!"}
        format.js
      end
    else
      respond_to do |format|
        format.html{ redirect_to houses_path, alert: 'Unable to add House'}
        format.js {render 'fail_create.js.erb'}
      end
    end

  end

  def edit
    
  end

  def update
    @house.update(house_params)
   if @house.save
      flash[:notice] = "#{@house.name} was updated!"
      redirect_to houses_path
    else
      flash[:notice] = "Sorry, house could not be updated. Please try again."
      render :edit
    end
  end

  def destroy
    @house.destroy
    flash[:notice] = "House was deleted!"
    respond_to do |format|
      format.html {redirect_to house_path}
      format.js
    end    
  end

  protected

  def house_params
    params.require(:house).permit(:name, :time_zone)
  end

  def set_house
    @house = House.find(params[:id])
  end

  def requrie_same_user
    if current_user != @house.user
      flash[:error] = "You are not the owner of that house"
      redirect_to root_path
    end
  end

end