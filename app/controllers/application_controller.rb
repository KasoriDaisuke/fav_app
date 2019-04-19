class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    root_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    # Rails.logger.debug("################")
    user_twitter_omniauth_authorize_path # ログアウト後に遷移するpathを設定
  end
end