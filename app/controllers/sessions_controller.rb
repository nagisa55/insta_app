class SessionsController < ApplicationController
  def new
  end

  def create
    username = params[:session][:username]
    password = params[:session][:password]
    if login(username, password)
      flash[:success] = "ログインに成功しました。"
      redirect_to @user
    else
      flash[:danger] = "ログインに失敗しました。"
      render :new
    end 
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "ログアウトしました。"
    redirect_to root_url
  end

  private

  def login(username, password)
    @user = User.find_by(username: username)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false 
    end
  end  

end
