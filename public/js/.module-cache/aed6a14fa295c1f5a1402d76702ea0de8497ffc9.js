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

var Intro = React.createClass({displayName: "Intro",
  render: function() {
    return (
      React.createElement("div", {className: "intro"}, 
        "Scot Dalton", React.createElement("br", null), 
        "Software Engineer", React.createElement("br", null), 
        "Brooklyn, NY"
      )
    );
  }
});

var LastLogin = React.createClass({displayName: "LastLogin",
  render: function() {
    return (
      React.createElement("div", {className: "intro"}, 
        "Last login ", Date.now()
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
  renderIntro: function() {
    if(this.props.intro) {
      return(
        React.createElement(Intro, null)
      );
    } else {
      return React.createElement(LastLogin, null);
    }
  },
  render: function() {
    return (
      React.createElement("div", {className: "shell"}, 
        this.renderIntro, 
        this.state.commands.map(this.createCommand)
      )
    );
  }
});
