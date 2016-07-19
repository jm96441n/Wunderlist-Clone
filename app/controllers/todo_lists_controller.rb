class TodoListsController < ApplicationController
	before_filter :authenticate_user!
	respond_to :json

	def index
		@lists = TodoList.where("user_id = ?", current_user.id)
		render json: @lists
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
		@todo_list = TodoList.find(params[:id])
		if @todo_list.update(todo_list_params)
			redirect_to @todo_list
		end
	end

	def destroy
	end

	def react
		@user = current_user
	end

private

	def todo_list_params
		params[:todo_list].permit(:name, :user_id)
	end

end
