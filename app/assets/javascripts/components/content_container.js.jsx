var ContentContainer = React.createClass({
  getInitialState(){
    return {
      lists: [],
      content: 'lists',
      selectList: '',
    }
  },
  componentWillReceiveProps(nextProps){
    this.setState({
      lists: nextProps.lists,
      content: nextProps.content,
      selectList: nextProps.selectList
    })
  },
  handleClick: (id) => {
    this.props.loadListFromServer(id)
  },
  render(){
    var self = this
    var listNodes = this.props.lists.map((list) => {
      return(
        <li key={list.id}>
          <List
            id={list.id}
            list={list.name}
            onClick={self.handleClick()}
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
    else if(content == 'list'){
      return(
        <div>
          <TodoList
            list={this.state.list}
            />
        </div>
      )
    }
  }
})
