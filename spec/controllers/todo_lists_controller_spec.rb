require 'rails_helper'

RSpec.describe TodoListsController, :type => :controller do
	describe 'anonymous user' do
		before :each do
			login_with nil
		end
		it 'should be redirected to signin page' do
			get :index
			expect( response ).to redirect_to (new_user_session_path )
		end
	end

	describe 'logged in user' do
		before :each do
			login_with create(:user)
		end
		it 'should let a user see all of their lists' do
			get :index
			expect( response ).to render_template( :index )
		end
	end
end