class RenamePagesToDocumentsTable < ActiveRecord::Migration
  def change
    rename_table :pages, :documents
    add_column :documents, :type, :string
  end
end
