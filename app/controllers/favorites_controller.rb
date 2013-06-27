class FavoritesController < ApplicationController
  def create
    community = Community.find(params[:community_id])

    authenticate_privacy(community)

    favorite = community.favorites.new(user_id: current_user.id)
    if favorite.save
      flash[:success] = "Favorited!" unless request.xhr?
    else
      flash[:error] = "Invalid action" unless request.xhr?
    end

    if request.xhr?
      render json: {isFavorite: current_user.favorited?(community)}
    else
      redirect_back_or community
    end
  end

  def destroy
    community = Community.find(params[:community_id])
    favorite = community.favorites.find_by_user_id(current_user.id)
    if favorite
      favorite.destroy
      flash[:success] = "Removed from favorites!" unless request.xhr?
    else
      flash[:error] = "Invalid action" unless request.xhr?
    end

    if request.xhr?
      render json: {isFavorite: current_user.favorited?(community)}
    else
      redirect_back_or community
    end
  end
end
