class User < ActiveRecord::Base
  attr_accessible :role_ids, :name, :name, :nombre_conyuge, :address, :phone, :cellphone, :city_id, :birthday, :gender_id, :email, :document_number, :is_school_id
  has_and_belongs_to_many :roles
  belongs_to :gender
  belongs_to :city
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable#, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation#, :remember_me
    validates :username, :presence => TRUE, :uniqueness => TRUE

    def role?(role)
        return !!self.roles.find_by_name(role.to_s.camelize)
    end
  
end
