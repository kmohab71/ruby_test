class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.integer :year

      t.timestamps
    end
  end
end
