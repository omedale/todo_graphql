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

end
