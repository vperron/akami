'use strict'

angular.module('modules.utils', [])

angular.module('modules.utils')

#
# Handy Utils service.
#
# Many functions and sugar hand-liners for the app to use.
# Some of them may be superseded by using SugarJS for instance,
# some others are more specific.
#
.factory('Utils', ->

  service = {
    #
    # Converts an url to an UID by selecting the last part
    #
    url2uid: (url) ->
      if url? then url.substr(url.lastIndexOf('/') + 1) else null

    makeTitle: (slug) ->
      words = slug.split("-").map (d) ->
        d.charAt(0).toUpperCase() + d.slice(1)
      return words.join ' '

    #
    # getOr
    #
    getOr: (item, dflt) ->
      if _.isFunction(item)
        return if item? then item() else dflt
      else
        return if item? then item else dflt

    #
    # Prints the duration froms econds to human
    #
    timeFilter: (x) ->
      return '' if !x? or x == ''
      a = Math.abs(x)
      s = Math.round(a % 60)
      m = Math.round((a-s) / 60)
      r = Math.round(m % 60)
      h = Math.round((m-r) / 60)
      if h? and h != 0
        return "#{h}h #{r}\u2032 #{s}\u2033"
      else if m? and m != 0
        return "#{m}\u2032 #{s}\u2033"
      else
        return "#{s}\u2033"

    #
    # selfMap: applies a collection-returning operation to coll, stores the result in coll
    #
    selfMap: (coll, fn) -> col = fn(coll)

    #
    # Returns a time from the start and stop Moments (default: days)
    #
    timeInterval: (start, stop, itvl='days') ->
      (start.clone().add(itvl, x) for x in [0..stop.diff(start, itvl)])

    #
    # Generates a random gaussian number around the given value
    #
    randAround: (value) ->
      return value/2 + Math.random()*value

    #
    # For a given ISO weekday (Monday = 0), returns
    # the matching Python weekday (Sunday = 1, Monday = 2...)
    #
    iso2pythonWeekday: (weekday) ->
      return ((weekday + 1) % 7) + 1

    #
    # Get the specified item in a collection, based on the value of
    # one of its keys (default 'uid')
    #
    getIndexedItem: (coll, value, key='uid') ->
      indexed = _.indexBy coll, key
      indexed[value]

    #
    # Get the matching item (filter + take the only result, or NULL)
    #
    getMatchingItem: (coll, fn) ->
      subCollection = coll.filter (d) -> fn(d)
      if subCollection.length == 1
        return subCollection[0]
      return null

    #
    # Safely join a collection with a given separator (default ' ,')
    #
    join: (lst, sep=', ') -> if lst? then lst.join(sep) else ''

    #
    # Safely slugifies an object and returns 'alt' if not possible.
    # Uses speakingurl.
    #
    slug: (txt, alt) ->
      slug = getSlug(txt)
      return if slug.length is 0 then alt else slug

    #
    # Cleanups an URL from its double slashes.
    #
    urlClean: (url) ->
      url.replace(/([^:]\/)\/+/g, "$1")

    #
    # Generate dict from (key, value) pairs
    #
    toDict: (pairs) ->
      hash = {}
      hash[key] = value for [key, value] in pairs
      hash

    #
    # Sums an array with an accessor.
    #
    sum_array: (arr, fn = ((x) -> x)) ->
      return 0 if _.isEmpty arr
      return arr.reduce ((p, c) -> p + fn(c)), 0

    #
    # Averages an array with an accessor.
    #
    avg_array: (arr, fn = ((x) -> x)) ->
      return 0 if arr.length == 0
      sum = service.sum_array arr, fn
      return sum / arr.length

    #
    # Returns a numeric hash for a given string.
    #
    strhash: (s, max=256) ->
      i = 0
      chk = 0x12345678
      while i < s.length
        chk += (s.charCodeAt(i) * i)
        i++
      return chk % max

    #
    # When using watchers, this function filters-out
    # the non-existing objects or when the uid is same.
    #
    onValidChange: (current, previous, func, key='uid') ->
      if (current? and previous?) and current[key] != previous[key]
        return func current
      return

    #
    # Rounds the specified digit and eventually also approximates
    # the numeric part.
    #
    #  round(2344.3, 0, true) ---> 2300
    #
    round: (x, digits=0, approximate=false) ->
      return '' if !x? or x == '' or _.isNaN x
      if approximate
        precisionDigits = Math.round(("#{_.parseInt x}".length / 2)) - 1
        if precisionDigits < 0
          precisionDigits = 0
        precision = Math.pow(10, precisionDigits)
        x = Math.round(parseFloat(x) / precision) *  precision
      return d3.format(".#{digits}f")(parseFloat x)

    #
    # Sanitizes a string that will be used in a regular expression.
    #
    regexpSane: (str) -> str.replace(/[-/\\^$*+?.()|[\]{}]/g, '\\$&')


  }
  service
)
