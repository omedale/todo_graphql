Types::TodoListType = GraphQL::ObjectType.define do
  name 'TodoList'

  field :id, !types.ID
  field :name, !types.String
  field :desc, !types.String
  field :todo, -> { Types::TodoType }, property: :todo
end