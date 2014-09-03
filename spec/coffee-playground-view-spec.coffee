{WorkspaceView} = require 'atom'
CoffeePlaygroundView = require '../lib/coffee-playground-view'
UriHelper = require '../../live-preview/lib/uri-helper' # TODO Package Live Preview

describe "CoffeePlaygroundView", ->
  preview = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    atom.workspace = atom.workspaceView.model

    spyOn(CoffeePlaygroundView.prototype, 'render').andCallThrough()

    waitsForPromise ->
      atom.workspace.open("fixtures/file.md")

    runs ->
      editorId = atom.workspace.getActiveEditor().id
      uri = UriHelper.uriForEditorId("test-protocol:", editorId)
      preview = new CoffeePlaygroundView(uri)

  afterEach ->
    preview.destroy()

  describe "::constructor", ->
    it "renders the preview", ->
      preview.render()

      expect(preview.find("code")).toExist()
