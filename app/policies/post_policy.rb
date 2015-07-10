class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def new?
    user && user.admin?
  end

  def create?
    user && user.admin?
  end

  def edit?
    user && user.admin? or not post.published?
  end

  def update?
    user && user.admin? or not post.published?
  end

  def destroy?
    user && user.admin? or not post.published?
  end
end
