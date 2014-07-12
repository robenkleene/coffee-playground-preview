PlaygroundPreviewView = require './playground-preview-view'

module.exports =
  playgroundPreviewView: null

  activate: (state) ->
    @playgroundPreviewView = new PlaygroundPreviewView(state.playgroundPreviewViewState)

  deactivate: ->
    @playgroundPreviewView.destroy()

  serialize: ->
    playgroundPreviewViewState: @playgroundPreviewView.serialize()
