class UsersController < ApplicationController
  def index
  if current_user.user_admin == true
    @users = User.all
  else
    redirect_to root_path, notice: "You are not authorized to view this page"
  end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end
  
  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
    
  end


  private

    def user_params
      params.require(:user).permit(:user_admin, :email, :encrypted_password,
      :reset_password_token, :reset_password_sent_at, :remember_created_at,
      :created_at, :updated_at, :super_admin, )
    end
end
