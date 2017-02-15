class Removereorder < ActiveRecord::Migration[5.0]
  def change
    remove_column :plans, :order, :string   
  end
end
