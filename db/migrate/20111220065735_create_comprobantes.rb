class CreateComprobantes < ActiveRecord::Migration
  def change
    create_table :comprobantes do |t|
      t.integer :customer_id
      t.string :archivo

      t.timestamps
    end
  end
end
