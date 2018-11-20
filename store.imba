export class Todo
	prop title
	prop done
	prop editing
	prop newTitle

	def initialize title
		@title = title
		@done = no
		@editing = no