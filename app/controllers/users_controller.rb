class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show, :edit, :update]
  

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
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

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールを更新しました。"
      redirect_to @user
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:lastname, :firstname, :username, :password, :password_confirmation, :agreement)
  end

end
