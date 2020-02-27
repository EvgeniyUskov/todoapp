class TodosController < ApplicationController
    
    #before_action :setTodo # run method before methods in todoscontroller
    
    def new
        @todo = Todo.new
    end
    
    def create
        @todo = Todo.new(todo_params)
        puts"-------"
        puts "#{@todo.name} : #{@todo.description}"
        puts"-------"
        if @todo.save
            flash[:notice] = "todo created successfully"
            redirect_to(todo_path(@todo))#show
        else
            render('new')
        end
    end
    
    def show 
        @todo = Todo.find(params[:id])
    end 
    
    def edit
        @todo = Todo.find(params[:id])
    end
    
    def update
        @todo = Todo.find(params[:id])
        if @todo.update(todo_params)
            flash[:notice] = "todo updated successfully"
            redirect_to(todo_path(@todo))#show
        else
            render('edit')
        end
    end
        
    def index
        @todos = Todo.all
    end
    
    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        flash[:notice] = "Todo delete successfully"
        redirect_to(todos_path)
    end
    
    private 
    
        def setTodo
            @todo = Todo.find(params[:id])
        end
        
        def todo_params
            params.require(:todo).permit(:name, :description)
        end
end
