var UserInfo = React.createClass({
  render(){
    return(
      <div className="col s8 m8 l8 center-align">
        <h3>Hey {this.props.user.name} here are your task lists!</h3>
      </div>
    )
  }
})
