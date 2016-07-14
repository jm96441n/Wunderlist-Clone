require 'rails_helper'

feature "AddNewTodos", :type => :feature do
	before :each do
		@u = create( :user )
		login_as @u
		@t_l = create( :todo_list , user_id: @u.id)
	end
	it 'should allow a logged in user with a list to add a todo to the list with a status of not started' do		
		
		visit new_todo_path
		
		within "#new_todo" do
			fill_in "todo_name", with: "New Todo"
			fill_in "todo_description", with: "Test todo for testing"
			choose("todo_priority_low")
			find(:xpath, "//input[@id='todo_todo_list_id']").set @t_l.id
		end

		click_link_or_button "Create Todo"

		expect(Todo.count).to eq(1)
		expect(Todo.first.name).to eq("New Todo")
		expect(Todo.first.status).to eq("Not Started")
		expect(Todo.first.user_id).to eq(@u.id)
	end
	it 'should allow a logged in user with a list to add a todo to the list with a status of in progress' do
				
		visit new_todo_path
		
		within "#new_todo" do
			fill_in "todo_name", with: "New Todo"
			fill_in "todo_description", with: "Test todo for testing"
			choose("todo_status_in_progress")
			choose("todo_priority_low")
			find(:xpath, "//input[@id='todo_todo_list_id']").set @t_l.id
		end

		click_link_or_button "Create Todo"

		expect(Todo.count).to eq(1)
		expect(Todo.first.name).to eq("New Todo")
		expect(Todo.first.status).to eq("In Progress")
		expect(Todo.first.user_id).to eq(@u.id)
	end
	it 'should allow a logged in user with a list to add a todo to the list with a status of completed' do
		
		visit new_todo_path
		
		within "#new_todo" do
			fill_in "todo_name", with: "New Todo"
			fill_in "todo_description", with: "Test todo for testing"
			choose("todo_status_completed")
			choose("todo_priority_low")
			find(:xpath, "//input[@id='todo_todo_list_id']").set @t_l.id
		end

		click_link_or_button "Create Todo"

		expect(Todo.count).to eq(1)
		expect(Todo.first.name).to eq("New Todo")
		expect(Todo.first.status).to eq("Completed")
		expect(Todo.first.user_id).to eq(@u.id)
	end

	it 'should allow a logged in user to add a todo with a low priority to an existing list' do

		visit new_todo_path

		within "#new_todo" do
			fill_in "todo_name", with: "New Todo"
			fill_in "todo_description", with: "Test todo for testing"
			choose("todo_priority_low")
			find(:xpath, "//input[@id='todo_todo_list_id']").set @t_l.id
		end
		click_link_or_button "Create Todo"

		expect( Todo.count ).to eq(1)
		expect( Todo.first.priority ).to eq( "Low" )
	end

	it 'should allow a logged in user to add a new todo with a priority of medium' do

		visit new_todo_path

		within "#new_todo" do
			fill_in "todo_name", with: "New Todo"
			fill_in "todo_description", with: "Test todo for testing"
			choose("todo_priority_medium")
			find(:xpath, "//input[@id='todo_todo_list_id']").set @t_l.id
		end
		click_link_or_button "Create Todo"

		expect( Todo.count ).to eq(1)
		expect( Todo.first.priority ).to eq("Medium")
	end

	it 'should allow a user to add a new todo with a priority of high to an existing list' do

		visit new_todo_path

		within '#new_todo' do
			fill_in "todo_name", with: "New Todo"
			fill_in "todo_description", with: "Test todo for testing"
			choose("todo_priority_high")
			find(:xpath, "//input[@id='todo_todo_list_id']").set @t_l.id
		end

		click_link_or_button 'Create Todo'

		expect( Todo.count ).to eq(1)
		expect( Todo.first.priority ).to eq('High')
	end

end