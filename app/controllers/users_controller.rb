class UsersController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @users = User.all
    @user = User.new

  end

  def create
    user = User.new(user_params)

    if (user.save)
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @bikes = @user.bikes
    @bike = Bike.new
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

end
