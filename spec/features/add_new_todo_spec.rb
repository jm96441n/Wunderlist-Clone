require 'rails_helper'

feature "AddNewTodos", :type => :feature do
	it 'should allow a logged in user with a list to add a todo to the list' do
		login_as create( :user ), scope: :user
		t_l = create( :todolist ), scope: :todolist

		within "#new_todo" do
			fill_in "todo_name", with: "New Todo"
			fill_in "todo_description", with: "Test todo for testing"
			fill_in "#todo_todolist_id", with: t_l.id
		end

		click_link_or_button "Create Todo"

		expect (Todo.count).to eq(1)
		expect (Todo.first.name).to eq("New Todo")
		expect (Todo.first.todolist_id).to eq(t_l.id)
		expect (Todo.first.user_id).to eq(user.id)
	end

end