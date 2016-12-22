class AttractionsController < ApplicationController
  before_action :set_attraction, only:[:show, :update, :destroy]
  

  def new
    @attraction = Attraction.new
  end

  def index
    @attractions = Attraction.all
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    end
  end

  def show
   @ride = Ride.new
  end

  def edit
  end
   
   def update
    @attraction.update(attraction_params)
    redirect_to @attraction
   end

  def destroy
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
  end
end
