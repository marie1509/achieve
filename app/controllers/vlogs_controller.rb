class VlogsController < ApplicationController
  before_action :set_vlog, only: [:show, :edit, :update, :destroy]
  
  def index
    @vlogs=Vlog.all
  end
  
  def new
    @vlog=Vlog.new #モデルのインスタンス
  end
  
  def create
    #Vlog.create(vlog_params)
   # redirect_to new_vlog_path
   
   @vlog = Vlog.new(vlog_params)
    
   if @vlog.save
      redirect_to vlogs_path, notice:"ブログを作成しました！"
    
   else
     render 'new'
   end
  end
  
  def show
    set_vlog #idを取得
  end
  
  def edit
    set_vlog #idを取得
  end
  
  def update
    set_vlog #idで更新したいブログの値を取得
    
    if @vlog.update(vlog_params) #updateに引数を与えると、その引数の値で更新することができる
      redirect_to vlogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @vlog.destroy 
    redirect_to vlogs_path, notice:"ブログを削除しました！"
  end
  
  private
  def vlog_params
    params.require(:vlog).permit(:title, :content)
  end
  
  def set_vlog
    @vlog=Vlog.find(params[:id]) 
  end
end
