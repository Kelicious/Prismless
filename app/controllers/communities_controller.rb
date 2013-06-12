class CommunitiesController < ApplicationController
  def index
    @communities = Community.all
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(params[:community])
    if @community.save
      redirect_to @community
    else
      render :new
    end
  end

  def edit
    @community = Community.find(params[:id])
  end

  def show
    @community = Community.find(params[:id])
  end
end
