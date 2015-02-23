class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :name
      t.string :description
      t.integer :weekday_id
      t.integer :user_id
      t.timestamps
    end
    #Deal.create :name => "Ninguno"
  end
end
