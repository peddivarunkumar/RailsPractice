class RegistrationsController < ApplicationController
  before_action :checkIfSignedIn , only: [:new]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
       session[:user_id] = @user.id
       redirect_to root_path
    else
        render :new, status: :unprocessable_entity
    end
  end

  
  private 
  def checkIfSignedIn
    if session[:user_id]
      redirect_to root_path
    end
  end
  def user_params
   params.require(:user).permit(:name,:password,:password_confirmation,:dob,:photo,:admin_user)
 end
end