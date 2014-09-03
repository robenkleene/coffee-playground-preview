module.exports =
class CoffeePlaygroundRenderer

  render: (text, view) ->
    result = "<pre><code>#{text}</code></pre>"
    view.html(result)
