class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, only: [:create]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  private

  def user_admin?
    unless current_user.role == "admin"
      flash[:notice] = "You don't have admin rights."
      redirect_to orders_path
    end
  end
end
