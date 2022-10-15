class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :search, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def login_check
    if current_user.nil?
      redirect_to new_user_session_path, notice: "ログインまたは新規登録が必要です。"
    end
  end
end
