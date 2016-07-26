var EditTodo = React.createClass({
  getInitialState(){
    return {
      priority: this.props.todo.priority,
      description: this.props.todo.description,
      name: this.props.todo.name,
      status: this.props.todo.status
    }
  },
  handleDescriptionChange(description){
    this.setState({description: description})
  },
  handleNameChange(name){
    this.setState({name: name})
  },
  handlePriorityChange(priority){
    this.setState({priority: priority})
  },
  handleStatusChange(status){
    this.setState({status: status})
  },
  handleSubmit(event){
    event.preventDefault();
    var url = '/todos/'+this.props.todo.id
    $.ajax({
      url: url,
      method: 'PUT',
      data: this.state,
      success: (response) => {
        this.props.handleAfterEdit();
      },
      error: (xhr,status, err) => {
        console.error(this.props.url,status,err.toString())
      }
    })
  },
  render(){
    var PRIORITY_OPTIONS = ["Low","Medium","High"]
    var STATUS_OPTIONS = ["Not Started","In Progress","Completed"]
    return(
      <div className="card-panel edit_form">
        <form ref="editForm" action={this.props.form.action} method="PUT" onSubmit={this.handleSubmit}>
          <input type="hidden" name={this.props.form.csrf_param} value={this.props.form.csrf}/>
          <p>Edit: {this.props.todo.name}</p>

          <EditName handleNameChange={this.handleNameChange} name={this.state.name}/>
          <EditDescription handleDescriptionChange={this.handleDescriptionChange} description={this.state.description}/>
          <p>Priority</p>
          <Dropdown
            selected={this.state.priority}
            handleSelection={this.handlePriorityChange}
            list={PRIORITY_OPTIONS} />
         <p>Status</p>
         <Dropdown
            selected={this.state.description}
            handleSelection={this.handleStatusChange}
            list={STATUS_OPTIONS}
            />
          <button
            className="btn waves-effect waves-light"
            type="submit"
            name="action"
            >
            Submit
            <i className="material-icons right"></i>
          </button>
        </form>
      </div>
    )
  }
})
