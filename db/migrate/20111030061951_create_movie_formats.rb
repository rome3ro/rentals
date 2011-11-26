class CreateMovieFormats < ActiveRecord::Migration
  def change
    create_table :movie_formats do |t|
      t.string :name
t.integer :user_id
      t.timestamps
    end
    
    MovieFormat.create :name => "DVD"
    MovieFormat.create :name => "BLUE-RAY"
  end
end
