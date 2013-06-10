class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    render json: @topics.to_json(include: :posts)
  end

  def show
    @topic = Topic.find(params[:id])
    render json: @topic.to_json(include: :posts)
  end
end
