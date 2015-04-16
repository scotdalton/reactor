myModule = "../../../app/assets/bPrompt/bPrompt.cjsx"

jest.dontMock myModule

[React, Prompt, TestUtils] = [undefined, undefined, undefined]

describe 'bPrompt', ->
  beforeEach ->
    React = require 'react/addons'
    Prompt = require myModule
    TestUtils = React.addons.TestUtils

  it 'should render a bPrompt span with "~>" as the content', ->
    doc = TestUtils.renderIntoDocument(<Prompt />)
    renderedSpan = TestUtils.findRenderedDOMComponentWithTag(doc, 'span')
    expect(renderedSpan.getDOMNode().className).toEqual 'bPrompt'
    expect(renderedSpan.getDOMNode().textContent).toEqual '~> '
