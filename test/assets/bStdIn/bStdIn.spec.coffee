myModule = "../../../app/assets/bStdIn/bStdIn.cjsx"

jest.dontMock myModule

[React, StdIn, TestUtils] = [undefined, undefined, undefined]
[tty, input] = [undefined, undefined]

describe 'bStdIn', ->
  beforeEach ->
    React = require 'react/addons'
    StdIn = require myModule
    TestUtils = React.addons.TestUtils

  describe 'when tty is false', ->
    beforeEach ->
      tty = false

    describe 'and the input is a string', ->
      beforeEach ->
        input = "input"

      it 'should render a standard output div with the input', ->
        doc = TestUtils.renderIntoDocument <StdIn tty=tty input=input />
        renderedDOMComponent = TestUtils.findRenderedDOMComponentWithTag doc, 'div'
        expect(renderedDOMComponent.getDOMNode().className).toEqual 'bStdIn'
        expect(renderedDOMComponent.getDOMNode().textContent).toEqual 'input'
