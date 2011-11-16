class CreateRentDetails < ActiveRecord::Migration
  def change
    create_table :rent_details do |t|
      t.integer :rent_id
      t.integer :movie_id
      t.string :movie_code
      t.integer :movie_kind_id
      t.integer :rent_price_id
      t.boolean :delivered, :null => false, :default => false
      t.datetime :delivered_date
      t.integer :surcharge_days
      t.decimal :surcharge
      t.decimal :pending_surcharge

      t.timestamps
    end
    
  end
end
