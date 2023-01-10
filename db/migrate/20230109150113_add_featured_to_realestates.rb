class AddFeaturedToRealestates < ActiveRecord::Migration[7.0]
  def change
    add_column :realestates, :featured, :boolean, default: false
  end
end
