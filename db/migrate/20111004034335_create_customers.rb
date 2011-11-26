class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :code, :null => false
      t.string :name
      t.string :address
      t.string :phone
      t.string :cellphone
      t.integer :city_id
      t.date :birthday
      t.integer :gender_id
      t.string :email
t.integer :user_id
      t.timestamps
    end
    add_index :customers, :code, :unique => true
  end
end
