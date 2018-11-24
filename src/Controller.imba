module:exports:Controller = Controller.new
import { Model } from './Store'

class Controller
    prop todos

    def initialize
        @todos = []

    def addTodo newTodoTitle
        if newTodoTitle is undefined or newTodoTitle is ''
            return
        @todos.push Model.new(newTodoTitle)
        # @newTodoTitle = ''

    def destroyTodo todo
        @todos = @todos.filter(|t| t != todo)

    def toggleTodo todo
        todo.done = !todo.done

    def setTitle todo, newTitle
        todo.title = newTitle

