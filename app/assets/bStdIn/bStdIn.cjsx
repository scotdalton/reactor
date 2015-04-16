React = require 'react'
Prompt = require '../bPrompt/bPrompt.cjsx'

module.exports = React.createClass
  propTypes:
    input: React.PropTypes.string.isRequired
    tty: React.PropTypes.bool
    onComplete: React.PropTypes.func

  getDefaultProps: ->
    tty: false
    # Noop
    onComplete: ->

  getInitialState: ->
    input: ''

  type: ->
    if @props.tty
      if @state.input.length != @props.input.length
        @setState
          input: @props.input.slice(0, @state.input.length + 1)
        setTimeout(this.type, 200)
      else
        @props.onComplete()
    else
      @setState
        input: @props.input
      @props.onComplete()

  componentDidMount: ->
    @type()

  render: ->
    <div className="bStdIn">
      <Prompt />
      {this.state.input}
    </div>
