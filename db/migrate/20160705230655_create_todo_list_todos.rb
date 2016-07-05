class CreateTodoListTodos < ActiveRecord::Migration
  def change
    create_table :todo_list_todos do |t|
    	t.belongs_to :todo_list, null: false
  		t.belongs_to :todo, null: false
      t.timestamps null: false
    end
  end
end
