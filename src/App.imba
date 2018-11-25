import { Model } from './Store'
import { Todo } from './Todo'

tag App
    prop todos
    prop newTodoTitle
        
    def build
        load

    # add todo
    def addTodo
        if @newTodoTitle is undefined or @newTodoTitle is ''
            return
        @todos.push Model.new(@newTodoTitle)
        @newTodoTitle = ''
        console.log @todos
        persist

    # remove todo
    def removeTodo todo
        @todos = @todos.filter(|t| t != todo)
        persist

    # get completed todos
    def completed
        @todos.filter(|todo| todo.completed )

    # get not completed todos
    def remaining
        @todos.filter(|todo| !todo.completed )
    
    # get location hash
    def hash
        window:location:hash

    # remove all completed todos from collection
    def archive
        @todos = remaining
        persist

    # load todos from localstorage
    def load
        var items = JSON.parse(window:localStorage.getItem('todos-imba') or '[]')
        @todos = items.map do |todo| Model.new(todo:_title, todo:_completed)
        console.log @todos

    # persist todos to localstorage
    def persist
        var json = JSON.stringify(todos)
        if json != @json
            window:localStorage.setItem('todos-imba', @json = json)

    # render
    def render
        var items = @todos
        var active = remaining
        var done = completed

        if hash is '#/completed'
            items = done
        elif hash is '#/active'
            items = active

        <self>
            <form.header :submit.prevent.addTodo>
                <input[@newTodoTitle] placeholder="Add...">
                <button type='submit'> 'Add item'

            <div> for todo in items
                # todo with custum events remove and renamed
                <Todo todo=todo :remove.removeTodo(todo) :changed.persist>
                ###
                    you also can pass function like a property
                    func=(self:parentFuncName.bind(this))
                    and then call it in child
                    <Todo todo=todo :remove.removeTodo(todo) :renamed.persist>
                ###

            <footer.footer>
                <span.todo-count>
                    <strong> "{active.len} "
                    active.len == 1 ? 'item' : 'items'
                    ' left'
                <ul.filters>
                    <li> <a .selected=(items is todos) href='#/'> 'All'
                    <li> <a .selected=(items is active) href='#/active'> 'Active'
                    <li> <a .selected=(items is done) href='#/completed'> 'Completed'

                if done.len > 0
                    <button.clear-completed :tap.archive> 'Clear completed'

    
Imba.mount <App>
