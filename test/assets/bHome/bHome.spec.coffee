myModule = "../../../app/assets/bHome/bHome.cjsx"

jest.dontMock myModule

[React, Home, TestUtils] = [undefined, undefined, undefined]

describe 'bHome', ->
  beforeEach ->
    React = require 'react/addons'
    Home = require myModule
    TestUtils = React.addons.TestUtils

  it 'should render a bHome div', ->
    doc = TestUtils.renderIntoDocument <Home tty={false} />
    renderedDiv = TestUtils.findRenderedDOMComponentWithTag(doc, 'div')
    expect(renderedDiv.getDOMNode().className).toEqual 'bHome'
