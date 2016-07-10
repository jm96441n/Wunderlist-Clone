require 'rails_helper'

RSpec.describe TodoListsController, :type => :controller do
	describe 'anonymous user' do
		before :each do
			login_with nil
		end
		it 'Index: should be redirected to signin page' do
			get :index
			expect( response ).to redirect_to (new_user_session_path )
		end
		it 'Show: should be redirected to signin page' do
			get :show, id: 1
			expect( response ).to redirect_to (new_user_session_path )
		end
		it 'New: should be redirected to signin page' do
			get :new
			expect( response ).to redirect_to (new_user_session_path )
		end
		it "Update: should be redirected to sigin in page" do
			get :update, id: 1
			expect( response ).to redirect_to(new_user_session_path )
		end
	end

	describe 'logged in user' do
		before :each do
			u = create(:user)
			login_with u
		end
		it 'Index: should let a user view all of their lists' do
			get :index
			expect( response ).to render_template( :index )
		end
		it 'Show: should let a user view a single Todo List' do
			u = create(:user)
			t_l = FactoryGirl.create(:todolist, user_id: u.id)
			get :show, id: t_l.id
			expect( response ).to render_template( :show )
		end
		it "Create: should let the user view the form create a new Todo List" do
			get :new
			expect( response ).to render_template(:new)
		end

		it "Edit: should allow a user to view the form to edit a Todo List" do
			u = create(:user)
			t_l = FactoryGirl.create(:todolist, user_id: u.id)
			get :edit, id: t_l.id
			expect( response ).to render_template(:edit)
		end
	end

end