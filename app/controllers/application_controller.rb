class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  private

  def current_admin
    @current_admin ||= current_user.admin if user_signed_in?
  end
  helper_method :current_admin
end
