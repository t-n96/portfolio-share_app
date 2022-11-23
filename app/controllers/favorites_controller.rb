class FavoritesController < ApplicationController

  def create
    @post_favorite = current_user.favorites.create(post_id: params[:post_id])
    @post_favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post_favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    post_favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
