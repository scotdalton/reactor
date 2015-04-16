myModule = "../../../app/assets/bFileList/bFileList.cjsx"

jest.dontMock myModule

[React, FileList, TestUtils] = [undefined, undefined, undefined]
files = undefined

describe 'bFileList', ->
  beforeEach ->
    React = require 'react/addons'
    FileList = require myModule
    TestUtils = React.addons.TestUtils
    files = [{id: '1', type: 'f', name: 'name'}]

  it 'should render a bFileList ul', ->
    doc = TestUtils.renderIntoDocument <FileList files=files />
    renderedUnorderedList = TestUtils.findRenderedDOMComponentWithTag doc, 'ul'
    expect(renderedUnorderedList.getDOMNode().className).toEqual 'bFileList'
