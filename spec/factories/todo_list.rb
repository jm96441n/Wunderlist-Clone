FactoryGirl.define do
	factory :todolist, :class => "TodoList" do
		name "Test List"
		association :user_id, factory: :user
	end
end