class AddIndeies < ActiveRecord::Migration
  def change
    add_index :documents,     :type
    add_index :notifications, :type
  end
end
