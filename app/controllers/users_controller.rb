class UsersController < ApplicationController
  before_action :is_Admin, only: [:index]
  before_action :is_AdminOrCurrentUser, except: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to @user
    else
       render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, status: :see_other
  end

  private
    def is_Admin
       if !(session[:user_id] and Current.user.admin_user)
          redirect_to articles_path
       end
    end 

    def is_AdminOrCurrentUser
      if !((session[:user_id] and Current.user.admin_user) || (Current.user.id == params[:id].to_i))
         redirect_to articles_path
      end
    end

    def user_params
      params.require(:user).permit(:name,:dob,:photo,:password,:password_confirmation,:admin_user)
    end
end
