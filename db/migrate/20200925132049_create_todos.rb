class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.integer :row
      t.text :task
      t.boolean :done
      t.string :icon
      t.timestamps
    end
  end
end
