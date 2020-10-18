class UsersController < ApplicationController
  before_action :require_logged_in, only: [:index, :edit, :update, :destroy, :folloeing, :followers]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) 
    @microposts = @user.microposts 
    @micropost = Micropost.new  
    @comments = @micropost.comments  
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:sucesee]= "登録が完了しました"
      login @user
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

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "アカウントを削除しました。"
    redirect_to root_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end 

  def follower
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end 

  private

  def user_params
    params.require(:user).permit(:lastname, :firstname, :username, :email, :tel, :introduction, :password, :password_confirmation)
  end

end
