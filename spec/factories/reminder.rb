FactoryGirl.define do
	factory :reminder, class: "Reminder" do
		time DateTime.now + 1.minute
		checked false
		association :todo_id, factory: :todo
	end
end