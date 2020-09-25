class Api::TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :set_api_todo, only: [:show, :create, :update, :destroy]

  # GET /api/todos
  # GET /api/todos.json
  def index
    @todos = Todo.all
    render json: @todos, status: 200
  end

  # GET /api/todos/1
  # GET /api/todos/1.json
  def show
    @todo = Todo.find(params[:id])
    render json: @todo
  end

  # POST /api/todos
  # POST /api/todos.json
  def create
    # render json: api_todo_params
    # render json: params
    @todo = Todo.new(api_todo_params)

    @todo.assign_attributes(api_todo_params)
    if @todo.save
      render json: @todo, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/todos/1
  # PATCH/PUT /api/todos/1.json
  def update
    @todo = Todo.find(params[:id])
    if @todo.update(api_todo_params)
      render json: @todo, status: :ok
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/todos/1
  # DELETE /api/todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
  rescue StandardError => e
    send_error(e, 404)
  else
    @todo.destroy
    render json: {}, status: :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_todo
    if params[:id]
      @api_todo = Todo.find(params[:id])
    end
  end

  # Only allow a list of trusted parameters through.
  def api_todo_params
    params.require(:todo).permit(:row, :task, :done, :icon)
    # $params.slice(:row, :task, :done, :icon)
  end

  def send_error(message, status)
    render json: { message: message }, status: status
  end
end
