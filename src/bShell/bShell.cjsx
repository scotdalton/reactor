React = require 'react'
Command = require 'bCommand/bCommand.cjsx'
Intro = require 'bIntro/bIntro.cjsx'

commmandShape = React.PropTypes.shape
  id: React.PropTypes.string
  input: React.PropTypes.string
  output: React.PropTypes.func

module.exports = React.createClass
  propTypes:
    commands:
      React.PropTypes.arrayOf commmandShape
      .isRequired
    intro: React.PropTypes.bool

  getDefaultProps: ->
    intro: false

  getInitialState: ->
    commands: []

  createCommand: (data) ->
    <Command
      key={data.id}
      onComplete={@runNextCommand}
      input={data.input}
      output={data.output()}
      tty={@props.tty}
      onClick={@props.onClick} />

  runNextCommand: ->
    if @props.tty
      if @state.commands.length != @props.commands.length
        @setState
          commands: @props.commands.slice(0, @state.commands.length + 1)
    else
      @setState
        commands: @props.commands

  componentDidMount: ->
    @runNextCommand()

  renderIntro: ->
    <Intro /> if @props.intro?

  render: ->
    <div className="bShell">
      {@renderIntro()}
      {@state.commands.map @createCommand}
    </div>
