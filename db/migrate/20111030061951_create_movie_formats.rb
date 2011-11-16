class CreateMovieFormats < ActiveRecord::Migration
  def change
    create_table :movie_formats do |t|
      t.string :name

      t.timestamps
    end
    
    MovieFormat.create :name => "DVD"
    MovieFormat.create :name => "BLUE-RAY"
  end
end
