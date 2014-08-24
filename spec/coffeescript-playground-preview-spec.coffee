{WorkspaceView} = require 'atom'
CoffeescriptPlaygroundPreviewView = require '../lib/coffeescript-playground-preview-view.coffee'

describe "CoffeeScript Playground Preview", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    atom.workspace = atom.workspaceView.model
    spyOn(CoffeescriptPlaygroundPreviewView.prototype, 'render').andCallThrough()
    activationPromise =  atom.packages.activatePackage("coffeescript-playground-preview")

    waitsForPromise ->
      atom.workspace.open("test.coffee")

  it "calls render after opening a file", ->
    atom.workspaceView.getActiveView().trigger 'coffeescript-playground-preview:toggle'

    waitsForPromise ->
      activationPromise

    waitsFor ->
      CoffeescriptPlaygroundPreviewView::render.callCount > 0

    runs ->
      expect(CoffeescriptPlaygroundPreviewView::render.callCount).toBe 1
