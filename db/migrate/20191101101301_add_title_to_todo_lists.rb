class AddTitleToTodoLists < ActiveRecord::Migration[6.0]
  def change
    change_table :todo_lists do |t|
      t.string :title, null: false
    end
  end
end
