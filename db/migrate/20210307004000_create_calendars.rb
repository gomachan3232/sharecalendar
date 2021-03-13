class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name,     null: false
      t.timestamps
    end
  end
end
