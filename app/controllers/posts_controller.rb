class PostsController < ApplicationController
  def index
    @posts = Post.all.sort_by{ |object| [object.created_at] }.reverse
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Your entry has been successfully added."
      redirect_to posts_path
    else
      flash[:alert] = "Something went wrong with creating your entry. Try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Your entry has been updated."
      redirect_to post_path(@post)
    else
      flash[:alert] = "There was a problem updating your entry. Please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
