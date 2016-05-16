class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, limit: 200
      t.string :location
      t.date :event_date
      t.time :event_time
      t.text :description
      t.string :photo
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
