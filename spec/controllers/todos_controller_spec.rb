require 'rails_helper'

RSpec.describe TodosController, :type => :controller do

	describe 'anonymous user' do
		before :each do
			login_with nil
		end
		it 'New: should be redirected to signin page' do
			get :new
			expect( response ).to redirect_to (new_user_session_path )
		end
	end

	describe 'logged in user with an existing Todo List' do
		before :each do
			u = create(:user)
			login_with u
			t_l = create(:todo_list, user_id: u.id)
		end
		it 'New: should allow a user to view the form to make a new todo for a list' do
			get :new
			expect( response ).to render_template( :new )
		end
		it 'Update: should allow a user to view the form to update an item of their todo list' do
			u = create(:user)
			t_l = create(:todo_list, user_id: u.id)
			todo = create(:todo, todo_list_id: t_l.id, user_id: u.id)
			get :edit, id: todo.id
			expect( response ).to render_template( :edit )
		end
	end

end