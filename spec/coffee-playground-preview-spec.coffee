{WorkspaceView} = require 'atom'
CoffeePlaygroundView = require '../lib/coffee-playground-view.coffee'

describe "CoffeeScript Playground Preview", ->

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    atom.workspace = atom.workspaceView.model
    spyOn(CoffeePlaygroundView.prototype, 'render').andCallThrough()

    waitsForPromise ->
      atom.packages.activatePackage("coffee-playground-preview")

  describe "a CoffeeScript file", ->

    beforeEach ->

      waitsForPromise ->
        atom.packages.activatePackage('language-coffee-script')

      waitsForPromise ->
        atom.workspace.open("test.coffee")

    it "calls render after opening a file", ->
      atom.workspaceView.getActiveView().trigger 'coffee-playground-preview:toggle'

      waitsFor ->
        CoffeePlaygroundView::render.callCount > 0

      runs ->
        expect(CoffeePlaygroundView::render.callCount).toBe 1

  describe "a file that isn't CoffeeScript", ->

    it "logs a warning doesn't open a preview", ->

      waitsForPromise ->
        atom.packages.activatePackage('language-gfm')

      waitsForPromise ->
        atom.workspace.open("subdir/file.md")

      runs ->
        spyOn(atom.workspace, 'open').andCallThrough()
        spyOn(console, 'warn')
        atom.workspaceView.getActiveView().trigger 'coffee-playground-preview:toggle'
        expect(atom.workspace.open).not.toHaveBeenCalled()
        expect(console.warn).toHaveBeenCalled()
