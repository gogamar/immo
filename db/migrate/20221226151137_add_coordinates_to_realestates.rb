class AddCoordinatesToRealestates < ActiveRecord::Migration[7.0]
  def change
    add_column :realestates, :latitude, :float
    add_column :realestates, :longitude, :float
  end
end
