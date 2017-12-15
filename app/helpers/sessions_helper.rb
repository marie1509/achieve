module SessionsHelper
  #ログイン中のユーザーを取得するメソッド
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    #!を前につけるとfalseを返す
    #current_userがnilか？という意味
    !current_user.nil?
  end
end
