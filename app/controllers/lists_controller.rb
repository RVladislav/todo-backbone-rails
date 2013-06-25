class ListsController < ApplicationController
  layout false

  # GET /lists/1
  def show
    @list = List.find(params[:id])
    render layout: false
  end

  # POST /lists
  def create
    session[:caliper_api_key] = params[:caliper_api_key]
    redirect_to List.create!
  end
end
