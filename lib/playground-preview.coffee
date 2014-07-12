PlaygroundPreviewView = require './playground-preview-view'

module.exports =
  playgroundPreviewView: null

  activate: ->
    atom.workspaceView.command 'playground-preview:toggle', =>
      @toggle()

  toggle: ->
    console.log "Got here"
