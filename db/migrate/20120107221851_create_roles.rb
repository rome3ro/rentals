class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end
    Role.create :name => "Administrador"
    Role.create :name => "Empleado"
  end
end

#class UsersHaveAndBelongToManyRoles < ActiveRecord::Migration
# def self.up
# create_table :roles_users, :id => false do |t|
# t.references :role, :user
# end
# 
# end
# def self.down
# drop_table :roles_users
# end
#end
