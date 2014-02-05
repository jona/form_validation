class Form
  constructor: (settings) ->
    @errors = []

  validate: (fields) ->
    _self = @
    @errors = []
    _.each fields, (field) ->
      _val = field.el.val()
      if _val == ""
        _self.errors.push message: "<li>#{field.name} is required</li>"
      else
        if field.isNumber && isNaN(_val)
          _self.errors.push message: "<li>#{field.name} should be a number</li>"
        else if field.pattern && !field.pattern.test(_val)
          _self.errors.push message: "<li>#{field.name} requires a specific format</li>"

  Form
