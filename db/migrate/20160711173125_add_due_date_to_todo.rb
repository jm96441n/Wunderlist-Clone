class AddDueDateToTodo < ActiveRecord::Migration
  def change
  	add_column :todos, :due_date, :datetime, index: true
  end
end
