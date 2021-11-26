class SessionsController < ApplicationController
  #for new
  def new
  end
  #for this checking user login or not
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user # a remember method that calls user.remember
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  #for logout for user
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
