var Dropdown = React.createClass({
    getInitialState(){
      return {listVisible: false}
    },
    selectedItem(item){
      this.props.selectedItem(item)
    },
    show(){
      this.setState({listVisible: true})
      document.addEventListenter("click", this.hide)
    },
    hide(){
      this.setState({listVisible: false})
      document.removeEventListener("click", this.hide)
    },
    render(){
      var i = 0
      var listNodes = this.props.list.map((item)=>{
        i += 1
        return(
          <div key={i} onClick={this.selectedItem.bind(null, item)}>
            <span>{item}</span>
          </div>
        )
      })
      return(
        <div className={"dropdown-container" + (this.state.listVisible ? " show" : "")}>
          <div className={"dropdown-display" + (this.state.listVisible ? " clicked" : "")} onClick={this.show}>
            <span>{this.props.selected}</span>
          </div>
          <div className="dropdown-list">
            {listNodes}
          </div>
        </div>
      )
    }

})
