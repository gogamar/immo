class ChangeColumnNamesAddCa < ActiveRecord::Migration[7.0]
  def change
    rename_column :titles, :bheader1, :bheader1_ca
    rename_column :titles, :bheader2, :bheader2_ca
    rename_column :titles, :bdheader1, :bdheader1_ca
    rename_column :titles, :bdheader2, :bdheader2_ca
    rename_column :titles, :bbutton, :bbutton_ca
    rename_column :posts, :content, :content_ca
    rename_column :posts, :title, :title_ca
  end
end
