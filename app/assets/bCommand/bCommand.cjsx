React = require 'react'
FileList = require '../bFileList/bFileList.cjsx'
StdIn = require '../bStdIn/bStdIn.cjsx'
StdOut = require '../bStdOut/bStdOut.cjsx'

module.exports = React.createClass
  propTypes:
    onComplete: React.PropTypes.func

  getDefaultProps: ->
    # Noop
    onComplete: ->

  getInitialState: ->
    stdOut: null

  stdOut: ->
    if @props.input == 'ls -a'
      <StdOut output={<FileList files={@props.output} onClick={@props.onClick} />} />
    else
      <StdOut output={@props.output} />

  inputComplete: ->
    @setState
      stdOut: @stdOut()
    @props.onComplete()

  render: ->
    <div className="bCommand">
      <StdIn input={@props.input} onComplete={@inputComplete} tty={@props.tty} />
      {@state.stdOut}
    </div>
