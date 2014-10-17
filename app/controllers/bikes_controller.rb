class BikesController < ApplicationController

  before_action :authenticate_member!
  
  def create
    bike = Bike.new(bike_params)

    if (bike.save)
      redirect_to root_path
    else
      render "users/show"
    end

  end

  def destroy
    #Bike params what
    bike = Bike.find(params[:id])
    bike.destroy
    redirect_to user_path(bike.user_id)
  end

  def bike_params()
    params.require(:bike).permit(:color, :user_id)
  end

end
