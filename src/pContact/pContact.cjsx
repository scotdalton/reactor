React = require 'react'
Shell = require 'bShell/bShell.cjsx'
File = require 'bFile/bFile.cjsx'

ContactCfg =
  readme: "Drop me a line at scotdalton at gmail dot com."
  files: [
    {id: "f1", name: ".", type: "d", href: "contact"},
    {id: "f2", name: "..", type: "d", href: "home"},
    {id: "f3", name: "README", type: "f"}
  ]
  commands: [
    {id: "c1", input:"pwd", output: -> <File type="d" name="/home/scot/contact" />},
    {id: "c2", input:"ls -a", output: -> ContactCfg.files},
    {id: "c3", input:"cat README", output: -> ContactCfg.readme}
  ]

module.exports = React.createClass
  render: ->
    <div className="pContact">
      <Shell
        commands={ContactCfg.commands}
        intro={true}
        tty={@props.tty}
        onClick={@props.onClick} />
    </div>
