var FILES = [
  {name: ".", type: "d"},
  {name: "..", type: "d"},
  {name: "README", type: "f"},
  {name: "resume", type: "f", href: "resume.html"}
];

var COMMANDS = [
  {id: 1, input: "whoami", output: function(){ return createStdOut("guest") }},
  {id: 2, input: "whereami", output: function(){ return createStdOut("the website of Scot Dalton") }},
  {id: 3, input:"pwd", output: function(){ return (React.createElement(StdOut, {output: React.createElement(Directory, {name: "/home/scot"})})); }},
  {id: 4, input:"ls -a", output: function(){ return (React.createElement(Ls, {files: FILES})); }},
  {id: 5, input:"cat README", output:function(){ return (""); }}
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
        return (React.createElement(Directory, {name: file.name}));
      } else {
        if (file.href == undefined) {
          return (React.createElement(File, {name: file.name}));
        } else {
          return (React.createElement(LinkedFile, {name: file.name, href: file.href}));
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
