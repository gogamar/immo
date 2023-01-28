class AddStatusToRealestates < ActiveRecord::Migration[7.0]
  def change
    add_column :realestates, :status, :string, default: "pending"
  end
end
