React = require 'react'
Shell = require '../bShell/bShell.cjsx'
File = require '../bFile/bFile.cjsx'

CvCfg =
  readme: "Vitae coming soon."
  files: [
    {id: "f1", name: ".", type: "d", href: "cv"},
    {id: "f2", name: "..", type: "d", href: "home"},
    {id: "f3", name: "README", type: "f"}
  ]
  commands: [
    {id: "c1", input:"pwd", output: -> <File type="d" name="/home/scot/cv" />},
    {id: "c2", input:"ls -a", output: -> CvCfg.files},
    {id: "c3", input:"cat README", output: -> CvCfg.readme}
  ]

module.exports = React.createClass
  render: ->
    <Shell
      commands={CvCfg.commands}
      intro={true}
      tty={@props.tty}
      onClick={@props.onClick} />
