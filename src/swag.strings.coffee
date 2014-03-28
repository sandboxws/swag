Swag.addHelper 'lowercase', (str) ->
    unless Utils.isUndefined str
        str = Utils.result str, this
        str.toLowerCase()
    else
        Utils.err '{{lowercase}} takes one argument (string).'

Swag.addHelper 'uppercase', (str) ->
    unless Utils.isUndefined str
        str = Utils.result str, this
        str.toUpperCase()
    else
        Utils.err '{{uppercase}} takes one argument (string).'

Swag.addHelper 'capitalizeFirst', (str) ->
    unless Utils.isUndefined str
        str = Utils.result str, this
        str.charAt(0).toUpperCase() + str.slice(1)
    else
        Utils.err '{{capitalizeFirst}} takes one argument (string).'

Swag.addHelper 'capitalizeEach', (str) ->
    unless Utils.isUndefined str
        str = Utils.result str, this
        str.replace /\w\S*/g, (txt) -> txt.charAt(0).toUpperCase() + txt.substr(1)
    else
        Utils.err '{{capitalizeEach}} takes one argument (string).'

Swag.addHelper 'titleize', (str) ->
    unless Utils.isUndefined str
        str = Utils.result str, this
        title = str.replace /[ \-_]+/g, ' '
        words = title.match(/\w+/g)
        capitalize = (word) -> word.charAt(0).toUpperCase() + word.slice(1)
        (capitalize word for word in words).join ' '
    else
        Utils.err '{{titleize}} takes one argument (string).'

Swag.addHelper 'sentence', (str) ->
    unless Utils.isUndefined str
        str = Utils.result str, this
        str.replace /((?:\S[^\.\?\!]*)[\.\?\!]*)/g, (txt) -> txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase()
    else
        Utils.err '{{sentence}} takes one argument (string).'

Swag.addHelper 'reverse', (str) ->
    unless Utils.isUndefined str
        str = Utils.result str, this
        str.split('').reverse().join ''
    else
        Utils.err '{{reverse}} takes one argument (string).'

Swag.addHelper 'truncate', (str, length, omission) ->
    unless Utils.isUndefined str
        str = Utils.result str, this
        omission = '' if Utils.isUndefined omission
        if str.length > length then str.substring(0, length - omission.length) + omission else str
    else
        Utils.err '{{truncate}} takes one argument (string).'

Swag.addHelper 'center', (str, spaces) ->
    unless (Utils.isUndefined str) and (Utils.isUndefined spaces)
        str = Utils.result str, this
        spaces = Utils.result spaces
        space = ''
        i = 0

        while i < spaces
            space += '&nbsp;'
            i++

        "#{space}#{str}#{space}"
    else
        Utils.err '{{center}} takes two arguments (string, number).'

Swag.addHelper 'newLineToBr', (str) ->
    unless Utils.isUndefined str
        str = Utils.result str, this
        str.replace /\r?\n|\r/g, '<br>'
    else
        Utils.err '{{newLineToBr}} takes one argument (string).'

Swag.addHelper 'sanitize', (str, replaceWith) ->
    unless Utils.isUndefined str
        str = Utils.result str, this
        replaceWith = '-' if Utils.isUndefined replaceWith
        str.replace /[^a-z0-9]/gi, replaceWith
    else
        Utils.err '{{sanitize}} takes one argument (string).'
