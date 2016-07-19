var ContentContainer = React.createClass({
  getInitialState(){
    return {
      lists: [],
      content: this.props.content,
      selectList: this.props.selectList,
      selectListName: ''
    }
  },
  componentWillReceiveProps(nextProps){
    this.setState({
      lists: nextProps.lists,
      content: nextProps.content,
      selectList: nextProps.selectList
    })
  },
  handleClick(id){
    this.state.lists.filter((list)=>{
      if(list.id == id){
        this.setState({selectListName: list.name})
      }
    })
    this.props.loadListFromServer(id)
  },
  render(){
    var self = this
    var listNodes = this.props.lists.map((list) => {
      return(
        <li key={list.id}>
          <List
            list={list.name}
            id={list.id}
            handleClick={this.handleClick}
            />
        </li>
      )
    })
    if(this.state.content == 'lists'){
      return(
        <div>
          <ul>
            {listNodes}
          </ul>
        </div>
      )
    }
    else if(this.state.content == 'list'){
      return(
        <div>
          <TodoList
            name={this.state.selectListName}
            list={this.state.selectList}
            />
        </div>
      )
    }
  }
})
