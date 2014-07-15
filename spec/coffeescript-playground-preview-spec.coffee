{WorkspaceView} = require 'atom'
PlaygroundPreview = require '../lib/playground-preview'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "PlaygroundPreview", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('playground-preview')

  describe "when the playground-preview:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.playground-preview')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'playground-preview:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.playground-preview')).toExist()
        atom.workspaceView.trigger 'playground-preview:toggle'
        expect(atom.workspaceView.find('.playground-preview')).not.toExist()
