class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description
      t.string :contribution
      t.integer :user_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
