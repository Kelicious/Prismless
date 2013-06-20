class ForumsController < ApplicationController
  def new
    category = Category.find(params[:category_id])
    authenticate_admin(category)
    @forum = category.forums.new
  end

  def create
    @forum = Forum.new(params[:forum])
    authenticate_admin(@forum)
    if @forum.save
      redirect_to @forum.community
    else
      render :new
    end
  end

  def show
    @forum = Forum.find(params[:id])
    authenticate_privacy(@forum)
    @topics = @forum.topics.by_pinned.page params[:page]
  end
  
  def edit
    @forum = Forum.find(params[:id])
    authenticate_admin(@forum)
  end

  def update
    @forum = Forum.find(params[:id])
    authenticate_admin(@forum)
    if @forum.update_attributes(params[:forum])
      redirect_to @forum.community
    else
      render :edit
    end
  end

  def destroy
    @forum = Forum.find(params[:id])
    authenticate_admin(@forum)
    @forum.destroy
    redirect_to @forum.community
  end
end
