myModule = "../../../app/assets/bShell/bShell.cjsx"

jest.dontMock myModule

[React, Shell, TestUtils] = [undefined, undefined, undefined]
[intro, tty, commands, onClick] = [undefined, undefined, undefined, undefined]

describe 'bShell', ->
  beforeEach ->
    React = require 'react/addons'
    Shell = require myModule
    TestUtils = React.addons.TestUtils

  it 'should render a bShell div', ->
    commands = [{id: "1", input: "input", output: -> "output"}]
    doc = TestUtils.renderIntoDocument(<Shell tty={false} commands=commands />)
    renderedDiv = TestUtils.findRenderedDOMComponentWithTag(doc, 'div')
    expect(renderedDiv.getDOMNode().className).toEqual 'bShell'
