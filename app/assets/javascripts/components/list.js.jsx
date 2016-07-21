var List = React.createClass({
  handleClick(e){
    e.preventDefault();
    this.props.handleClick(this.props.id)
  },
  render(){
    var self = this
    return(
      <div className='center-align'>
        <a
          href='#'
          onClick={this.handleClick}
          >
          {self.props.list}
        </a>
      </div>
    )
  }
})
