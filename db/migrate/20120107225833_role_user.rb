class RoleUser < ActiveRecord::Migration
 def self.up
   create_table(:roles_users, :id => false ) do |t|
 
    #t.integer :role_id, :null => false
    #t.integer :user_id, :null => false
    t.references :role, :user
    t.timestamps
    end
 #RoleUser.create :roles_id => 1, :users_id => 1
 end
  def self.down
    drop_table :roles_users
  end
end
