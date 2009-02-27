# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  
  def login
    
    if logged_in?
      redirect_to projetos_path
    else
      logout_keeping_session!
      users = Pessoa.authenticate(params[:login], params[:password])
      if users
        # Protects against session fixation attacks, causes request forgery
        # protection if user resubmits an earlier form using back
        # button. Uncomment if you understand the tradeoffs.
        # reset_session
        self.current_users = users
        new_cookie_flag = (params[:remember_me] == "1")
        handle_remember_cookie! new_cookie_flag
        
        #Atualiza a data do último acesso
        users.update_attribute(:UltimoAcesso, Time.now.strftime("%Y-%m-%d %H:%M:%S"))
        
        redirect_back_or_default projetos_path
      else
        note_failed_signin
        @login       = params[:login]
        @remember_me = params[:remember_me]
        render :action => 'login'
      end
    end
  end

  def destroy
    logout_killing_session!
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end

protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Couldn't log you in as '#{params[:login]}'"
    logger.warn "Failed login for '#{params[:login]}' from #{request.remote_ip} at #{Time.now.utc}"
  end
end
