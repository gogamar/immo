class CreateHomepages < ActiveRecord::Migration[7.0]
  def change
    create_table :homepages do |t|
      t.string :bheader1_ca
      t.string :bheader2_ca
      t.string :bdheader1_ca
      t.string :bdheader2_ca
      t.string :bbutton_ca

      t.timestamps
    end
  end
end
