var Dropdown = React.createClass({
    getInitialState(){
      return(
        {selected: this.props.selected || ''}
      )
    },
    handleSelection(event){
      var item = event.target.value
      this.props.handleSelection(item);
      this.setState({selected: item})
    },
    componentDidMount() {
      var element = ReactDOM.findDOMNode(this.refs.dropdown)
      $(element).on('change',this.handleSelection);
      $(element).ready(function() {
        $('select').material_select();
      });
    },
    render(){
      var self = this
      var i = 0
      var listNodes = self.props.list.map((item)=>{
        i += 1
        return(
        <option key={i} value={item}>{item}</option>
        )
      })
      return(
        <div class="input-field col s12">
         <select ref="dropdown" value={self.state.selected} onChange={this.handleSelection}>
            <option value="" disabled>Choose One</option>
           {listNodes}
         </select>
       </div>
      )
    }

})
