class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :orders, :total, :totalamt
  end
end
