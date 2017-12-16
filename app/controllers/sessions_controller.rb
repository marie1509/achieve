class SessionsController < ApplicationController
  def new
  end

  def create
    #find_byメソッドはカラム名必須
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      #ログインに成功した場合
      #ユーザーのブラウザ内のcookiesに暗号化されたユーザーIDが自動で生成される
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      #ログインに失敗した場合
      flash[:danger] = "ログインに失敗しました"
      redirect_to new_session_path 
    end
  end

  def destroy
   session.delete(:user_id)
   flash[:notice] = 'ログアウトしました'
   redirect_to new_session_path
  end

end
