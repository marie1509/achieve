class UsersController < ApplicationController
  def new
    #ユーザー登録フォーム作成のためのインスタンス
    @user = User.new
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

  def show
    #paramsメソッドで表示するユーザーのidを取得
    @user = User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
