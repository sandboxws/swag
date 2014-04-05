Swag.addHelper 'inflect', (count, singular, plural, include) ->
    unless (Utils.isUndefined count) and (Utils.isUndefined singular) and (Utils.isUndefined plural)
        count = parseFloat Utils.result count, @
        singular = Utils.result singular, @
        plural = Utils.result plural, @
        word = if count > 1 or count is 0 then plural else singular
        if Utils.isUndefined(include) or include is false then word else "#{count} #{word}"
    else
        Utils.err '{{inflect}} takes at least three arguments (number, string, string).'

Swag.addHelper 'ordinalize', (value) ->
    unless Utils.isUndefined value
        value = parseFloat Utils.result value, @
        normal = Math.abs Math.round value

        if (normal % 100) in [11..13]
            "#{value}th"
        else
            switch normal % 10
                when 1 then "#{value}st"
                when 2 then "#{value}nd"
                when 3 then "#{value}rd"
                else "#{value}th"
    else
        Utils.err '{{ordinalize}} takes one arguments (number).'
