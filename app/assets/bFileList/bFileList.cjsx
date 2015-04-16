React = require 'react'
File = require '../bFile/bFile.cjsx'
StdOut = require '../bStdOut/bStdOut.cjsx'

module.exports = React.createClass
  propTypes:
    files:
      React.PropTypes.arrayOf(
        React.PropTypes.shape(
          id: React.PropTypes.string
          name: React.PropTypes.string
          type: React.PropTypes.string
          onClick: React.PropTypes.func
        )
      ).isRequired

  getDefaultProps: ->
    type: 'f'

  render: ->
    onClick = @props.onClick
    contents = @props.files.map (file) ->
      <li key={file.id} className="bFileList_item">
        <File
          name={file.name}
          type={file.type}
          href={file.href}
          onClick={onClick} /> {" "}
      </li>
    <ul className="bFileList">{contents}</ul>
