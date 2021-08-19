class Admin::CategoryPolicy < ApplicationPolicy
  included do
    %w(edit? destroy?).each do |method_name|
      define_method method_name do
        user.is_admin? if user
      end
    end
  end
end
