var TodoList = React.createClass({

  render(){
    var todoNodes = this.props.list.map((todo) => {
      return(
        <li key={todo.id}>
          <TodoNode todo={todo.name}/>
        </li>
      )
    })
    return(
      <div>
        <p>{this.props.name}</p>
        <ul>
          {todoNodes}
        </ul>
      </div>
    )
  }
})
