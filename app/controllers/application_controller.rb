class ApplicationController < ActionController::Base
  #this method is simply print "hello, world!" on server
  def hello
    render html: "hello, world!"
  end
end
