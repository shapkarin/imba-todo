import { Todo } from './store'

tag App
	prop todos

	def addTodo
		if @newTodoTitle is undefined or @newTodoTitle is ''
			return

		@todos.push Todo.new(@newTodoTitle)
		@newTodoTitle = ''

	def toggleTodo todo
		todo.done = !todo.done
	
	def editing todo
		# hm...
		todo.newTitle = todo.title
		todo.editing = yes

	def setTitle todo
		todo.title = todo.newTitle
		todo.newTitle = todo.title
		todo.editing = no

	def render
		<self>
			<form.header :submit.prevent.addTodo>
				<input[@newTodoTitle] placeholder="Add...">
				<button type='submit'> 'Add item'
			<div> for todo in @todos
				<div>
					if todo.editing
						<input[todo.newTitle] :keydown.enter.setTitle(todo)>
					<span .done=(todo.done)> todo.title
					<button :tap.toggleTodo(todo)> !todo.done ? 'Done' : 'ToDo'
					if !todo.editing
						<button :tap.editing(todo)> 'Rename'
					else
						<button :tap.setTitle(todo)> 'Save'

Imba.mount <App.vbox todos=[]>