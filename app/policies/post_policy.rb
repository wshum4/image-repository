class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def create?
      return true
    end

    def destroy?
      record.user == user
    end

    def resolve
      scope.all
    end
  end
end
