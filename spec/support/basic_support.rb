module BasicSupport
  def basic(path)
    username = ENV["BASIC_AUTH_USER"] 
    password = ENV["BASIC_AUTH_PASSWORD"]
    
    # basic認証に必要な情報を含めてリクエストを送る
    get path, headers: { 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(username, password) }
  end
end