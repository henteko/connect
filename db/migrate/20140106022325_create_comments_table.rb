class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :blog_id
      t.integer :user_id
      t.text :raw_body
      t.text :body

      t.timestamps
    end
  end
end
