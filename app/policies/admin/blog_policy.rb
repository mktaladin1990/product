class Admin::BlogPolicy < ApplicationPolicy
  attr_reader :blog
  def initialize(user, record)
    @user = user

  end
  # def check?
  #   user.login?
  # end
  def edit?
      user.present? && user.admin?
  end
  def update?
    user.present? && user.admin?
  end
  def create?
      user.present? && user.admin?
  end
  def new?
    user.present? && user.admin?
  end


end
