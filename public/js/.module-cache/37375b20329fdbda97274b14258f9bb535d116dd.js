var FILES = [
  {id: "f1", name: ".", type: "d"},
  {id: "f2", name: "..", type: "d"},
  {id: "f3", name: "README", type: "f"},
  {id: "f4", name: "resume", type: "d", href: "resume.html"}
];

var COMMANDS = [
  {id: "c1", input: "whoami", output: function(){ return createStdOut("A Software Engineer") }},
  {id: "c2", input: "whereami", output: function(){ return createStdOut("Brooklyn, NY") }},
  {id: "c3", input:"pwd", output: function(){ return createStdOut(React.createElement(Directory, {name: "/home/scot"})); }},
  {id: "c4", input:"ls -a", output: function(){ return (React.createElement(Ls, {files: FILES})); }},
  {id: "c5", input:"cat README", output: function(){ return createStdOut("Click the resume link above!"); }}
]

var createStdOut = function(output) {
  return (React.createElement(StdOut, {output: output}));
}

var StdIn = React.createClass({displayName: "StdIn",
  getInitialState: function() {
    return {input: ''};
  },
  type: function() {
    if(this.state.input.length != this.props.input.length) {
      var length = this.state.input.length + 1;
      this.setState({input: this.props.input.slice(0, length)});
      setTimeout(this.type, 200);
    } else {
      this.props.onComplete();
    }
  },
  componentDidMount: function() {
    this.type();
  },
  render: function() {
    return (
      React.createElement("div", {className: "stdin"}, 
        React.createElement(Prompt, null), 
        this.state.input
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

var LinkedDirectory = React.createClass({displayName: "LinkedDirectory",
  render: function() {
    return (
      React.createElement("a", {className: "directory", href: this.props.href}, 
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

var Ls = React.createClass({displayName: "Ls",
  render: function() {
    var contents = this.props.files.map(function (file) {
      if (file.type == "d") {
        if (file.href == undefined) {
          return (React.createElement(Directory, {key: file.id, name: file.name}));
        } else {
          return (React.createElement(LinkedDirectory, {key: file.id, name: file.name, href: file.href}));
        }
      } else {
        if (file.href == undefined) {
          return (React.createElement(File, {key: file.id, name: file.name}));
        } else {
          return (React.createElement(LinkedFile, {key: file.id, name: file.name, href: file.href}));
        }
      }
    });
    return (React.createElement(StdOut, {output: contents}));
  }
});

var Command = React.createClass({displayName: "Command",
  getInitialState: function() {
    return {stdout: null};
  },
  inputComplete: function() {
    this.setState({stdout: this.props.output});
    this.props.onComplete();
  },
  render: function() {
    return (
      React.createElement("div", {className: "command"}, 
        React.createElement(StdIn, {input: this.props.input, onComplete: this.inputComplete}), 
        this.state.stdout
      )
    )
  }
});

var Shell = React.createClass({displayName: "Shell",
  getInitialState: function() {
    return {commands: []};
  },
  createCommand: function(data) {
    return(
      React.createElement(Command, {
        key: data.id, 
        onComplete: this.runNextCommand, 
        input: data.input, 
        output: data.output()}
      )
    );
  },
  runNextCommand: function() {
    if(this.state.commands.length != this.props.commands.length) {
      var length = this.state.commands.length + 1;
      this.setState({commands: this.props.commands.slice(0, length)});
    }
  },
  componentDidMount: function() {
    this.runNextCommand();
  },
  render: function() {
    return (
      React.createElement("div", {className: "shell"}, 
        this.state.commands.map(this.createCommand)
      )
    );
  }
});

React.render(
  React.createElement(Shell, {commands: COMMANDS}),
  document.getElementById('content')
);
