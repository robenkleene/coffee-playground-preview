{WorkspaceView} = require 'atom'
CoffeePlaygroundView = require '../lib/coffee-playground-view.coffee'

describe "CoffeeScript Playground Preview", ->

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    atom.workspace = atom.workspaceView.model
    spyOn(CoffeePlaygroundView.prototype, 'render').andCallThrough()

    waitsForPromise ->
      atom.packages.activatePackage("coffee-playground-preview")

    waitsForPromise ->
      atom.workspace.open("test.coffee")

  it "calls render after opening a file", ->
    atom.workspaceView.getActiveView().trigger 'coffee-playground-preview:toggle'

    waitsFor ->
      CoffeePlaygroundView::render.callCount > 0

    runs ->
      expect(CoffeePlaygroundView::render.callCount).toBe 1
