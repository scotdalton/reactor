var createStdOut = function(output) {
  return (<StdOut output={output} />);
}

var StdIn = React.createClass({
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
      <div className="stdin">
        <Prompt />
        {this.state.input}
      </div>
    );
  }
});

var StdOut = React.createClass({
  render: function() {
    return (
      <div className="stdout">
        {this.props.output}
      </div>
    );
  }
});

var Intro = React.createClass({
  render: function() {
    return (
      <div className="intro">
        Scot Dalton<br />
        Software Engineer<br />
        Brooklyn, NY
      </div>
    );
  }
});

var LastLogin = React.createClass({
  render: function() {
    return (
      <div className="lastLogin">
      </div>
    );
  }
});

var Prompt = React.createClass({
  render: function() {
    return (
      <span className="prompt">
        ~&gt; <Directory name="scot"/>
      </span>
    );
  }
});

var Directory = React.createClass({
  render: function() {
    return (
      <span className="directory">
        {this.props.name} {""}
      </span>
    );
  }
});

var LinkedDirectory = React.createClass({
  render: function() {
    return (
      <a className="directory" href={this.props.href}>
        {this.props.name} {""}
      </a>
    );
  }
});

var File = React.createClass({
  render: function() {
    return (
      <span className="file">
        {this.props.name} {""}
      </span>
    );
  }
});

var LinkedFile = React.createClass({
  render: function() {
    return (
      <a className="file" href={this.props.href} target="_blank">
        {this.props.name} {""}
      </a>
    );
  }
});

var Ls = React.createClass({
  render: function() {
    var contents = this.props.files.map(function (file) {
      if (file.type == "d") {
        if (file.href == undefined) {
          return (<Directory key={file.id} name={file.name} />);
        } else {
          return (<LinkedDirectory key={file.id} name={file.name} href={file.href} />);
        }
      } else {
        if (file.href == undefined) {
          return (<File key={file.id} name={file.name} />);
        } else {
          return (<LinkedFile key={file.id} name={file.name} href={file.href} />);
        }
      }
    });
    return (<StdOut output={contents} />);
  }
});

var Command = React.createClass({
  getInitialState: function() {
    return {stdout: null};
  },
  inputComplete: function() {
    this.setState({stdout: this.props.output});
    this.props.onComplete();
  },
  render: function() {
    return (
      <div className="command">
        <StdIn input={this.props.input} onComplete={this.inputComplete} />
        {this.state.stdout}
      </div>
    )
  }
});

var Shell = React.createClass({
  getInitialState: function() {
    return {commands: []};
  },
  createCommand: function(data) {
    return(
      <Command
        key={data.id}
        onComplete={this.runNextCommand}
        input={data.input}
        output={data.output()}
      />
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
        <Intro />
      );
    } else {
      return <LastLogin />;
    }
  },
  render: function() {
    return (
      <div className="shell">
        {this.renderIntro()}
        {this.state.commands.map(this.createCommand)}
      </div>
    );
  }
});
