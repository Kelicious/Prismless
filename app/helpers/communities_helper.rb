module CommunitiesHelper
  def favorite_button_for(community)
    link_to "Favorite", community_favorites_path(community), method: :post, class: current_user.favorited?(community) ? 'favorite hidden' : 'favorite'
  end

  def unfavorite_button_for(community)
    link_to "Unfavorite", community_favorites_path(community), method: :delete, class: current_user.favorited?(community) ? 'unfavorite' : 'unfavorite hidden'
  end
end
