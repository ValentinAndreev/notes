class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :text
      t.datetime :date
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
