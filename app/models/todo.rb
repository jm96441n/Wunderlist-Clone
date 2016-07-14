class Todo < ActiveRecord::Base
	belongs_to :todo_list
	belongs_to :user
	has_many :reminders

	validates :name, :description, :status, :priority, presence: true

end
