PlaygroundPreviewView = require './playground-preview-view'

module.exports =
  playgroundPreviewView: null

  activate: ->
    atom.workspaceView.command 'playground-preview:toggle', =>
      @toggle()

  toggle: ->
    editor = atom.workspace.getActiveEditor()
    return unless editor?

    # grammars = atom.config.get('markdown-preview.grammars') ? []
    # return unless editor.getGrammar().scopeName in grammars

    uri = "playground-preview://editor/#{editor.id}"

    previewPane = atom.workspace.paneForUri(uri)
    if previewPane
      previewPane.destroyItem(previewPane.itemForUri(uri))
      return

    previousActivePane = atom.workspace.getActivePane()
    atom.workspace.open(uri, split: 'right', searchAllPanes: true).done (playgroundPreviewView) ->
      if playgroundPreviewView instanceof PlaygroundPreviewView
        playgroundPreviewView.renderPlayground()
        previousActivePane.activate()
