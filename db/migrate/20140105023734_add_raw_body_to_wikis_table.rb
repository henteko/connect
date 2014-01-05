class AddRawBodyToWikisTable < ActiveRecord::Migration
  def change
    add_column :wikis, :raw_body, :text
  end
end
