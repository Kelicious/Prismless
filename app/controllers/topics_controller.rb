class TopicsController < ApplicationController
  def index
    @topics = Topic.where(forum_id: params[:forum_id])
    render json: @topics.to_json(include: :posts)
  end

  def create
    topic = current_user.topics.new(params[:topic])
    topic.forum_id = params[:forum_id]
    if topic.save
      render json: topic.to_json(include: :posts)
    else
      render json: topic.errors, status: 422
    end
  end

  def show
    @topic = Topic.find(params[:id])
    render json: @topic.to_json(include: :posts)
  end
end
