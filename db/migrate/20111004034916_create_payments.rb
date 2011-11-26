class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      #t.integer :customer_id
      t.decimal :payment
      t.integer :rent_detail_id
t.integer :user_id
      t.timestamps
    end
  end
end
