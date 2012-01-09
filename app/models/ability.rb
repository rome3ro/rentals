class Ability
  include CanCan::Ability

  def initialize(user)
   
    user ||= User.new # guest user
        if user.role? :admin
          can :manage, :all
        elsif user.role? :employer
          can :manage, [Rent,RentDetail]
        end
  end
end
