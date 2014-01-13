class AddParentPageIdToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :parent_page_id, :integer
    add_index  :documents, :parent_page_id
  end
end
