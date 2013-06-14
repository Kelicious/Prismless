class MembershipsController < ApplicationController
  def new
    @community = Community.find(params[:community_id])
  end

  def create
    @community = Community.find(params[:community_id])
    if @community.authenticate(params[:password])
      flash[:success] = "Authenticated successful"
      @community.members << current_user
      redirect_to @community
    else
      flash[:error] = "Authentication failed"
      redirect_to root_url
    end
  end
end
