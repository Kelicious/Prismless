class VotesController < ApplicationController
  def create
    opts = {post_id: params[:post_id], user_id: current_user.id}
    vote = Vote.find(:first, conditions: opts) || Vote.new(opts)
    if vote.value == 1
      flash[:error] = "Already voted this post"
    elsif (vote.value = 1) && vote.save
      flash[:success] = "Upvoted!"
    else
      flash[:error] = vote.errors.full_messages.join("<br>")
    end

    redirect_back_or Post.find(params[:post_id]).topic
  end

  def destroy
    opts = {post_id: params[:post_id], user_id: current_user.id}
    vote = Vote.find(:first, conditions: opts) || Vote.new(opts)
    if vote.value == -1
      flash[:error] = "Already downvoted this post"
    elsif (vote.value = -1) && vote.save
      flash[:notice] = "Downvoted!"
    else
      flash[:error] = vote.errors.full_messages.join("<br>");
    end

    redirect_back_or Post.find(params[:post_id]).topic
  end
end
