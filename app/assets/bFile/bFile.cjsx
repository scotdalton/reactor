React = require 'react'

module.exports = React.createClass
  propTypes:
    type: React.PropTypes.oneOf(['f','d'])
    name: React.PropTypes.string.isRequired
    href: React.PropTypes.string
    onClick: React.PropTypes.func

  getDefaultProps: ->
    type: 'f'

  render: ->
    if @props.type is 'd'
      if @props.href?
        <a className="bDirectory" href={@props.href} data-href={@props.href} onClick={@props.onClick}>
          {@props.name}
        </a>
      else
        <span className="bDirectory">
          {@props.name}
        </span>
    else
      if @props.href?
        <a className="bFile" href={@props.href} target="_blank">
          {@props.name}
        </a>
      else
        <span className="bFile">
          {@props.name}
        </span>
