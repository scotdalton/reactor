Command = React.createClass
  getInitialState: ->
    stdOut: null

  stdOut: ->
    if @props.input == 'ls -a'
      <FileList files={@props.output} onClick={@props.onClick} />
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
