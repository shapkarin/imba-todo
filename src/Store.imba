export class Model
    prop title
    prop done

    # TODO: persistence
    def initialize title, done = no
        @title = title
        @done = done