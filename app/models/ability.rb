class Ability
  include CanCan::Ability

  def initialize(user)
   
    user ||= User.new # guest user
        if user.role? :Administrador
          can :manage, :all
        elsif user.role? :Empleado
          can :manage, [Rent,RentDetail]
        end
  end
end
