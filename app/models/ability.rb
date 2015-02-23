class Ability
  include CanCan::Ability

  def initialize(user)
   
    user ||= User.new # guest user
        if user.role? :Administrador
          can :manage, :all
        elsif user.role? :Empleado
          #can [:read, :create, :update], [Rent, RentDetail, Movie, Customer]
          #can :manage, [Rent,RentDetail,Movie]
          #can [:read, :create], Rent
          #can [:read, :create, :update], RentDetail
          #can [:read, :create], Movie
          #can [:read, :create], Customer
          
          can :manage, Rent
          cannot :destroy, Rent
          
          can :manage, Movie
          cannot :destroy, Movie
          
          can :manage, Customer
          cannot :destroy, Customer
          
          can :manage, RentDetail
          cannot :destroy, RentDetail        
          
        end
  end
end
