class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :director
      t.string :actor
      t.string :actress
      t.date :released_year
      t.references :industry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
