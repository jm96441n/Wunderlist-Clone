require 'rails_helper'

feature "EditTodoList", :type => :feature do
	it 'should allow a logged in user to edit a list they have already made' do
		u = create(:user)
		t_l = create(:todolist, user_id: u.id)

		within "#edit_todo_list" do
			fill_in "todo_list_name", with: "All New, All Different List Name"
		end

		click_button "Edit Todo List"

		expect( t_l.name ).to eq("All New, All Different List Name")
	end

end