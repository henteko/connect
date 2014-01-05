class RenameWikiToPageTable < ActiveRecord::Migration
  def change
    rename_table :wikis, :pages
  end
end
