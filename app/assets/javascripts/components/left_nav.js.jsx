var LeftNav = React.createClass({
  getInitialState(){
    return (
      {
        lists: [],
        selectList: ''
      }
    )
  },
  componentWillReceiveProps(nextProps){
    this.setState({
      lists: nextProps.lists,
      selectList: nextProps.selectList
    })
  },
  handleHomeClick(e){
    e.preventDefault();
    this.props.handleHomeClick()
  },
  handleListClick(id){
    this.props.loadListFromServer(id)
  },
  render(){
    listNodes = this.state.lists.map((list)=>{
      return(
        <div
          key={list.id}
          >
          <List
            list={list.name}
            id={list.id}
            handleClick={this.handleListClick}
            />
            <div className='divider'></div>
        </div>
      )
    })
    return(
      <div className='center-align'>
          <a href="#" onClick={this.handleHomeClick}>Home</a>
        <div className='divider'></div>
        {listNodes}
      </div>
    )
  }
})
