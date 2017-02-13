class Addordertoplans < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :row_order, :integer
  end
end
