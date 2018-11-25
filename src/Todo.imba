export tag Todo
    prop todo
    prop remove

    def toggleTodo
        @todo.done = !@todo.done

    def editing
        # hm...
        @newTitle = @todo.title
        @editing = yes

    def setTitle
        @todo.title = @newTitle
        @editing = no

    def render
        <self>
            if @editing
                <input[@newTitle] :keydown.enter.setTitle>
            <span .done=(@todo.done)> @todo.title
            <button :tap.toggleTodo> !@todo.done ? 'Done' : 'ToDo'
            if !@editing
                <button :tap.editing> 'Rename'
            else
                <button :tap.setTitle> 'Save'
            <button :tap.trigger('remove')> 'Remove'