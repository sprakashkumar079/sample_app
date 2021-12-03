=begin
  Classes are simply a convenient way to organize functions (also called meth-
  ods) like the home and help actions, which are defined using the def key-
  word which are defined using the def key-word.
=end

class StaticPagesController < ApplicationController
  #home has a corresponding view called home.html.erb and this is called action.
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  #Help has a corresponding view called help.html.erb .
  def help
  end
  #about has a corresponding view called about.html.erb .
  def about
  end

  #contact has a corresponding view called contact.html.erb .
  def contact
  end

end