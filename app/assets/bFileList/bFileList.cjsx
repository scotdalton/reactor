FileList = React.createClass
  render: ->
    onClick = @props.onClick
    contents = @props.files.map (file) ->
      <li key={file.id} className="bFileList_item">
        {
          if file.type == "d"
            if file.href == undefined
              <Directory name={file.name} /> {" "}
            else
              <LinkedDirectory name={file.name} href={file.href} onClick={onClick} />
          else
            if file.href == undefined
              <File name={file.name} />
            else
              <LinkedFile name={file.name} href={file.href} />
        } {" "}
      </li>
    <StdOut output={<ul className="bFileList">{contents}</ul>} />
