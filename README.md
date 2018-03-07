## Installation
```
$ git clone https://github.com/omedale/todo_graphql.git
```

```
cd todo_graphql
```

```
$ bundle install
```

## Create Database

```
rails db:create
```

## Migrate Tables

```
rails db:Migrate
```

## start app
```
$ rails s
```

###GraphQl will be launched on the the URL bellow
```
http://localhost:3000/graphiql
```

## create User

```
mutation {
  createUser (
    name: "medale",
    authProvider: {
      email: {
      email: "omedale@yahoo.com",
      password: "12345"
    }
    }
  ) {
    id
    name
    email
  }

}
```

## Sign In User
```
mutation {
  signinUser (
   email: {
    email:  "omedale@yahoo.com",
    password: "12345"
  }
  
  ) {
    token
  }
}
```

## Create Todo
```
mutation {
  createTodo(
    desc: "My flight List"
    name: "Flight list"
  ) {
    id
    desc
    name
  }
}
```

## create flight todoList
```
mutation {
  createTodoList(
    desc: "were u dere",
    name: "I was not",
    todoId: 1
  ) {
    id
  }
}
```

## Get all todo
```
query {
  todos {
    id
    owner
    name
  }
}
```

## Get todo
```
query {
  todo(id: 1) {
    id
    owner {
      id
      name
    }
    name
    desc
  }
}
```
## Get all todo list
```
query {
  todolists {
    id
    name
    todo {
      id
      name
    }
  }
}
```

## get todolists
```
query {
  todolist(id: 3) {
    id
    name
    todo {
      id
      name
    }
  }
}
```