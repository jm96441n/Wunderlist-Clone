class TodosController < ApplicationController


	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			redirect_to action: "show", controller: "todo_lists", id: @todo.todo_list_id
		end
	end

	def update
	end

	def destroy
	end
	
	private

	def todo_params
		params[:todo].permit(:name,:description,:user_id,:todo_list_id)
	end

end