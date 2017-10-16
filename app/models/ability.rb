class Ability
  include CanCan::Ability

  def initialize user
    @user ||= User.new
    if @user.role.admin?
      admin_roles
    elsif @user.role.user?
      user_roles
    else
      guest_roles
    end
  end

  private
    def admin_roles
      can :manage, User
      can :create, User
      can :manage, Type
      can :read, Ad
      can :destroy, Ad
      can :update, Ad
    end

    def user_roles
      can :create, Ad, user_id: @user.id
      can :read, Ad
      can :open, Ad
      can :update, Ad, user_id: @user.id, :state => ['draft', 'archieved']
      can :destroy, Ad, user_id: @user.id, :state => ['draft', 'new', 'verified', 'published']
      cannot :edit, Type
    end

    def guest_roles
      can :read, Ad
      cannot :edit, Ad
    end
end
 