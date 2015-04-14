Shell = React.createClass
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
    if @props.intro
      <Intro />
    else
      <LastLogin />

  render: ->
    <div className="bShell">
      {@renderIntro()}
      {@state.commands.map @createCommand}
    </div>
