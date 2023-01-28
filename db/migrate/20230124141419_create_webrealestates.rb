class CreateWebrealestates < ActiveRecord::Migration[7.0]
  def change
    create_table :webrealestates do |t|
      t.string :status
      t.string :type
      t.string :operation
      t.integer :price
      t.string :address
      t.float :surface
      t.integer :bedrooms
      t.boolean :terrace
      t.boolean :lift
      t.string :owner
      t.string :email
      t.string :phone
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
