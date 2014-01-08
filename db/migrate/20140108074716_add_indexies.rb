class AddIndexies < ActiveRecord::Migration
  def change

    # For comments
    add_index :comments, :blog_id
    add_index :comments, :user_id

    # For documents
    add_index :documents, :user_id

  end

end
