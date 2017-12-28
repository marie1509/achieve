class UsersController < ApplicationController
  def new
    #ユーザー登録フォーム作成のためのインスタンス
    @user = User.new
  end

  def show
    #headerのProfileボタンを押すと現在ログインしているユーザーのidが送信されるのでそれを取得
    @user = User.find(params[:id])

    #rails cでuser.favorite_vlogsを試すとちゃんとお気に入りしたブログが取得できるのになぜ？
    @vlogs = @user.favorite_vlogs

  end

  def create
    #createアクションで最初に行うことはユーザーがフォームに入力した値で
    #Userモデルの新しいインスタンスを生成すること
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
