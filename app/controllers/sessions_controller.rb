class SessionsController < ApplicationController
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
  def login_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end
end