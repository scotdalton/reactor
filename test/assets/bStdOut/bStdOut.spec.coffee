myModule = "../../../app/assets/bStdOut/bStdOut.cjsx"

jest.dontMock myModule

[React, StdOut, TestUtils] = [undefined, undefined, undefined]
output = undefined

describe 'bStdOut', ->
  beforeEach ->
    React = require 'react/addons'
    StdOut = require myModule
    TestUtils = React.addons.TestUtils

  describe 'when the output is a string', ->
    beforeEach ->
      output = "output"

    it 'should render a standard output div with the output', ->
      doc = TestUtils.renderIntoDocument <StdOut output=output />
      renderedDOMComponent = TestUtils.findRenderedDOMComponentWithTag doc, 'div'
      expect(renderedDOMComponent.getDOMNode().className).toEqual 'bStdOut'
      expect(renderedDOMComponent.getDOMNode().textContent).toEqual 'output'
