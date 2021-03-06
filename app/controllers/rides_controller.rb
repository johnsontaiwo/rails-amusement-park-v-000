class RidesController < ApplicationController

  def new
    @ride = Ride.new
  end
  
  def index

  end

  def create
    @ride = Ride.create(ride_params)
    @message = @ride.take_ride
    flash[:notice] =  @message
    redirect_to user_path(@ride.user)
  end
  
  def edit
  end

  def show
    @user = current_user
  end
  
  def destroy
  end

  private
  
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
