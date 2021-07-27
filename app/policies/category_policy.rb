class CategoryPolicy < ApplicationPolicy

  def edit?
    user.is_admin? if user
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
