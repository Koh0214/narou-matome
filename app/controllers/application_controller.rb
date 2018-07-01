class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def root
    render html: "rails_appへようこそ!"
  end


  private

    # ログイン後のリダイレクト先
    def after_sign_in_path_for(resource_or_scope)
      root_path
    end

    # ログアウト後のリダイレクト先
    def after_sign_out_path_for(resource_or_scope)
      root_path
    end


  protected

    def configure_permitted_parameters
      added_attrs = [ :name, :email, :password, :password_confirmation]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
end
