class Planorder < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :order, :string, :default => 'date'
  end
end
