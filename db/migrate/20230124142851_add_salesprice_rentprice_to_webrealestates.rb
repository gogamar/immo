class AddSalespriceRentpriceToWebrealestates < ActiveRecord::Migration[7.0]
  def change
    add_column :webrealestates, :salesprice, :integer
    add_column :webrealestates, :rentprice, :integer
  end
end
