#Simple form validation class

####Initialize the object
```coffeescript
form = new app.Form()
```

####Call the ```validate``` function

```coffeescript

form.validate(
  [
    {name: "Text", el: $("[name='comment[text]']")},
    {name: "timestamp", el: $"([name='comment[timestamp]']"), pattern: /[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}/}
  ]
)
```

####Check for errors

```coffeescript
if create_transcript_form.errors.length > 0
  #do something to catch errors
```
