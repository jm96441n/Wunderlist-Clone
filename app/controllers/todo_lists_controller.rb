class TodoListsController < ApplicationController
	before_filter :authenticate_user!
	def index
		@lists = TodoList.where("user_id = ?", current_user.id)
	end

	def new
		@todo_list = TodoList.new
	end

	def create
		@todo_list = TodoList.new(todo_list_params)
		if @todo_list.save
			redirect_to action: 'show', controller: "todo_lists", id: @todo_list.id
		end
	end

	def show
		@todo_list = TodoList.includes(:todos).find(params[:id])
		session[:todo_list] = @todo_list.id		
	end

	def edit
		@todo_list = TodoList.find(params[:id])
	end

	def update
		# @todo_list = TodoList.find(params[:id])
		# @todo_list.update(name: params[:name])
	end

	def destroy
	end

private

	def todo_list_params
		params[:todo_list].permit(:name, :user_id)
	end

end