class Resolvers::CreateTodoList < GraphQL::Function
  argument :desc, !types.String
  argument :name, !types.String
  argument :todoId, !types.String

  type Types::TodoListType

  def call(obj, args, ctx)
    todo = Todo.find(args[:todoId])

    return unless todo

    TodoList.create!(
      desc: args[:desc],
      name: args[:name],
      todo: todo
    )
  end
end