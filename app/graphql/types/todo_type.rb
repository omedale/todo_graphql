Types::TodoType = GraphQL::ObjectType.define do
  name 'User'

  field :id, !types.ID
  field :name, !types.String
  field :desc, !types.String
  field :user, -> { Types::UserType }
end