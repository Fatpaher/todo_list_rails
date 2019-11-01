class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :todo_list, foreign_key: true
      t.string :description
      t.datetime :expires_at

      t.timestamps
    end
  end
end
