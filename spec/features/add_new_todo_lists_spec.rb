require 'rails_helper'

feature "AddNewLists", :type => :feature do
	it 'should allow a logged in user create a new todo list' do
		
		login_as create( :user ), scope: :user
		
		visit new_todo_list_path

		within "#new_todo_list" do
			fill_in "todo_list_name", with: "Todo List Test"
		end

		click_button "Create Todo list"

		expect( TodoList.count ).to eq(1)
		expect( TodoList.first.name ).to eq( "Todo List Test" )
	end
end
