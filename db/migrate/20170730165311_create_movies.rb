class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :poster
      t.string :rating
      t.integer :length
      t.boolean :now_playing

      t.timestamps
    end
  end
end
