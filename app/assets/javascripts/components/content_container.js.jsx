var ContentContainer = React.createClass({
  getInitialState(){
    return {
      lists: [],
      content: this.props.content,
      selectList: this.props.selectList,
    }
  },
  componentWillReceiveProps(nextProps){
    this.setState({
      lists: nextProps.lists
    })
  },
  handleClick(id){
    this.props.loadListFromServer(id)
  },
  render(){
    var self = this
    var listNodes = this.props.lists.map((list) => {
      return(
        <li
          key={list.id}
          onClick={self.handleClick(list.id)}>
          <List
            list={list.name}
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
          <List
            list={this.state.selectList}
            />
        </div>
      )
    }
  }
})
