require 'rails_helper'

feature "AddNewUsers", :type => :feature do
	it 'should allow a user to create an account' do
			
			visit new_user_registration_path

			within "#new_user" do
				fill_in "#user_name", with: "Test McTestFace"
				fill_in "#user_email", with: "Test@email.com"
				fill_in "#user_password", with: "123456"
				fill_in "#user_password_confirmation", with: "123456"
			end

			click_button "Sign up"
			expect ( User.count ).to eq(1)
			expect ( User.first.name ).to eq("Test McTestFace")
			expect ( User.first.email ).to eq( "Test@email.com" )
	end

end