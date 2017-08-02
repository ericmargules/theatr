class RemoveTimeFromShowtimes < ActiveRecord::Migration[5.0]
  def change
    remove_column :showtimes, :time, :string
  end
end
