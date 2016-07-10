require 'rails_helper'

feature "AddNewTodos", :type => :feature do
	it 'should allow a logged in user with a list to add a todo to the list' do
		u = create( :user )
		login_as u
		t_l = create( :todolist , user_id: u.id)
		
		
		visit new_todo_path
		
		within "#new_todo" do
			fill_in "todo_name", with: "New Todo"
			fill_in "todo_description", with: "Test todo for testing"
			find(:xpath, "//input[@id='todo_todo_list_id']").set t_l.id
		end

		click_link_or_button "Create Todo"

		expect(Todo.count).to eq(1)
		expect(Todo.first.name).to eq("New Todo")
		# expect (Todo.first.todolist_id).to eq(t_l.id)
		expect(Todo.first.user_id).to eq(u.id)
	end

end