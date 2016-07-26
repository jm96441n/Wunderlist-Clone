var EditName = React.createClass({
  getInitialState(){
    return{name: this.props.name}
  },
  handleNameChange(event){
    var name = event.target.value
    this.props.handleNameChange(name)
    this.setState({name: name})
  },
  render(){
    return(
      <div>
        <p>Name</p>
        <input type="text" value={this.props.name} onChange={this.handleNameChange}/>
      </div>
    )
  }
})
