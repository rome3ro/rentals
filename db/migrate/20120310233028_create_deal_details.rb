class CreateDealDetails < ActiveRecord::Migration
  def change
    create_table :deal_details do |t|
      t.integer :deal_id
      t.integer :movie_kind_id
      t.decimal :price
      t.integer :days
      t.decimal :surcharge
      t.integer :movies_quantity
      t.timestamps
    end
  end
end
