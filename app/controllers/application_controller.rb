class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  private
  # 新規登録時、emailとencrypted_password以外もストロングパラメーターとして許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday])
  end
end

