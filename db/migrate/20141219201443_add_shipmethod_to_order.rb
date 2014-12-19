class AddShipmethodToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :shipmethod, :string
  end
end
