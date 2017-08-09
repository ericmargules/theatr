class AddCoverToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :cover, :string
  end
end
