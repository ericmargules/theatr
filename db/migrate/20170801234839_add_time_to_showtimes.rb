class AddTimeToShowtimes < ActiveRecord::Migration[5.0]
  def change
    add_column :showtimes, :time, :time
  end
end
