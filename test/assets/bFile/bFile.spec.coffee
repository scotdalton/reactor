myModule = "../../../app/assets/bFile/bFile.cjsx"

jest.dontMock myModule

[React, File, TestUtils] = [undefined, undefined, undefined]
[type, href] = [undefined, undefined]

describe 'bFile', ->
  beforeEach ->
    React = require 'react/addons'
    File = require myModule
    TestUtils = React.addons.TestUtils

  describe "when there is no type given", ->
    describe "and there isn't an href", ->
      it 'should render a file span with the given name', ->
        doc = TestUtils.renderIntoDocument <File name="name" />
        renderedSpan = TestUtils.findRenderedDOMComponentWithTag doc, 'span'
        expect(renderedSpan.getDOMNode().className).toEqual 'bFile'
        expect(renderedSpan.getDOMNode().textContent).toEqual 'name'

  describe "when it's type \"f\"", ->
    beforeEach ->
      type = 'f'

    describe "and there isn't an href", ->
      it 'should render a file span with the given name', ->
        doc = TestUtils.renderIntoDocument <File type=type name="name" />
        renderedSpan = TestUtils.findRenderedDOMComponentWithTag doc, 'span'
        expect(renderedSpan.getDOMNode().className).toEqual 'bFile'
        expect(renderedSpan.getDOMNode().textContent).toEqual 'name'

    describe "and there is an href", ->
      describe "but it's undefined", ->
        beforeEach ->
          href = undefined

        it 'should display as a file span with the given name', ->
          doc = TestUtils.renderIntoDocument <File type=type name="name" href=href />
          renderedSpan = TestUtils.findRenderedDOMComponentWithTag doc, 'span'
          expect(renderedSpan.getDOMNode().className).toEqual 'bFile'
          expect(renderedSpan.getDOMNode().textContent).toEqual 'name'

      describe "and it's defined", ->
        beforeEach ->
          href = 'http://example.com/'

        it 'should display as a file anchor with the given name and href', ->
          doc = TestUtils.renderIntoDocument <File type=type name="name" href=href />
          renderedAnchor = TestUtils.findRenderedDOMComponentWithTag doc, 'a'
          expect(renderedAnchor.getDOMNode().className).toEqual 'bFile'
          expect(renderedAnchor.getDOMNode().href).toEqual href
          expect(renderedAnchor.getDOMNode().textContent).toEqual 'name'

  describe "when it's type \"d\"", ->
    beforeEach ->
      type = 'd'

    describe "and there isn't an href", ->
      it 'should render a directory span with the given name', ->
        doc = TestUtils.renderIntoDocument <File type=type name="name" />
        renderedSpan = TestUtils.findRenderedDOMComponentWithTag doc, 'span'
        expect(renderedSpan.getDOMNode().className).toEqual 'bDirectory'
        expect(renderedSpan.getDOMNode().textContent).toEqual 'name'

    describe "and there is an href", ->
      describe "but it's undefined", ->
        beforeEach ->
          href = undefined

        it 'should render a directory span with the given name', ->
          doc = TestUtils.renderIntoDocument <File type=type name="name" href=href />
          renderedSpan = TestUtils.findRenderedDOMComponentWithTag doc, 'span'
          expect(renderedSpan.getDOMNode().className).toEqual 'bDirectory'
          expect(renderedSpan.getDOMNode().textContent).toEqual 'name'

      describe "and it's defined", ->
        beforeEach ->
          href = 'href'

        it 'should render a directory anchor with the given name and data-href', ->
          doc = TestUtils.renderIntoDocument <File type=type name="name" href=href />
          renderedAnchor = TestUtils.findRenderedDOMComponentWithTag doc, 'a'
          expect(renderedAnchor.getDOMNode().className).toEqual 'bDirectory'
          expect(renderedAnchor.getDOMNode().href).toBeDefined()
          # expect(renderedFile.getDOMNode().dataset.href).toEqual href
          expect(renderedAnchor.getDOMNode().textContent).toEqual 'name'
