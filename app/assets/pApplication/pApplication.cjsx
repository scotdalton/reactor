React = require 'react'
Home = require '../bHome/bHome.cjsx'
About = require '../bAbout/bAbout.cjsx'
Contact = require '../bContact/bContact.cjsx'
Cv = require '../bCv/bCv.cjsx'

module.exports = React.createClass
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
    <div className="pApplication">{shell}</div>
