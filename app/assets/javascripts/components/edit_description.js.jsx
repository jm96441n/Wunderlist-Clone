var EditDescription = React.createClass({
  getInitialState(){
    return{description: this.props.description}
  },
  handleDescriptionChange(event){
    var description = event.target.value
    this.props.handleDescriptionChange(description)
    this.setState({description: description})
  },
  render(){
    return(
      <div>
        <p>Description</p>
        <textarea
          name="description"
          value={this.props.description}
          onChange={this.handleDescriptionChange} />
      </div>
    )
  }

})
