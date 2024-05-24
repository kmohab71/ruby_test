class CreateCasts < ActiveRecord::Migration[7.1]
  def change
    create_table :casts do |t|
      t.string :name

      t.timestamps
    end
  end
end
