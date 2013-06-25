class Api::TodosController < ApplicationController
  before_filter :find_list, :random_slowdown

  respond_to :json

  # GET /api/lists/:list_id/todos
  def index
    respond_with @list.todos
  end

  # POST /api/lists/:list_id/todos
  def create
    respond_with :api, @list, @list.todos.create!(todo_params)
  end

  # GET /api/lists/:list_id/todos/:id
  def show
    respond_with @list.todos.find(params[:id])
  end

  # PUT/PATCH /api/lists/:list_id/todos/:id
  def update
    respond_with :api, @list, @list.todos.find(params[:id]).update_attributes!(todo_params)
  end

  # DELETE /api/lists/:list_id/todos/:id
  def destroy
    respond_with :api, @list, @list.todos.find(params[:id]).destroy!
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  # Randomly pause for somewhere between 0-2 seconds
  def random_slowdown
    sleep rand(0..2000) / 1000.0
  end

  # Only allow a trusted parameter "white list" through.
  def todo_params
    params.permit(:title, :order, :completed)
  end
end
