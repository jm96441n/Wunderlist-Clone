var TodoList = React.createClass({
  handleTodoClick(id){
    this.props.handleTodoClick(id)
  },

  render(){
    var todoNodes = this.props.list.map((todo) => {
      return(
        <li key={todo.id}>
          <TodoNode
            todo={todo.name}
            id={todo.id}
            handleClick={this.handleTodoClick}
            />
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
