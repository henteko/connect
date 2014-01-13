class ChangeUrlToPageNameColumn < ActiveRecord::Migration
  def change
    rename_column :documents, :url, :page_name
    add_index :documents, :page_name
  end
end
