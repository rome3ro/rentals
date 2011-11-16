class CreateRentPrices < ActiveRecord::Migration
  def change
    create_table :rent_prices do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :days
      t.integer :weekday_id
      t.decimal :surcharge
      t.integer :movie_kind_id
      t.integer :movies_quantity
      t.timestamps
    end
    
    RentPrice.create :name => "Normal", :description => "Normal", :price => 20, :days => 1, :weekday_id => 1, :surcharge => 10, :movie_kind_id => 1, :movies_quantity => 1
    
  end
end
