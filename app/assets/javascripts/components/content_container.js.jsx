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
      selectList: nextProps.selectList
    })
  },
  handleTodoClick(id){
    this.state.selectList.filter((todo)=>{
      if(todo.id == id){
        this.setState({
          selectedTodo: todo,
          content: 'todo'
        })
      }
    })
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
            handleTodoClick={this.handleTodoClick}
            />
        </div>
        )
      }
    }
})
