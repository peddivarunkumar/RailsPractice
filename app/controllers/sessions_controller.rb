class SessionsController < ApplicationController
  before_action :checkIfSignedIn , only: [:new]
  def new 
    @user = User.new
  end
  def create
    @user = User.find_by(name: params[:name])
    if @user.present? && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
    else
        render :new,status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path,status: :see_other
  end

  private
  def checkIfSignedIn
    if session[:user_id]
      redirect_to root_path
    end
  end
  def login_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end
end