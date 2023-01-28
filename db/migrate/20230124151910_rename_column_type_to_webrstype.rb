class RenameColumnTypeToWebrstype < ActiveRecord::Migration[7.0]
  def change
    rename_column :webrealestates, :type, :webrstype
  end
end
