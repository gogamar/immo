class CreateHomepages < ActiveRecord::Migration[7.0]
  def change
    create_table :homepages do |t|
      t.string :bheader1
      t.string :bheader2
      t.string :bdheader1
      t.string :bdheader2
      t.string :bbutton

      t.timestamps
    end
  end
end
