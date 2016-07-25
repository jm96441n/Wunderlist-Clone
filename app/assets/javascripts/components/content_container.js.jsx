var ContentContainer = React.createClass({
  getInitialState(){
    return {
      lists: [],
      content: '',
      selectList: this.props.selectList,
      todo: '',
      selectedTodo: ''
    }
  },
  componentWillReceiveProps(nextProps){
    this.setState({
      lists: nextProps.lists,
      content: nextProps.content,
      selectList: nextProps.selectList,
      todo: nextProps.todo
    })
  },
  handleEditClick(id){
    this.props.handleEditClick(id)
  },
  render(){
    var self = this
    if(this.state.content == ''){
      return(
        <div className="content">
          <p>Todo's are here</p>
        </div>
      )
    }
    else if(this.state.content == 'list'){
      return(
        <div className="content">
          <TodoList
            list={this.state.selectList}
            handleEditClick={this.handleEditClick}
            />
        </div>
        )
      }
    else if(this.state.content == 'edit'){
      return(
        <div className="content">
          <EditTodo
            todo={this.props.todo}
            form={this.props.form}
            />
        </div>
      )
    }
  }
})
