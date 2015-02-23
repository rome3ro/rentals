class CreateRentDetails < ActiveRecord::Migration
  def change
    create_table :rent_details do |t|
      t.integer :rent_id
      t.integer :movie_id
      t.string :movie_code_name
      t.integer :movie_kind_id
      t.decimal :price
      t.boolean :delivered, :null => false, :default => false
      t.datetime :delivered_date
      t.datetime :deliver_date
      t.integer :surcharge_days, :default => 0
      t.decimal :surcharge, :default => 0
      t.decimal :deal_surcharge, :default => 0
      t.decimal :pending_surcharge, :default => 0
      t.integer :user_id #usuario que modificó o creó
      t.timestamps
    end
    
  end
end
