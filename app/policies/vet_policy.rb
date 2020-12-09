class VetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.id == record.user_id
  end

  def show?
    true
  end

  def edit?
    user.id == record.user_id
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private
    def user_is_owner_or_admin?
      user.id == record.user_id || user.admin
    end
end
