class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies  do |t|
      t.string :code, :null => false
      t.string :name
      t.integer :movie_format_id
      t.string :imdb_id
      t.date :released

      #t.integer :category_id
      #t.string :cover
      #t.integer :imdb_id

      t.timestamps
    end
    
        
    add_index :movies, :code, :unique => true
  end
end