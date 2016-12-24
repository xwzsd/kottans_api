class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def api_request?
    request.format.symbol == :json && !devise_controller?
  end

  def doorkeeper_unauthorized_render_options(error: nil)
    { json: { error: "Not authorized" } }
  end
end
