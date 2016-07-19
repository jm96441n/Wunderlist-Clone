var List = React.createClass({
  render(){
    var self = this
    return(
      <div>
        <p>
          {self.props.list}
        </p>
      </div>
    )
  }
})
