class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user).includes(:outfits)
    end
  end

  def show?
    record.user == user
  end

  def update?
    record.user == user
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end
end
