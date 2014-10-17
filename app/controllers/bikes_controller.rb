class BikesController < ApplicationController

  before_action :authenticate_user!

  def create
    bike = Bike.new(bike_params)
    bike.user_id = current_user.id
    if (bike.save)
      redirect_to user_path(bike.user_id)
    else
      render "users/show"
    end

  end

  def destroy
    bike = Bike.find(params[:id])
    if (bike.user_id == current_user.id)
      bike.destroy
      redirect_to user_path(bike.user_id)
    else
      redirect_to users_path
    end
  end

  def bike_params()
    params.require(:bike).permit(:color, :user_id)
  end

end
