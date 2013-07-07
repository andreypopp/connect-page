module.exports = (options) ->
  scripts = for script in options.scripts
    "<script src='#{script}'></script>"

  stylesheets = for stylesheet in options.stylesheets
    "<link rel='stylesheet' href='#{stylesheet}'>"

  data = """
    <!doctype>
    <title>#{options.title or 'page'}</title>
    #{stylesheets.join('\n')}
    #{scripts.join('\n')}
    """

  if options.data
    data += """
      <script>
        var #{options.dataKey or '__data'} = #{JSON.stringify(options.data)};
      </script>
      """

  (req, res) ->
    res.send data
