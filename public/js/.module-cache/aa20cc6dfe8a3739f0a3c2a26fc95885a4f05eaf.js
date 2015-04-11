var StdIn = React.createClass({displayName: "StdIn",
  render: function() {
    return (
      React.createElement("div", {className: "stdin"}, 
        React.createElement(Prompt, null), 
        this.props.input
      )
    );
  }
});

var StdOut = React.createClass({displayName: "StdOut",
  render: function() {
    return (
      React.createElement("div", {className: "stdout"}, 
        this.props.output
      )
    );
  }
});

var Prompt = React.createClass({displayName: "Prompt",
  render: function() {
    return (
      React.createElement("span", {className: "prompt"}, 
        "~> ", React.createElement(Directory, {name: "scot"})
      )
    );
  }
});

var Directory = React.createClass({displayName: "Directory",
  render: function() {
    return (
      React.createElement("span", {className: "directory"}, 
        this.props.name
      )
    );
  }
});

var File = React.createClass({displayName: "File",
  render: function() {
    return (
      React.createElement("span", {className: "file"}, 
        this.props.name
      )
    );
  }
});

var LinkedFile = React.createClass({displayName: "LinkedFile",
  render: function() {
    return (
      React.createElement("a", {className: "file", href: this.props.href}, 
        this.props.name
      )
    );
  }
});

var Marker = React.createClass({displayName: "Marker",
  render: function() {
    return (
      React.createElement("span", {className: "marker"}, " ")
    );
  }
});

var files = [
  {name: ".", type: "d"},
  {name: "..", type: "d"},
  {name: "README", type: "f"},
  {name: "resume", type: "f", href: "resume.html"}
];

var Ls = React.createClass({displayName: "Ls",
  render: function() {
    var contents = this.props.files.map(function (file) {
      if (file.type == "d") {
        React.createElement(Directory, {name: file.name})
      } else {
        if (file.href == undefined) {
          React.createElement(File, {name: file.name})
        } else {
          React.createElement(LinkedFile, {name: file.name, href: file.href})
        }
      }
    });
    return (React.createElement(StdOut, {output: contents}));
  }
});

var Shell = React.createClass({displayName: "Shell",
  render: function() {
    return (
      React.createElement("div", {className: "shell"}, 
        React.createElement(StdIn, {input: "whoami"}), 
        React.createElement(StdOut, {output: "guest"}), 
        React.createElement(StdIn, {input: "whereami"}), 
        React.createElement(StdOut, {output: "the website of Scot Dalton"}), 
        React.createElement(StdIn, {input: "pwd"}), 
        React.createElement(StdOut, {output: React.createElement(Directory, {name: "/home/scot"})}), 
        React.createElement(StdIn, {input: "ls -a"}), 
        React.createElement(Ls, {files: files}), 
        React.createElement(StdIn, {input: "cat README"})
      )
    );
  }
});

React.render(
  React.createElement(Shell, null),
  document.getElementById('content')
);
