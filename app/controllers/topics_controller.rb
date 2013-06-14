class TopicsController < ApplicationController
  def index
    @forum = Forum.find(params[:forum_id])
    
    authenticate_privacy(@forum)

    @topics = @forum.topics.page params[:page]
  end

  def new
    @forum = Forum.find(params[:forum_id])

    authenticate_privacy(@forum)

    @topic = @forum.topics.new
    @topic.posts.build
  end

  def create
    @topic = current_user.topics.new(params[:topic])
    @topic.forum_id = params[:forum_id]

    authenticate_privacy(@topic)

    if @topic.save
      redirect_to @topic
    else
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    authenticate_privacy(@topic)
  end
end
