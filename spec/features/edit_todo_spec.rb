require 'rails_helper'

feature "EditTodoItem", :type => :feature do
		before :each do
			@u = create(:user)
			login_as @u
			@t_l = create(:todo_list, user_id: @u.id)
			@todo = create(:todo, user_id: @u.id, todo_list_id: @t_l.id)
			@path = "//input[@id='todo_todo_list_id']"
		end
	it 'should allow a logged in user with a list to edit the name of an item on that list' do
		visit edit_todo_path(@todo)

		within "#edit_todo_#{@todo.id}" do
			fill_in 'todo_name', with: "All New, All Different Todo"
			find(:xpath, @path).set @t_l.id
		end

		click_button "Update Todo"

		todo = Todo.find(@todo.id)
		expect( todo.name ).to eq("All New, All Different Todo")
	end

	it 'should allow a logged in user with a list to edit the description of an item on that list' do

		visit edit_todo_path(@todo)

		within "#edit_todo_#{@todo.id}" do
			fill_in 'todo_description', with: "And now for something completely different"
			find(:xpath, @path).set @t_l.id
		end

		click_button "Update Todo"

		todo = Todo.find(@todo.id)
		expect( todo.description ).to eq("And now for something completely different")
	end
	describe "Edit the status of a todo" do
		it 'should allow a logged in user with a list to edit the status of the item to In Progress' do

			visit edit_todo_path(@todo)

			within "#edit_todo_#{@todo.id}" do
				choose("todo_status_in_progress")
				find(:xpath, @path).set @t_l.id
			end

			click_button "Update Todo"

			todo = Todo.find(@todo.id)
			expect( todo.status ).to eq("In Progress")
		end
		it 'should allow a logged in user with a list to edit the status of the item to In Progress' do

			visit edit_todo_path(@todo)

			within "#edit_todo_#{@todo.id}" do
				choose("todo_status_completed")
				find(:xpath, @path).set @t_l.id
			end

			click_button "Update Todo"

			todo = Todo.find(@todo.id)
			expect( todo.status ).to eq("Completed")
		end
	end
	describe "Edit the priority of a todo" do
		it 'should allow a user to change the priority of a todo to medium' do

			visit edit_todo_path(@todo)

			within "#edit_todo_#{@todo.id}" do
				choose("todo_priority_medium")
				find(:xpath, @path).set @t_l.id
			end

			click_button "Update Todo"

			todo = Todo.find(@todo.id)
			expect( todo.priority ).to eq("Medium")
		end

		it 'should allow a user to change the priority of a todo to high' do
			visit edit_todo_path(@todo)

			within "#edit_todo_#{@todo.id}" do
				choose("todo_priority_high")
				find(:xpath, @path).set @t_l.id
			end

			click_button "Update Todo"

			todo = Todo.find(@todo.id)
			expect( todo.priority ).to eq("High")
		end

		it 'should allow a user to change the priority of a todo to low' do
			high_todo = create(:todo, todo_list_id: @t_l.id, user_id: @u.id, priority: 'High')
			visit edit_todo_path(high_todo)

			within "#edit_todo_#{high_todo.id}" do
				choose("todo_priority_low")
				find(:xpath, @path).set @t_l.id
			end

			click_button "Update Todo"

			todo = Todo.find(high_todo.id)
			expect( todo.priority ).to eq("Low")
		end
	end

end