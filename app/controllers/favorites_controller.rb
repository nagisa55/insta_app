class FavoritesController < ApplicationController
  before_action :set_micropost
  before_action :require_logged_in

  def create
    if @micropost.user_id != current_user.id 
      @micropost = Micropost.find(params[:micropost_id])
      @micropost.like(current_user)
      respond_to :js
    end
  end

  def destroy
    @micropost = Favorite.find(params[:id]).micropost
    @micropost.unlike(current_user)
    respond_to :js
  end

  private

  def set_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end

end
