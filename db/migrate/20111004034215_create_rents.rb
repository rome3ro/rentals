class CreateRents < ActiveRecord::Migration
  
  def change
    create_table :rents do |t|
      t.string :customer_code

      t.timestamps
    end
  end
  
end
