class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      about_path #ユーザー（自分）の詳細ページへ
    end

    ##サインアウト後はデフォルト設定どおりルートパスに遷移させるためafter_sign_out_path_forメソッドは記述しない。

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end

end