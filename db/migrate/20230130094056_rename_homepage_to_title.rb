class RenameHomepageToTitle < ActiveRecord::Migration[7.0]
  def change
    rename_table :homepages, :titles
  end
end
