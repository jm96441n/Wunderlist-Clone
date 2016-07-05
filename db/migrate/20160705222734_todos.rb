class Todos < ActiveRecord::Migration
  def change
  	create_table :todos do |t|
  		t.string :name, null: false
  		t.text :description, null: false
  		t.string :status, default:"Not Started"
  		t.belongs_to :todolist, null: false
  		t.timestamps null: false
  	end
  end
end
