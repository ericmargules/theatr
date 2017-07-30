class CreateShowtimes < ActiveRecord::Migration[5.0]
  def change
    create_table :showtimes do |t|
      t.string :time
      t.date :date
      t.references :movie, foreign_key: true
      t.references :auditorium, foreign_key: true

      t.timestamps
    end
  end
end
