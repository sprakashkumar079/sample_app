class UsersController < ApplicationController
  # define a logged_in_user method and invoke it using before_action :logged_in.
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  #index method to getting all users .
  def index
    @users = User.paginate(page: params[:page])
  end

  #this is show action for call an user.
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
      #first activate your account .
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
      # Handle a successful save.
    else
      render 'new'
    end
  end

  #edit the profile
  def edit
    @user = User.find(params[:id])
  end

  #update the profile by users
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  #here we can call the method who delete the use by destroy method.
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
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

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
