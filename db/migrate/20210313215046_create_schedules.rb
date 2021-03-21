class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :user,      null: false, foreign_key: true
      t.references :calendar,  null: false, foreign_key: true
      t.date :date,            null: false
      t.string :schedule_name, null: false
      t.integer :genre_id,     null: false
      t.time :start_time
      t.time :end_time
      t.text :comment
      t.timestamps
    end
  end
end
