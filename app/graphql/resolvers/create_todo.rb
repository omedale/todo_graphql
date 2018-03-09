class Resolvers::CreateTodo < GraphQL::Function
  argument :desc, !types.String
  argument :name, !types.String
  argument :user_id, !types.ID

  type Types::TodoType

  def call(obj, args, ctx)
    user =  User.find(args[:user_id])
    Todo.create!(
      desc: args[:desc],
      name: args[:name],
      user: user
    )
  end
end