class Admin::CategoryPolicy < ApplicationPolicy
  def edit?
    user.is_admin? if user
  end

  def destroy?
    user.is_admin? if user
  end
end
