class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   end

   def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました。"
      root_path
    else
      flash[:notice] = "新規登録が完了しました。"
      root_path
    end
   end
end
