class EmailListsController < ApplicationController
  def new
    @email_list = EmailList.new
  end

  def create
    @email_list = EmailList.new(email_list_params)
    @email_list.creator_id = current_user.id
    if @email_list.save
      flash[:notice] = "#{@email_list.name} was added to home's list."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    
  end

  def show
    @email_list = EmailList.find(params[:id])
  end

  def update
    
  end

  def destroy
    
  end

  private

  def email_list_params
    params.require(:email_list).permit(:email, :name)
  end
end