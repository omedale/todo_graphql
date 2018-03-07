Types::TodoType = GraphQL::ObjectType.define do
  name 'Todo'

  field :id, !types.ID
  field :name, !types.String
  field :desc, !types.String
  field :owner, -> { Types::UserType }, property: :user
end