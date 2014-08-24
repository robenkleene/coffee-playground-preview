viewManager = require './coffee-playground-view-manager'

module.exports =
class CoffeescriptPlaygroundPreview

  @activate: =>
    @viewManager = new viewManager('coffee-playground:')

    atom.workspaceView.command 'coffee-playground-preview:toggle', =>
      @viewManager.togglePreview()
