class ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end

  def new
    if (id = params[:category_id])
      category = Category.find(params[:category_id])
      @forum = category.forums.new
    else
      @forum = Forum.new
    end
  end

  def create
    @forum = Forum.new(params[:forum])
    if @forum.save
      redirect_to @forum.community
    else
      render :new
    end
  end

  def show
    @forum = Forum.find(params[:id])
  end

  def edit
    @forum = Forum.find(params[:id])
  end

  def update
    @forum = Forum.find(params[:id])
    if @forum.update_attributes(params[:forum])
      redirect_to @forum.community
    else
      render :edit
    end
  end

  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy
    redirect_to @forum.community
  end
end
