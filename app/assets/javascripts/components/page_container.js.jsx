var PageContainer = React.createClass({
  getInitialState(){
    return {
      todo_lists: []
    }
  },
  loadListsFromServer(){
    $.ajax({
      method: "GET",
      url: "/todo_lists",
      dataType: 'json',
      success: (lists) => {
        this.setState({
          todo_lists: lists
        })
      }.bind(this),
      error: (xhr,status,err) => {
        console.error(this.props.url,status.err.toString())
      }.bind(this)
    });
  },
  componentWillMount(){
    this.loadListsFromServer();
  },
  render(){
    return(
      <ContentContainer lists={this.state.todo_lists}/>
    )
  }
});
