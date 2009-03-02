class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.author = Author.find(2)
    @comment.save
    redirect_to @post
  end
end
