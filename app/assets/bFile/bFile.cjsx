Directory = React.createClass
  render: ->
    <span className="bDirectory">
      {this.props.name}
    </span>

LinkedDirectory = React.createClass
  render: ->
    <a className="bDirectory" href={this.props.href} data-href={this.props.href} onClick={@props.onClick}>
      {this.props.name}
    </a>

File = React.createClass
  render: ->
    <span className="bFile">
      {this.props.name}
    </span>

LinkedFile = React.createClass
  render: ->
    <a className="bFile" href={this.props.href} target="_blank">
      {this.props.name}
    </a>
