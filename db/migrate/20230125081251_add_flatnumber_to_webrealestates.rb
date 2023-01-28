class AddFlatnumberToWebrealestates < ActiveRecord::Migration[7.0]
  def change
    add_column :webrealestates, :flatnumber, :string
  end
end
