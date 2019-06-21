module TodosHelper
    def todo_color(todo)
        'filter:grayscale(100%)' unless todo.completed?
    end

    def completed_button(todo)
        todo.completed ? 'Descompletar':'Completar'
    end
end
