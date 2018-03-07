class CreateTodoLists < ActiveRecord::Migration[5.1]
  def change
    create_table :todo_lists do |t|
      t.references :todo, foreign_key: true
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
