React = require 'react'
ReactDOM = require 'react-dom'
Home = require 'pHome/pHome.cjsx'
About = require 'pAbout/pAbout.cjsx'
Contact = require 'pContact/pContact.cjsx'
Cv = require 'pCv/pCv.cjsx'

App = React.createClass
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
    shell = switch @state.shell
      when 'about'
        <About tty={@state.tty.about} onClick={@onClick} />
      when 'contact'
        <Contact tty={@state.tty.contact} onClick={@onClick} />
      when 'cv'
        <Cv tty={@state.tty.cv} onClick={@onClick} />
      when 'home'
        <Home tty={@state.tty.home} onClick={@onClick} />
    <div className="app">{shell}</div>

module.exports =
  ReactDOM.render <App />, document.getElementById("content")
