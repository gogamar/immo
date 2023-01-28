class AddDefaultToStatus < ActiveRecord::Migration[7.0]
  def change
    change_column_default :webrealestates, :status, from: nil, to: "new"
  end
end
