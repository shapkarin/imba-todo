import Controller from './Controller'

export tag Todo
    prop todo
    prop destroy

    def editing
        # hm... wip..
        @editing = yes

    def render
        <self>
            if @editing
                # <input[@newTitle] :keydown.enter=Controller.setTitle(todo)>
                <input[@newTitle]>
            <span .done=(@todo.done)> @todo.title
            <button :tap=Controller.toggleTodo(todo)> !@todo.done ? 'Done' : 'ToDo'
            if !@editing
                <button :tap.editing> 'Rename'
            else
                <button :tap=Controller.setTitle(todo, @newTitle)> 'Save'
            <button :tap=Controller.destroyTodo(todo)> 'Delete' 