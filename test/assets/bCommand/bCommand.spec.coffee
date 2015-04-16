myModule = "../../../app/assets/bCommand/bCommand.cjsx"

jest.dontMock myModule

[React, Command, TestUtils] = [undefined, undefined, undefined]

describe 'bCommand', ->
  beforeEach ->
    React = require 'react/addons'
    Command = require myModule
    TestUtils = React.addons.TestUtils

  it 'should render a bCommand div', ->
    doc = TestUtils.renderIntoDocument <Command tty={false} />
    renderedDiv = TestUtils.findRenderedDOMComponentWithTag(doc, 'div')
    expect(renderedDiv.getDOMNode().className).toEqual 'bCommand'
