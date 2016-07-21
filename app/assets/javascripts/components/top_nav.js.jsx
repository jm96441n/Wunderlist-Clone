var TopNav = React.createClass({
    handleClick(e){
      e.preventDefault();
      this.props.handleHomeClick()
    },
    render(){
      return (
        <div>
          <p>Hey {this.props.user} this is are your lists!</p>
          <a href="#" onClick={this.handleClick}>Home</a>
        </div>
      )
    }
})
