class ToppagesController < ApplicationController
  def index
    if logged_in?
      @search = Micropost.ransack(params[:q])
      @microposts = @search.result
      @micropost = Micropost.find_by(params[:id])
    end
  end
end
