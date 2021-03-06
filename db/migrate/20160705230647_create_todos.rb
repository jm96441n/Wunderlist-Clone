class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
  		t.string :name, null: false
  		t.text :description, null: false
  		t.string :status, null: false
  		t.belongs_to :todo_list, null: false, index: true
  		t.belongs_to :user, null: false, index: true
      t.timestamps null: false
    end
  end
end
