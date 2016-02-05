React = require 'react'

module.exports = React.createClass
  propTypes:
    output: React.PropTypes.node.isRequired

  render: ->
    <div className="bStdOut">
      {this.props.output}
    </div>
