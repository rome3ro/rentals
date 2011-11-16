class CreateGenders < ActiveRecord::Migration
  def change
    create_table :genders do |t|
      t.string :description

      t.timestamps
    end
    Gender.create :description => "Femenino"
  	Gender.create :description => "Masculino"
  end
end
