class FixColumnNameType < ActiveRecord::Migration[7.0]
  def change
    rename_column :realestates, :type, :rstype
  end
end
