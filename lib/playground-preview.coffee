url = require 'url'
PlaygroundPreviewView = null # Defer until used

createPlaygroundPreviewView = (state) ->
  PlaygroundPreviewView ?= require './playground-preview-view'
  new PlaygroundPreviewView(state)

isPlaygroundPreviewView = (object) ->
  PlaygroundPreviewView ?= require './playground-preview-view'
  object instanceof PlaygroundPreviewView

deserializer =
  name: 'PlaygroundPreviewView'
  deserialize: (state) ->
    createPlaygroundPreviewView(state) if state.constructor is Object
atom.deserializers.add(deserializer)

module.exports =
  configDefaults:
    liveUpdate: true

  activate: ->
    atom.workspaceView.command 'playground-preview:toggle', =>
      @toggle()

    atom.workspace.registerOpener (uriToOpen) ->
      try
        {protocol, host, pathname} = url.parse(uriToOpen)
      catch error
        console.log error
        return

      return unless protocol is 'playground-preview:'

      try
        pathname = decodeURI(pathname) if pathname
      catch error
        return

      if host is 'editor'
        new createPlaygroundPreviewView(editorId: pathname.substring(1))

  toggle: ->
    if isPlaygroundPreviewView(atom.workspace.activePaneItem)
      atom.workspace.destroyActivePaneItem()
      return

    editor = atom.workspace.getActiveEditor()
    return unless editor?

    # grammars = atom.config.get('markdown-preview.grammars') ? []
    # return unless editor.getGrammar().scopeName in grammars

    @addPreviewForEditor(editor) unless @removePreviewForEditor(editor)

  uriForEditor: (editor) ->
    "playground-preview://editor/#{editor.id}"

  removePreviewForEditor: (editor) ->
    uri = @uriForEditor(editor)
    previewPane = atom.workspace.paneForUri(uri)
    if previewPane?
      previewPane.destroyItem(previewPane.itemForUri(uri))
      true
    else
      false

  addPreviewForEditor: (editor) ->
    uri = @uriForEditor(editor)
    previousActivePane = atom.workspace.getActivePane()

    atom.workspace.open(uri, split: 'right', searchAllPanes: true).done (playgroundPreviewView) ->
      if isPlaygroundPreviewView(playgroundPreviewView)
        playgroundPreviewView.renderPlayground()
        previousActivePane.activate()
