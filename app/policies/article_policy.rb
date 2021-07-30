class ArticlePolicy < ApplicationPolicy
  def edit?
    user.is_admin? if user
  end

  def destroy?
    user.is_admin? if user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
