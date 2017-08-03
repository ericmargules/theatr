class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  layout "theatr"

  private

  def user_admin
  	redirect_to root_path if !current_user.try(:admin?)
  end
end
