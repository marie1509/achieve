module UsersHelper
  def user
    @user = User.new(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:image)
  end
end
