class RemoveStatusFromRealestates < ActiveRecord::Migration[7.0]
  def change
    remove_column :realestates, :status, :string
  end
end
