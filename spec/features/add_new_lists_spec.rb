require 'rails_helper'

feature "AddNewLists", :type => :feature do
	it 'should create a new list with a logged in user' do
		
		login_as create( :user ), scope: :user
		
		visit new_todo_list_path

		click_button "Log in"

		within "#new_todo_list" do
			fill_in "todo_list_name", with: "Todo List Test"
		end

		click_link_or_button "Create Todo List"

		expect( TodoList.count ).to eq(1)
		expect( TodoList.first.name ).to eq( "Todo List Test" )
	end
end
