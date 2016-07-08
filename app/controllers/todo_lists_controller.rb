class TodoListsController < ApplicationController
	before_filter :authenticate_user!
	def index
		@lists = TodoList.where("user_id = ?", current_user.id)
	end

	def new
	end

	def create
	end

	def update
	end

	def destroy
	end

end