class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies  do |t|
      t.string :code
      t.string :name
      t.integer :movie_format_id
      t.string :imdb_id
      t.date :released
      t.string :genres
      t.string :actors
      t.string :director
      t.string :poster
      t.date :movie_date_type
      t.integer :user_id      

      t.timestamps
    end
    
        
    add_index :movies, :code, :unique => true
  end
end
