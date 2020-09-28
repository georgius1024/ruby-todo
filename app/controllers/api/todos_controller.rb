class Api::TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :set_api_todo, only: [:show, :create, :update, :destroy]

  # GET /api/todos
  def index
    @todos = Todo.all
    render json: @todos, status: :ok
  end

  # GET /api/todos/1
  def show
    @todo = Todo.find(params[:id])
  rescue StandardError => e
    send_error(e, :not_found)
  else
    render json: @todo
  end

  # POST /api/todos
  def create
    @todo = Todo.new(api_todo_params)
    @todo.assign_attributes(api_todo_params)
    if @todo.save
      render json: @todo, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/todos/1
  def update
    @todo = Todo.find(params[:id])
  rescue StandardError => e
    send_error(e, :not_found)
  else
    if @todo.update(api_todo_params)
      render json: @todo, status: :ok
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/todos/1
  def destroy
    @todo = Todo.find(params[:id])
  rescue StandardError => e
    send_error(e, :not_found)
  else
    @todo.destroy
    render json: {}, status: :no_content
  end

  private

  # Only allow a list of trusted parameters through.
  def api_todo_params
    params.require(:todo).permit(:row, :task, :done, :icon)
  end

  def send_error(message, status)
    render json: { message: message }, status: status
  end
end
