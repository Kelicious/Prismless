class CategoriesController < ApplicationController
  def new
    @community = Community.find(params[:community_id])
    @category = @community.categories.new
  end

  def create
    @community = Community.find(params[:community_id])
    @category = @community.categories.new(params[:category])
    if @category.save
      redirect_to @community
    else
      render :new
    end
  end
end
