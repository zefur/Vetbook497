class PetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user == record
  end
  def create?
    true
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

  def destroy?
    user_is_owner_or_admin?
  end

  private
    def user_is_owner_or_admin?
      user == record.user || user.admin
    end
end
