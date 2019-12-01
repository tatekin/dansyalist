class CommentsController < ApplicationController
def create
  tweet = Tweet.find(params[:tweet_id])
  @comment = tweet.comments.build(comment_params)
  if @comment.save
    redirect_back(fallback_location: tweet_path(tweet))
  else
    flash[:danger] = "入力してください"
    redirect_back(fallback_location: tweet_path(tweet))
  end
end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    @comment = tweet.comments.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: tweet_path(tweet))
  end

  private
    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id)
    end
end
