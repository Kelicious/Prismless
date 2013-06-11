class TopicsController < ApplicationController
  def index
    @topics = Topic.where(forum_id: params[:forum_id])
    render json: @topics.to_json(include: :posts)
  end

  def show
    @topic = Topic.find(params[:id])
    render json: @topic.to_json(include: :posts)
  end
end
