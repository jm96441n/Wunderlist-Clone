require 'rails_helper'

feature "EditTodoList", :type => :feature do
	it 'should allow a logged in user to edit a list they have already made' do
		u = create(:user)
		login_as u
		t_l = create(:todo_list, user_id: u.id)

		visit edit_todo_list_path(t_l)

		within "#edit_todo_list_#{t_l.id}" do
			fill_in "todo_list_name", with: "All New, All Different List Name"
			
		end
		click_link_or_button "Update Todo list"

		t_l = TodoList.find(t_l.id)
		
		expect( t_l.name ).to eq("All New, All Different List Name")
	end

end