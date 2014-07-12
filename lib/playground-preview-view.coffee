{View} = require 'atom'

module.exports =
class PlaygroundPreviewView extends View
  @content: ->
    @div class: 'playground-preview overlay from-top', =>
      @div "The PlaygroundPreview package is Alive! It's ALIVE!", class: "message"

  renderPlayground: ->
    console.log "Rendering"
  # initialize: (serializeState) ->
  #   atom.workspaceView.command "playground-preview:toggle", => @toggle()
  #
  # # Returns an object that can be retrieved when package is activated
  # serialize: ->
  #
  # # Tear down any state and detach
  # destroy: ->
  #   @detach()
  #
  # toggle: ->
  #   console.log "PlaygroundPreviewView was toggled!"
  #   if @hasParent()
  #     @detach()
  #   else
  #     atom.workspaceView.append(this)
