class UsersController < ApplicationController
    before_action :set_user, only:[:show, :update]
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
  end

  def create
   @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
    redirect_to @user
    else
    render 'new'
    end
  end

  def show
   @user = User.find(params[:id])
  redirect_to root_path unless  logged_in? 
  #binding.pry
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end
 
  def destroy
     
  end
   

   private

   def set_user
    @user = User.find(params[:id])
   end

   def user_params
    params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :admin, :password)
   end
end
