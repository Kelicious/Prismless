class FavoritesController < ApplicationController
  def create
    community = Community.find(params[:community_id])
    favorite = community.favorites.new(user_id: current_user.id)
    if favorite.save
      flash[:success] = "Favorited!"
    else
      flash[:error] = favorite.errors.full_messages.join("<br>")
    end

    redirect_back_or Community.find(params[:community_id])
  end

  def destroy
    community = Community.find(params[:community_id])
    favorite = community.favorites.find_by_user_id(current_user.id)
    if favorite
      favorite.destroy
      flash[:success] = "Removed from favorites!"
    else
      flash[:error] = "Invalid action"
    end

    redirect_back_or community
  end
end
