class AddAddressToRealestates < ActiveRecord::Migration[7.0]
  def change
    add_column :realestates, :address, :string
  end
end
