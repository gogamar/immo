class AddTranslationsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :content_fr, :string
    add_column :posts, :content_en, :string
  end
end
