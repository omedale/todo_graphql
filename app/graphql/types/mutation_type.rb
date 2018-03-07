Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  # Create Post 
  field :createPost, Types::PostType do
    description 'Allows you to create a new blog post'

    argument :title, !types.String
    argument :body, !types.String

    resolve ->(obj, args, ctx) {
      post = Post.new(args.to_h)

      post.save

      post
    }
  end

  #create user
  # field :createUser, Types::UserType do
  #   description 'Allows you to create a new user'

  #   argument :name, !types.String
  #   argument :email, !types.String
  #   argument :password, !types.String

  #   resolve ->(obj, args, ctx) {
  #     user = User.new(args.to_h)

  #     user.save

  #     user
  #   }
  # end

  field :createUser, function: Resolvers::CreateUser.new
  field :signinUser, function: Resolvers::SignInUser.new



  # field :deletePost, Types::PostType do
  #   description 'Delete Post'

  #   argument :id, !types.ID, 'The ID of the blog post to be deleted'

  #   resolve ->(obj, args, ctx) {
  #     Post.delete(args[:id])
  #   }
  # end

end
