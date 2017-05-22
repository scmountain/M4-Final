class Permission
  extend Forwardable
  attr_reader :user, :controller, :action

  def_delegators :user, :registered_user?,


  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action)
    @controller = controller
    @action = action

    case
    when user.registered_user?
      registered_user_permissions
    else
      guest_user_permissions
    end
  end

  private

  def guest_user_permissions
    return true if controller == "home"
    return true if controller == "sessions"
    return true if controller == "users" && action.in?(["new", "create"])
  end
end
