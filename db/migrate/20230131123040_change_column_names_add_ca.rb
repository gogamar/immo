class ChangeColumnNamesAddCa < ActiveRecord::Migration[7.0]
  def change
    rename_column :titles, :bheader1_ca, :bheader1_ca
    rename_column :titles, :bheader2_ca, :bheader2_ca
    rename_column :titles, :bdheader1_ca, :bdheader1_ca
    rename_column :titles, :bdheader2_ca, :bdheader2_ca
    rename_column :titles, :bbutton_ca, :bbutton_ca
    rename_column :posts, :content, :content_ca
    rename_column :posts, :title, :title_ca
  end
end
