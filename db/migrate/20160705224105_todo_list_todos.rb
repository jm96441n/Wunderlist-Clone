class TodoListTodos < ActiveRecord::Migration
  def change
  	create_table :todolist_todos do |t|
  		t.belongs_to :todolist, null: false
  		t.belongs_to :todo, null: false
  	end
  end
end
