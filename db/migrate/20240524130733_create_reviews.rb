class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :movie
      t.references :user
      t.decimal :star
      t.text :review

      t.timestamps
    end
  end
end
