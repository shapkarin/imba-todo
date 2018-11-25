import { Model } from './Store'
import { Todo } from './Todo'

tag App
    prop todos

    def addTodo
        if @newTodoTitle is undefined or @newTodoTitle is ''
            return
        @todos.push Model.new(@newTodoTitle)
        @newTodoTitle = ''

    def removeTodo todo
        @todos = @todos.filter(|t| t != todo)

    def render
        <self>
            <form.header :submit.prevent.addTodo>
                <input[@newTodoTitle] placeholder="Add...">
                <button type='submit'> 'Add item'
            <div> for todo in @todos
                <Todo todo=todo :remove.removeTodo(todo)>

Imba.mount <App todos=[]>