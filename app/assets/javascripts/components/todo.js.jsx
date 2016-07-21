var Todo = React.createClass({
  render(){
    return(
      <div>
        <h3>{this.props.todo.name}</h3>
        <p>Priority: {this.props.todo.priority}</p>
        <p>Status: {this.props.todo.status}</p>
        <p>Description: {this.props.todo.description}</p>
        <p>Due Date: {this.props.todo.due_date}</p>
      </div>
    )
  }
})
