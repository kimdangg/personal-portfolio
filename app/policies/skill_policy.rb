class SkillPolicy
  attr_reader :user, :skill

  def initialize(user, skill)
    @user = user
    @skill = skill
  end

  def new?
    user && user.admin?
  end

  def create?
    user && user.admin?
  end

  def edit?
    user && user.admin?
  end

  def update?
    user && user.admin?
  end

  def destroy?
    user && user.admin?
  end
end
