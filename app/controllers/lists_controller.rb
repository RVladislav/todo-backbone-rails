class ListsController < ApplicationController
  layout false

  # GET /lists/1
  def show
    @list = List.find(params[:id])
    render layout: false
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    redirect_to List.create!(list_params)
  end

  private

  # Only allow a trusted parameter "white list" through.
  def list_params
    params[:list]
  end
end
