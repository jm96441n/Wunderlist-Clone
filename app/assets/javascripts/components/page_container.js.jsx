var PageContainer = React.createClass({
  getInitialState(){
    return {
      todo_lists: [],
      content: 'lists',
      selectList: ''
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
  loadListFromServer: (id) => {
    var url = '/todo_lists/'+id
    $.ajax({
      method: 'GET',
      dataType: 'json',
      url: url,
      success: (list) =>{
        this.setState({
          content: 'list',
          selectList: list
        })
      }.bind(this),
      error: (xhr, status, err) => {
        console.error(status, err.toString())
      }.bind(this)
    })
  },
  componentWillMount(){
    this.loadListsFromServer();
  },
  render(){
    return(
      <div>
        <TopNav user={this.props.user}/>
        <ContentContainer
          lists={this.state.todo_lists}
          user={this.state.user}
          content={this.state.content}
          selectList={this.state.selectList}
          loadListFromServer={this.loadListFromServer()}
          />
      </div>
    )
  }
});
