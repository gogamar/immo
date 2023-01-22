class AddTownNameToRealestates < ActiveRecord::Migration[7.0]
  def change
    add_column :realestates, :town_name, :string
  end
end
