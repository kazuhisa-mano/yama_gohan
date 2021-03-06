class PostCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    post_comment = PostComment.new(post_comment_params)
    post_comment.user_id = current_user.id

    post = Post.find(params[:post_id])
    post_comment.post_id = post.id

    post_comment.save
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:post_id])
    post_comment = post.post_comments.find(params[:id])
    if post_comment.user == current_user
      post_comment.destroy
    end  
    redirect_to post_path(post.id)
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end