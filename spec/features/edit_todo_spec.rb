require 'rails_helper'

feature "EditTodoItem", :type => :feature do
	it 'should allow a logged in user with a list to edit the name of an item on that list' do
		u = create(:user)
		login_as u
		t_l = create(:todo_list, user_id: u.id)
		todo = create(:todo, user_id: u.id, todo_list_id: t_l.id)

		visit edit_todo_path(todo)

		within "#edit_todo_#{todo.id}" do
			fill_in 'todo_name', with: "All New, All Different Todo"
			find(:xpath, "//input[@id='todo_todo_list_id']").set t_l.id
		end

		click_button "Update Todo"

		todo = Todo.find(todo.id)
		expect( todo.name ).to eq("All New, All Different Todo")
	end

	it 'should allow a logged in user with a list to edit the description of an item on that list' do
		u = create(:user)
		login_as u
		t_l = create(:todo_list, user_id: u.id)
		todo = create(:todo, user_id: u.id, todo_list_id: t_l.id)

		visit edit_todo_path(todo)

		within "#edit_todo_#{todo.id}" do
			fill_in 'todo_description', with: "And now for something completely different"
			find(:xpath, "//input[@id='todo_todo_list_id']").set t_l.id
		end

		click_button "Update Todo"

		todo = Todo.find(todo.id)
		expect( todo.description ).to eq("And now for something completely different")
	end

end