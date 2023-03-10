class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    return true
  end

  def copy?
    return create?
  end

  def new?
    return create?
  end

  def create?
    user.admin? || record.user == user
  end

  def edit?
    return update?
  end

  def update_translations?
    return update?
  end

  def update?
    user.admin? || record.user == user
  end

  def destroy?
    user.admin? || record.user == user
  end
end
