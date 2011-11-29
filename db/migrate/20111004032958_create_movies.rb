class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies  do |t|
      t.string :code, :null => false
      t.string :name
      t.integer :movie_format_id
      t.string :imdb_id
      t.date :released
      t.string :genres
      t.string :actors
      t.string :director
      #t.boolean :rented
      t.integer :user_id      

      t.timestamps
    end
    
        
    add_index :movies, :code, :unique => true
  end
end
