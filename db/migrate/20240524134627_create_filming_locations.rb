class CreateFilmingLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :filming_locations do |t|
      t.string :name
      t.string :country

      t.timestamps
    end
  end
end
