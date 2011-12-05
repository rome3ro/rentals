class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.integer :customer_id
      t.string :name
      t.string :address
      t.string :phone
      t.string :cellphone
      t.integer :city_id
      t.date :birthday
      t.integer :gender_id
      t.string :email
      t.string :document_number

      t.timestamps
    end
  end
end
