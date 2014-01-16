class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string  :type
      t.boolean :active
      t.string  :room_name
      t.string  :token
      t.timestamps
    end
  end
end
