class AddUserToRealestates < ActiveRecord::Migration[7.0]
  def change
    add_reference :realestates, :user, foreign_key: true
  end
end
