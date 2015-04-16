React = require 'react'
File = require '../bFile/bFile.cjsx'

module.exports = React.createClass
  render: ->
    <span className="bPrompt">
      ~&gt; <File type="d" name="scot"/>
    </span>
