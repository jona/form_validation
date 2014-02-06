#Form validation

**Simple form validation class**

##Initialize
```coffeescript
form = new app.Form()
```

##Call the ```validate``` function

```coffeescript

form.validate(
  [
    {name: "Text", el: $("[name='text']")},
    {name: "timestamp", el: $("[name='timestamp']"), pattern: /[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}/}
  ]
)
```

##Check for errors

```coffeescript
if create_transcript_form.errors.length > 0
  #do something to catch errors
```
