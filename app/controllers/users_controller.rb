class UsersController < ApplicationController
  
  
  protect_from_forgery
  
  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @book = @user.book
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  
  def create
    @user = User.index
    @user.user_id = current_user.id
    @user.save
    redirect_to user_path
  end
  
  private

  def user_params
    params.require(:user).permit(:title, :body)
  end

end
