class ChangeParentPageNameToParentPageIdColumn < ActiveRecord::Migration
  def change
    remove_column :documents, :parent_page_name, :parent_page_id
    add_column    :documents, :parent_page_id,   :integer
    add_index     :documents, :parent_page_id
  end
end
