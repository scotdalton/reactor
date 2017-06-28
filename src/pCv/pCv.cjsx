React = require 'react'
Shell = require 'bShell/bShell.cjsx'
File = require 'bFile/bFile.cjsx'

CvCfg =
  readme:
    """
    For now, click on the the scot.pdf file above.
    Interactive vitae coming soon.
    """
  files: [
    {id: "f1", name: ".", type: "d", href: "cv"},
    {id: "f2", name: "..", type: "d", href: "home"},
    {id: "f3", name: "README", type: "f"}
    {id: "f4", name: "scot.pdf", type: "f", href: "https://www.dropbox.com/s/we5qiz2ywt2bh6u/scot.pdf"}
  ]
  commands: [
    {id: "c1", input:"pwd", output: -> <File type="d" name="/home/scot/cv" />},
    {id: "c2", input:"ls -a", output: -> CvCfg.files},
    {id: "c3", input:"cat README", output: -> CvCfg.readme}
  ]

module.exports = React.createClass
  render: ->
    <div className="pCv">
      <Shell
        commands={CvCfg.commands}
        intro={true}
        tty={@props.tty}
        onClick={@props.onClick} />
    </div>
