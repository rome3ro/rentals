class CreateRents < ActiveRecord::Migration
  
  def change
    create_table :rents do |t|
      t.string :customer_id
      t.string :customer_code_name
      t.decimal :total
      t.integer :user_id
      
      t.timestamps
    end
  end
  
end
