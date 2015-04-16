React = require 'react'
Shell = require '../bShell/bShell.cjsx'
File = require '../bFile/bFile.cjsx'

AboutCfg =
  readme: "I'm a full stack engineer with over 10 years of experience."
  files: [
    id: "f1",
    name: ".",
    type: "d",
    href: "about"
  ,
    id: "f2",
    name: "..",
    type: "d",
    href: "home"
  ,
    id: "f3",
    name: "README",
    type: "f"
  ]
  commands: [
    id: "c1",
    input:"pwd",
    output: -> <File type="d" name="/home/scot/about" />
  ,
    id: "c2",
    input:"ls -a",
    output: -> AboutCfg.files
  ,
    id: "c3",
    input:"cat README",
    output: -> AboutCfg.readme
  ]

module.exports = React.createClass
  render: ->
    <Shell
      commands={AboutCfg.commands}
      intro={true}
      tty={@props.tty}
      onClick={@props.onClick} />
