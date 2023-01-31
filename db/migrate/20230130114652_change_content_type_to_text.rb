class ChangeContentTypeToText < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :content_en, :text
    change_column :posts, :content_fr, :text
  end
end
