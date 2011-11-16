class CreateMovieKinds < ActiveRecord::Migration
  def change
    create_table :movie_kinds do |t|
      t.string :name
      t.string :description
      t.integer :expiration_days

      t.timestamps
    end
    MovieKind.create :name => "Normal", :description => "Normal", :expiration_days => 0    
  end
end
