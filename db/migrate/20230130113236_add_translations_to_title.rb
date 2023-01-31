class AddTranslationsToTitle < ActiveRecord::Migration[7.0]
  def change
    add_column :titles, :bheader1_es, :string
    add_column :titles, :bheader1_en, :string
    add_column :titles, :bheader1_fr, :string
  end
end
