class TodosController < ApplicationController

	def index
	end

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			redirect_to action: "show", controller: "todo_lists", id: session[:todo_list]
		end
	end

	private

	def todo_params(params)
		params[:todo].permit(:name,:description,:user_id,:todolist_id)
	end

end