var TodoNode = React.createClass({
  handleClick(e){
    e.preventDefault();
    this.props.handleClick(this.props.id)
  },
  render(){
    return (
      <div>
        <a href='#' onClick={this.handleClick}>{this.props.todo}</a>
      </div>
    )
  }
})
