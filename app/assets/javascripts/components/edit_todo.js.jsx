var EditTodo = React.createClass({
  getInitialState(){
    return {priority: this.props.todo.priority}
  },
  handlePriorityChange(priority){
    this.setState({priority: priority})
  },
  render(){
    var PRIORITY_OPTIONS = ["Low","Medium","High"]
    return(
      // <form ref="editForm" action={this.props.form.action} method="POST" >
      //   <input type="hidden" name={this.props.form.csrf_param} value={this.props.form.csrf}/>
        <Dropdown
              selectedItem={this.handlePriorityChange}
              selected={this.state.priority}
              list={PRIORITY_OPTIONS} />

      // </form>
    )
  }
})
