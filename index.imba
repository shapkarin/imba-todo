import { Todo } from './store'

tag App
	prop todos

	def addTodo
		# do not work in other way...
		if @newTodoTitle is undefined or @newTodoTitle is ''
			return

		@todos.push Todo.new(@newTodoTitle)
		@newTodoTitle = ''

	def toggleTodo todo
		todo.done = !todo.done
	
	def renameTodo todo
		todo.title = window.prompt("New title", todo.title)

	def render
		<self>
			<form.header :submit.prevent.addTodo>
				<input[@newTodoTitle] placeholder="Add...">
				<button type='submit'> 'Add item'
			<div> for todo in @todos
				<div>
					<span .done=(todo.done)> todo.title
					<button :tap.toggleTodo(todo)> !todo.done ? 'Done' : 'ToDo'
					<button :tap.renameTodo(todo)> 'Rename'

Imba.mount <App.vbox todos=[]>