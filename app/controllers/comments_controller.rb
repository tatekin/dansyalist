class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to "/tweets/#{comment.tweet_id}"
  end

  private
    def comment_params
      params.permit(:text, :tweet_id).merge(user_id: current_user.id)
    end
end
