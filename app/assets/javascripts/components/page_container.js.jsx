var PageContainer = React.createClass({
  getInitialState(){
    return {
      todo_lists: [],
      content: '',
      selectList: [],
      user: this.props.info.user,
      todo: '',
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
  loadListFromServer(id){
    var url = '/todo_lists/'+id
    $.ajax({
      method: 'GET',
      dataType: 'json',
      url: url,
      success: (list) => {
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
  handleHomeClick(){
    this.setState({
      content: '',
      selectList: []
    })
  },
  handleEditClick(id){
    this.state.selectList.filter((todo)=>{
      if(todo.id == id){
        this.setState({
          todo: todo,
          content: 'edit'
         })
      }
    })
  },
  handleAfterEdit(){
    this.setState({content: 'list'})
  },
  componentWillMount(){
    this.loadListsFromServer();
  },
  render(){
    return(
      <div className="page-containter">
        <div className='row teal lighten-4'>
        <TopNav
          user={this.state.user}
          className='col l12 m12 s12'
          />
          <div className="divider"></div>
        </div>
        <div className="row content-row">
          <div
            className="col s2 m2 l2 content deep-purple lighten-3"
            id="leftnav"
            >
            <LeftNav
              lists={this.state.todo_lists}
              handleHomeClick={this.handleHomeClick}
              loadListFromServer={this.loadListFromServer}
            />
          </div>
          <div
            className="col s10 m10 l10 content blue lighten-3 content"
            >
            <ContentContainer
              user={this.state.user}
              content={this.state.content}
              selectList={this.state.selectList}
              form={this.props.info.form}
              handleEditClick={this.handleEditClick}
              todo={this.state.todo}
              handleAfterEdit={this.handleAfterEdit}
              />
          </div>
        </div>
      </div>
    )
  }
});
