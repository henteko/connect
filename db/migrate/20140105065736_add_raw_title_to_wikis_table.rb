class AddRawTitleToWikisTable < ActiveRecord::Migration
  def change
    add_column :wikis, :raw_title, :string
  end
end
