var Todo = React.createClass({
  render(){
    return(
      <div>
        <h3>{this.props.todo.name}</h3>
        <p>{this.props.todo.priority}</p>
        <p>{this.props.todo.status}</p>
        <p>{this.props.todo.description}</p>
        <p>{this.props.todo.due_date}</p>
      </div>
    )
  }
})
