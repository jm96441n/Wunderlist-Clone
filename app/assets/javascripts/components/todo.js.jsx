var Todo = React.createClass({
  render(){
    return(
      <div className="card-panel hoverable todos">
        <h5>{this.props.todo.name}</h5>
        <p>Priority: {this.props.todo.priority}</p>
        <p>Status: {this.props.todo.status}</p>
        <p>Description: {this.props.todo.description}</p>
        <p>Due Date: {this.props.todo.due_date}</p>
      </div>
    )
  }
})
