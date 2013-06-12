class ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end

  def new
    @category = Category.find(params[:category_id])
    @forum = @category.forums.new
  end

  def create
    @forum = Forum.new(params[:forum])
    @forum.category = Category.find_by_slug(params[:category_id])
    if @forum.save
      redirect_to @forum
    else
      render :new
    end
  end

  def show
    @forum = Forum.find(params[:id])
  end
end
