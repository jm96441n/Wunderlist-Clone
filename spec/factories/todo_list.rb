FactoryGirl.define do
	factory :todo_list, :class => "TodoList" do
		name "Test List"
		association :user_id, factory: :user
	end
end