class CommentsController < ApplicationController
  def create
    @post = Post.find_by_permalink(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user = current_user
    @comment.save_with_user(current_user)
    redirect_to @post
  end
end
