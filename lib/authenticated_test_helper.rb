module AuthenticatedTestHelper
  # Sets the current users in the session from the users fixtures.
  def login_as(users)
    @request.session[:users_id] = users ? (users.is_a?(Users) ? users.id : users(users).id) : nil
  end

  def authorize_as(users)
    @request.env["HTTP_AUTHORIZATION"] = users ? ActionController::HttpAuthentication::Basic.encode_credentials(users(users).login, 'monkey') : nil
  end
  

end
