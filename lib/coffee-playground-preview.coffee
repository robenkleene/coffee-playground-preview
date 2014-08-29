LivePreviewViewManager = require '../../live-preview/lib/live-preview-view-manager'
CoffeePlaygroundViewFactory = require './coffee-playground-view-factory'

deserializer =
  name: 'CoffeePlaygroundView'
  deserialize: (state) ->
    if state.constructor is Object
      CoffeePlaygroundView = CoffeePlaygroundViewFactory.getPreviewView()
      uri = state.uri
      new CoffeePlaygroundView(uri)
atom.deserializers.add(deserializer)

module.exports =
class CoffeePlaygroundPreview
  @configDefaults:
    liveUpdate: true

  @activate: =>
    @livePreviewViewManager = new LivePreviewViewManager('coffee-playground:', CoffeePlaygroundViewFactory)

    atom.workspaceView.command 'coffee-playground-preview:toggle', =>
      if @livePreviewViewManager.removePreviewIfActive()
        return

      editor = atom.workspace.getActiveEditor()
      return unless editor?

      grammars = ["source.coffee"]
      scopeName = editor.getGrammar().scopeName

      unless scopeName in grammars
        console.warn "\"#{scopeName}\" isn't supported"
        return

      @livePreviewViewManager.togglePreviewForEditorId(editor.id)
