var TodoList = React.createClass({
  handleTodoClick(id){
    this.props.handleTodoClick(id)
  },

  render(){
    var todoNodes = this.props.list.map((todo) => {
      return(
        <li key={todo.id}>
          <Todo
            todo={todo}
            id={todo.id}
            handleClick={this.handleTodoClick}
            />
        </li>
      )
    })
    return(
      <div>
        <p>{this.props.list.name}</p>
          <ul>
            {todoNodes}
          </ul>
      </div>
    )
  }
})
