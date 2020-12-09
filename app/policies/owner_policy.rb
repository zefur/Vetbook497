class OwnerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def show?
      true
    end

    def edit?
      user == record
    end

    def update?
      user_is_owner_or_admin?
    end

    private

    def user_is_owner_or_admin?
      user == record.user
    end
end
