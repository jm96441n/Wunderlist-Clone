var ContentContainer = React.createClass({
  getInitialState(){
    return {lists: []}
  },
  componentWillReceiveProps(nextProps){
    this.setState({lists: nextProps.lists})
  },
  render(){
    var nodes = this.props.lists.map((list) => {
      return(
        <li>{list.name}</li>
      )
    })
    return(
      <div>
        <ul>
          {nodes}
        </ul>
      </div>
    )
  }
})
