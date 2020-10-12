class ToppagesController < ApplicationController
  def index
    if logged_in?
      @search = Micropost.ransack(params[:q])
      @microposts = @search.result
    end
  end
end
