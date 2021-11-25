class UsersController < ApplicationController
  #this is show action for call all the users
  def show
    @user = User.find(params[:id])
  end
  #creating a valid new user
  def new
    @user = User.new
  end
  # creating a new user and also save if valid information is given by user
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end
  #user_params method is de-signed to make it visually apparent
  #which methods are defined after private
  private
    def user_params
      params.require(:user).permit(:name,
                                   :email,
                                   :password,
                                   :password_confirmation)
    end
end
