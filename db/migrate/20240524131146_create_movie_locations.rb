class CreateMovieLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :movie_locations do |t|
      t.references :movie
      t.references :filming_location

      t.timestamps
    end
  end
end
