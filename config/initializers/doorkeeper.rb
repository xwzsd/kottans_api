Doorkeeper.configure do
  # Change the ORM that doorkeeper will use (needs plugins)
  orm :active_record

  # This block will be called to check whether the resource owner is authenticated or not.
  resource_owner_authenticator do
    # Put your resource owner authentication logic here.
    # Example implementation:
    User.find_by_id(session[:user_id]) || redirect_to(new_user_session_url)
    #User.find_by_id(session[:current_user_id]) || redirect_to(login_url)
  end
end
