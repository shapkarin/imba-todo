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

    def remaining
        @todos.filter(|todo| !todo.completed )

    def completed
        @todos.filter(|todo| todo.completed )

    def hash
        window:location:hash

    def render
        var items = @todos
        var active = @remaining
        var done = @completed

        if @hash is '#/completed'
            items = done
        elif @hash is '#/active'
            items = active

        <self>
            <form.header :submit.prevent.addTodo>
                <input[@newTodoTitle] placeholder="Add...">
                <button type='submit'> 'Add item'

            <div> for todo in items
                <Todo todo=todo :remove.removeTodo(todo)>

            <footer.footer>
                <span.todo-count>
                    <strong> "{active:len} "
                    active:length == 1 ? 'item left' : 'items left'
                <ul.filters>
                    <li> <a  href='#/'> 'All'
                    <li> <a  href='#/active'> 'Active'
                    <li> <a  href='#/completed'> 'Completed'

                if done:len > 0
                    <button.clear-completed :tap='archive'> 'Clear completed'

Imba.mount <App todos=[]>