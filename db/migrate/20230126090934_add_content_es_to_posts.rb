class AddContentEsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :content_es, :text
  end
end
