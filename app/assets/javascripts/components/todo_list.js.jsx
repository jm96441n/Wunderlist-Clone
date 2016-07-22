var TodoList = React.createClass({
  handleEditClick(id){
    this.props.handleEditClick(id)
  },

  render(){
    var todoNodes = this.props.list.map((todo) => {
      return(
        <li key={todo.id}>
          <Todo
            todo={todo}
            id={todo.id}
            handleEditClick={this.handleEditClick}
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
