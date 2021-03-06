class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, except: [:index]

  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.order(created_at: :desc)
  end

  def my
    @todos = current_user.todos.order(created_at: :desc)
    render 'index'
  end

  def active
    @todos = current_user.todos.active
    render 'index'
  end

  def clear
    current_user.todos.completed.destroy_all
    @todos = current_user.todos
    render 'index'
  end

  def completed
    @todos = current_user.todos.completed
    render 'index'
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    respond_to do |format|
      format.html # show.html
      format.json { render json: @todo.to_json, status: :ok }
      format.js
      format.rtf # { render text: 'hello' }
    end
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = current_user.todos.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
        format.js
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:text, :completed)
    end
end
