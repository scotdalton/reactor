myModule = "../../../app/assets/bIntro/bIntro.cjsx"

jest.dontMock myModule

[React, Intro, TestUtils] = [undefined, undefined, undefined]

describe 'bIntro', ->
  beforeEach ->
    React = require 'react/addons'
    Intro = require myModule
    TestUtils = React.addons.TestUtils

  it 'should render a bIntro div with my name', ->
    doc = TestUtils.renderIntoDocument(<Intro />)
    renderedDiv = TestUtils.findRenderedDOMComponentWithTag(doc, 'div')
    expect(renderedDiv.getDOMNode().className).toEqual 'bIntro'
    expect(renderedDiv.getDOMNode().textContent).toMatch 'Scot Dalton'
