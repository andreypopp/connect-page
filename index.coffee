module.exports = (options) ->
  scripts = for script in (options.scripts or [])
    "<script src='#{script}'></script>"

  stylesheets = for stylesheet in (options.stylesheets or [])
    "<link rel='stylesheet' href='#{stylesheet}'>"

  meta = for k, v of (options.meta or {})
    "<meta name='#{k}' content='#{v}' />"

  data = """
    <!doctype>
    <title>#{options.title or 'page'}</title>
    #{meta.join('\n')}
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
