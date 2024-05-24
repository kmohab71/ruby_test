class CreateCastMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :cast_movies do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :cast, null: false, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
