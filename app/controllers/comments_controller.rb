class CommentsController < ApplicationController
  https_basic_authente_with name: "Kay", password: "1234", only: [:destroy]

  def Create
    @post = Post.find(params[:post_id])
    @comment = @post.comment.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to posts_path(@post)
  end

  private def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
