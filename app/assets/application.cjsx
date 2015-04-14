HomeFiles = [
  {id: "f1", name: ".", type: "d", href: "home"},
  {id: "f2", name: "..", type: "d", href: "home"},
  {id: "f3", name: ".github", type: "f", href: "https://github.com/scotdalton"},
  {id: "f4", name: "about", type: "d", href: "about"},
  {id: "f5", name: "contact", type: "d", href: "contact"},
  {id: "f6", name: "cv", type: "d", href: "cv"},
  {id: "f7", name: "linkedin", type: "f", href: "https://linkedin.com/in/scotdalton"},
  {id: "f8", name: "README", type: "f"}
]

AboutFiles = [
  {id: "f1", name: ".", type: "d", href: "about"},
  {id: "f2", name: "..", type: "d", href: "home"},
  {id: "f3", name: "README", type: "f"}
]

ContactFiles = [
  {id: "f1", name: ".", type: "d", href: "contact"},
  {id: "f2", name: "..", type: "d", href: "home"},
  {id: "f3", name: "README", type: "f"}
]

CvFiles = [
  {id: "f1", name: ".", type: "d", href: "cv"},
  {id: "f2", name: "..", type: "d", href: "home"},
  {id: "f3", name: "README", type: "f"}
]

HomeReadme = "Welcome to my little piece of the internet.
              To learn a bit more about me, click on the directories above."
AboutReadme = "I'm a full stack engineer with over 10 years of experience."
ContactReadme = "Drop me a line at scotdalton at gmail dot com."
CvReadme = "Vitae coming soon."

HomeCommands = [
  {id: "c1", input: "whoami", output: -> "Scot Dalton"},
  {id: "c2", input: "whatami", output: -> "A Software Engineer"},
  {id: "c3", input: "whereami", output: -> "Brooklyn, NY" },
  {id: "c4", input:"pwd", output: -> <Directory name="/home/scot" />},
  {id: "c5", input:"ls -a", output: -> HomeFiles},
  {id: "c6", input:"cat README", output: -> HomeReadme}
]

AboutCommands = [
  {id: "c1", input:"pwd", output: -> <Directory name="/home/scot/about" />},
  {id: "c2", input:"ls -a", output: -> AboutFiles},
  {id: "c3", input:"cat README", output: -> AboutReadme}
]

ContactCommands = [
  {id: "c1", input:"pwd", output: -> <Directory name="/home/scot/contact" />},
  {id: "c2", input:"ls -a", output: -> ContactFiles},
  {id: "c3", input:"cat README", output: -> ContactReadme}
]

CvCommands = [
  {id: "c1", input:"pwd", output: -> <Directory name="/home/scot/cv" />},
  {id: "c2", input:"ls -a", output: -> CvFiles},
  {id: "c3", input:"cat README", output: -> CvReadme}
]

Application = React.createClass
  onClick: (event)->
    event.preventDefault()
    tty = @state.tty
    tty[@state.shell] = false
    shell = event.target.dataset.href
    @setState
      shell: shell
      tty: tty


  getInitialState: ->
    shell: 'home'
    tty:
      home: true
      about: true
      contact: true
      cv: true

  render: ->
    switch @state.shell
      when 'about'
        <Shell key="about" commands={AboutCommands} intro={true} tty={@state.tty.about} onClick={@onClick} />
      when 'contact'
        <Shell key="contact" commands={ContactCommands} intro={true} tty={@state.tty.contact} onClick={@onClick} />
      when 'cv'
        <Shell key="cv" commands={CvCommands} intro={true} tty={@state.tty.cv} onClick={@onClick} />
      when 'home'
        <Shell key="home" commands={HomeCommands} tty={@state.tty.home} onClick={@onClick} />

React.render(<Application />, document.getElementById('content'))
