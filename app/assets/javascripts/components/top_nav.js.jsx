var TopNav = React.createClass({

    render(){
      return (
        <div className='row'>
          <UserInfo
            user={this.props.user}
            />
          <LogoutButton/>
          <ProfileButton/>
        </div>
      )
    }
})
