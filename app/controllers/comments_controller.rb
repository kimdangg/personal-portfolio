class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @comment = @post.comments.new(comment_params)
    @user.comments.push(@comment)
    if @comment.save
      flash[:notice] = "Your comment has been added!"
    else
      flash[:alert] = "There was a problem adding your comment. Please try again."
    end
    redirect_to post_path(@post)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
