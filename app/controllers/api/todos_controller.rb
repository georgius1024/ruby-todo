class Api::TodosController < ApplicationController
  before_action :set_api_todo, only: [:show, :edit, :update, :destroy]

  # GET /api/todos
  # GET /api/todos.json
  def index
    @api_todos = Api::Todo.all
  end

  # GET /api/todos/1
  # GET /api/todos/1.json
  def show
  end

  # GET /api/todos/new
  def new
    @api_todo = Api::Todo.new
  end

  # GET /api/todos/1/edit
  def edit
  end

  # POST /api/todos
  # POST /api/todos.json
  def create
    @api_todo = Api::Todo.new(api_todo_params)

    respond_to do |format|
      if @api_todo.save
        format.html { redirect_to @api_todo, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @api_todo }
      else
        format.html { render :new }
        format.json { render json: @api_todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/todos/1
  # PATCH/PUT /api/todos/1.json
  def update
    respond_to do |format|
      if @api_todo.update(api_todo_params)
        format.html { redirect_to @api_todo, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_todo }
      else
        format.html { render :edit }
        format.json { render json: @api_todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/todos/1
  # DELETE /api/todos/1.json
  def destroy
    @api_todo.destroy
    respond_to do |format|
      format.html { redirect_to api_todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_todo
      @api_todo = Api::Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_todo_params
      params.fetch(:api_todo, {})
    end
end
