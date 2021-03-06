class TodosController < ApplicationController
	respond_to :json
	def show
		@todo = Todo.includes(:reminders).find(params[:id])
	end

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			redirect_to action: "show", controller: "todo_lists", id: @todo.todo_list_id
		end
	end

	def edit
		@todo = Todo.find(params[:id])
	end

	def update
		@todo = Todo.find(params[:id])
		if request.xhr?
			if @todo.update(todo_params)
				render json: @todo
			else

			end
		else
			redirect_to action: 'show', controller: "todo_lists", id: @todo.todo_list_id
		end
	end

	def destroy
	end

	private

	def todo_params
		params.permit(:name,:description,:user_id,:todo_list_id, :status, :priority)
	end

end
