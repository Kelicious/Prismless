class CommunitiesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(params[:community])
    @community.admins << current_user
    if @community.save
      redirect_to @community
    else
      render :new
    end
  end

  def show
    @community = Community.find(params[:id])
    authenticate_privacy(@community)
  end
end
