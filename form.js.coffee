class Form
  constructor: (opts = {}) ->
    @errors = []
    @params = {}

  validate: (fields) ->
    _self = @
    @errors = []
    for field in fields
      _val = _self.params[field.el.attr('f-field')] = _self.get_value(field.el)

      if _val == ""
        _self.errors.push message: "<li>#{field.name} is required</li>"
      else
        if field.isNumber && isNaN(_val)
          _self.errors.push message: "<li>#{field.name} should be a number</li>"
        else if field.pattern && !field.pattern.test(_val)
          _self.errors.push message: "<li>#{field.name} requires a specific format</li>"
        else if field.type && _val.toLowerCase().indexOf(".#{field.type}") == -1
          _self.errors.push message: "<li>#{field.name} must be #{field.type} format</li>"

    @errors

  get_value: ($el) ->
    if $el.get(0).nodeName == 'INPUT' || $el.get(0).nodeName == 'SELECT' || $el.get(0).nodeName == 'TEXTAREA'
      _val = $el.val()
    else
      _val = $el.html().replace(/(<([^>]+)>)/ig,"").replace(/(&nbsp;)*/ig,"").trim()

  Form