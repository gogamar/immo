class CreateRealestates < ActiveRecord::Migration[7.0]
  def change
    create_table :realestates do |t|
      t.string :idfile
      t.string :idagency
      t.string :type
      t.string :reference
      t.string :country
      t.string :speclocation
      t.string :typestreet
      t.string :namestreet
      t.string :numberstreet
      t.float :usurface
      t.float :csurface
      t.decimal :salesprice
      t.decimal :rentprice
      t.string :region
      t.string :province
      t.string :town
      t.string :postcode
      t.string :area
      t.string :title
      t.text :ad

      t.timestamps
    end
  end
end
