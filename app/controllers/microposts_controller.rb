class MicropostsController < ApplicationController
  before_action :require_logged_in

  def new
    @micropost = Micropost.new
  end 

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
       flash[:success] = "投稿されました。"
       redirect_to current_user
    else
      render :new
    end  
  end

  def destroy
  end


  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end 
end
