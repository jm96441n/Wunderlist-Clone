require 'rails_helper'

RSpec.describe TodosController, :type => :controller do

	describe 'anonymous user' do
		before :each do
			login_with nil
		end

	end
	describe 'logged in user with an existing Todo List' do
		before :each do
			u = create(:user)
			login_with u
			t_l = create(:todolist, user_id: u.id)
		end
		it 'should allow a user to make a new todo for a list' do
			get :new
			expect( response ).to render_template( :new )
		end
	end

end