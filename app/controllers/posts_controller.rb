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

  end

  def update

  end

  def destroy

  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
