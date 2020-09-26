class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:sucesee]= "登録が完了しました"
      redirect_to @user
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:lastname, :firstname, :username, :password, :password_confirmation, :agreement)
  end

end
