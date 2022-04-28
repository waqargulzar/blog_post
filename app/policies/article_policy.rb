class ArticlePolicy < ApplicationPolicy
  def edit?
    user_is_owner_of_record?
  end

  def update?
    user_is_owner_of_record?
  end

  def destroy?
    user_is_owner_of_record?
  end

  private

  def user_is_owner_of_record?
    @user.id == @record.user_id
  end
end
