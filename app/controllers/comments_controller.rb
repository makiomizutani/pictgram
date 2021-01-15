class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end
  #binding.pry
  def create
    topic = Topic.find(comment_params[:topic_id])
    @comment = topic.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to topics_path, success:"投稿完了しました"
    else
      flash.now[:danger] = "投稿してください"
      render :new
    end
  end
  
  
  private
  def comment_params 
    params.require(:comment).permit(:content, :topic_id)
  end
end
  
  
  
