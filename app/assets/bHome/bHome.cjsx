React = require 'react'
Shell = require '../bShell/bShell.cjsx'
File = require '../bFile/bFile.cjsx'

HomeCfg =
  readme: "Welcome to my little piece of the internet.
           To learn a bit more about me, click on the directories above."
  files: [
    {id: "f1", name: ".", type: "d", href: "home"},
    {id: "f2", name: "..", type: "d", href: "home"},
    {id: "f3", name: ".github", type: "f", href: "https://github.com/scotdalton"},
    {id: "f4", name: "about", type: "d", href: "about"},
    {id: "f5", name: "contact", type: "d", href: "contact"},
    {id: "f6", name: "cv", type: "d", href: "cv"},
    {id: "f7", name: "linkedin", type: "f", href: "https://linkedin.com/in/scotdalton"},
    {id: "f8", name: "README", type: "f"}
  ]
  commands: [
    {id: "c1", input: "whoami", output: -> "Scot Dalton"},
    {id: "c2", input: "whatami", output: -> "A Software Engineer"},
    {id: "c3", input: "whereami", output: -> "Brooklyn, NY" },
    {id: "c4", input:"pwd", output: -> <File type="d" name="/home/scot" />},
    {id: "c5", input:"ls -a", output: -> HomeCfg.files},
    {id: "c6", input:"cat README", output: -> HomeCfg.readme}
  ]

module.exports = React.createClass
  render: ->
    <div className="bHome">
      <Shell
        commands={HomeCfg.commands}
        intro={false}
        tty={@props.tty}
        onClick={@props.onClick} />
    </div>
