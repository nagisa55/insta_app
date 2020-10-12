class MicropostsController < ApplicationController
  before_action :require_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @search = Micropost.ransack(params[:q])
    @microposts = @search.result

  end 

  def new
    @micropost = Micropost.new
  end 
  
  def show
    @micropost = Micropost.find_by(params[:id])
    @user = @micropost.user
    @comments = @micropost.comments
    @comment = current_user.comments.new
  end 

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
       flash[:success] = "投稿されました。"
       redirect_to @micropost
    else
      render :new
    end  
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました。"
  end


  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end 

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to current_user
    end
  end
end
