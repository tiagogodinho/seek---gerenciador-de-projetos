class HomeController < ApplicationController
  def index
    if logged_in?
      @projetos = current_users.projetos.all(:order => "Nome")
      render :layout => "principal", :action => "dashboard"
    end
  end
end