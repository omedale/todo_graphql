Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  
  #all Users
  field :allUsers, !types[Types::UserType] do
    # resolve would be called in order to fetch data for that field
    resolve -> (obj, args, ctx) { User.all }
  end

  field :user, Types::UserType do
    description 'Retrieve a blog post by id'
    
    argument :id, !types.ID, 'The ID of the blog post to retrieve'
    resolve -> (obj, args, ctx) {
      User.find(args[:id])
    }
  end

  field :post, Types::PostType do
    description 'Retrieve a blog post by id'
    
    argument :id, !types.ID, 'The ID of the blog post to retrieve'
    
    resolve ->(obj, args, ctx) {
      Post.find(args[:id])
    }
  end
  
  field :posts, types[Types::PostType] do
    description 'Retrieve a list of all blog posts'
    
    resolve ->(obj, args, ctx) {
      Post.all
    }
  end

  field :todos, types[Types::TodoType] do
    description 'Retrieve a list of all todo'
    
    resolve ->(obj, args, ctx) {
      Todo.all
    }
  end

  field :todo, Types::TodoType do
    description 'Retrieve a todo by id'
    
    argument :id, !types.ID, 'The ID of the todo to retrieve'
    resolve -> (obj, args, ctx) {
      Todo.find(args[:id])
    }
  end

  field :userTodos, types[Types::TodoType] do
    description 'Retrieve a list of all todo'
    
    argument :user_id, !types.ID, 'The ID of the todo to retrieve'
    resolve ->(obj, args, ctx) {
      User.find(args[:user_id]).todos
    }
  end

  field :todolists, types[Types::TodoListType] do
    description 'Retrieve a list of all todolist'
    
    resolve ->(obj, args, ctx) {
      TodoList.all
    }
  end

  field :todolist, Types::TodoListType do
    description 'Retrieve a todolist by id'
    
    argument :id, !types.ID, 'The ID of the todolist to retrieve'
    resolve -> (obj, args, ctx) {
      TodoList.find(args[:id])
    }
  end
  
end
