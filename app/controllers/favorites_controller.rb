class FavoritesController < ApplicationController

  before_action :set_create, only: [:create]
  before_action :set_destroy, only: [:destroy]

    def create
      @user = User.find(@vlog.user_id)

      favorite = current_user.favorites.create(vlog_id: params[:vlog_id])

      redirect_to vlogs_url, notice: "#{@user.name}さんのブログをお気に入り登録しました"

    end

    def destroy
      @user = User.find(@vlog.user_id)
      favorite = current_user.favorites.find_by(vlog_id: params[:id]).destroy
      redirect_to vlogs_url, notice: "#{@user.name}さんのブログをお気に入り解除しました"
    end

    private
    #お気に入り登録する時と解除する時で取得するデータが異なるのでそれぞれメソッドを定義する

    def set_create
      #お気に入り登録するためのメソッド
      @vlog = Vlog.find(params[:vlog_id])
    end

    def set_destroy
      #お気に入りボタンによって送信されたブログをidから取得する
     @vlog = Vlog.find(params[:id])
    end

end
