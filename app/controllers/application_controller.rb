class ApplicationController < ActionController::Base
  before_action :basic_auth
  
  # jsに公開鍵を直接変数で送る
  # ビューでの記述も必要
  before_action :public_item

  before_action :configure_permitted_parameters, if: :devise_controller?
 
  private
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # ユーザー名とパスワードの設定を行いサイトにアクセスするユーザーへBasic認証を行う
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end
  
  def public_item
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  # deviseへ新たに追加するメソッドをconfigure_permitted_parametersというメソッドで作ることが慣習
  def configure_permitted_parameters
    # deviseの受け取れるパラメーターの宣言に新しいパラメーターを追加するメソッド
    # 第一引数にサインインサインアップアカウント情報の更新のどれかを記載　第三引数に追加したいカラム名のキーを記述する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end
end