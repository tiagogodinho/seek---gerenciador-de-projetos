class HomeController < ApplicationController
  def index
    if logged_in?
      render :action => "dashboard"
    end
  end
end