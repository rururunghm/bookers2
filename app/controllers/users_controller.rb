class UsersController < ApplicationController
  
  protect_from_forgery
  
  def index
    @user = User.all
  end
  
  
  def create
    @user = User.index
    @user.user_id = current_user.id
    @user.save
    redirect_to user_path
  end
  
  def edit
  end
  
  def show
    
  end
  
  private

  def user_params
    params.require(:user).permit(:title, :body)
  end
end
