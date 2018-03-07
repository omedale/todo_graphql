class Resolvers::CreateTodo < GraphQL::Function
  argument :desc, !types.String
  argument :name, !types.String

  type Types::TodoType

  def call(obj, args, ctx)
    Todo.create!(
      desc: args[:desc],
      name: args[:name],
      user: ctx[:current_user]
    )
  end
end