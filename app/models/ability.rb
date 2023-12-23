class Ability
  include CanCan::Ability
  include ActiveAdminRole::CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new

    if user.admin_user?
      can :manage, :all
      cannot [:create, :update, :destroy], Leave
    else
      register_role_based_abilities(user)
    end

    # NOTE: Everyone can read the page of Permission Deny
    can :read, ActiveAdmin::Page, name: "Dashboard"
  end
end
