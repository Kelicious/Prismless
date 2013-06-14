class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_privacy(authenticatable)
    unless authenticatable.visible_to?(current_user)
      flash[:error] = "This community is private"
      community = (authenticatable.class == Community) ? authenticatable : authenticatable.community
      redirect_to new_community_membership_path(community)
    end
  end

  def authenticate_admin(authenticatable)
    community = (authenticatable.class == Community) ? authenticatable : authenticatable.community
    unless community.has_admin?(current_user)
      flash[:error] = "Insufficient privileges"
      redirect_to root_url
    end
  end
end
