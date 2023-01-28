class AddOperationToRealestates < ActiveRecord::Migration[7.0]
  def change
    add_column :realestates, :operation, :string
  end
end
