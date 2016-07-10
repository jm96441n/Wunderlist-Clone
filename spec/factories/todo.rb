FactoryGirl.define do
	factory :todo, class: "Todo" do
		name "Test Todo"
		description "This is a test todo item"
		status "Not Started"
		association :todo_list_id, factory: :todo_list
		association :user_id, factory: :user
	end
end