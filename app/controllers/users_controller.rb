class UsersController < ApplicationController
  def index
    @users = User.all.sort_by{ |object| [object.username ] }
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thank you for signing up!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
