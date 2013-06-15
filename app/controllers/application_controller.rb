class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :store_location

  def store_location
    path = request.fullpath
    unless path =~ /\/users/ || path =~ /\/memberships/
      session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
    end
  end

  def redirect_back_or(default)
    redirect_to session[:previous_url] || default
    session.delete(:previous_url)
  end

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
      redirect_back_or root_url
    end
  end
end
