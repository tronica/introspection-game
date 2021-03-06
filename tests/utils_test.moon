lust      = require 'vendor.lust'
_         = require 'src.lib.utils'
debug     = require 'src.lib.debug'

{ :describe, :it, :expect } = lust

describe 'Utils', ->

  describe 'cache', ->
    it 'returns the same object based on the argument', ->
      func = _.cache (arg) -> {}

      arg1 = {}
      arg2 = {}

      expect(func(arg1) == func(arg1)).to.equal true
      expect(func(arg1) == func(arg2)).to.equal false
      expect(func(arg2) == func(arg2)).to.equal true


  describe 'filter', ->

    it 'filters out elements out of the array', ->
      a = {}
      b = {}
      c = {}
      d = {}

      res = _.filter { a, b, c, d }, (it) -> it == a or it == c

      expect(#res).to.equal(2)
      expect(res[1]).to.equal(b)
      expect(res[2]).to.equal(d)

  describe 'remove', ->

    it 'removes out elements out of the array', ->
      a = {}
      b = {}
      c = {}
      d = {}

      arr = { a, b, c, d }
      _.remove arr, (it) -> it == a or it == c

      expect(#arr).to.equal(2)
      expect(arr[1]).to.equal(b)
      expect(arr[2]).to.equal(d)

  describe 'remove_one', ->

    it 'removes one element out of the array', ->
      a = {}
      b = {}
      c = {}
      d = {}

      arr = { a, b, c, d }
      _.remove_one arr, (it) -> it == a or it == c

      expect(#arr).to.equal(3)
      expect(arr[1]).to.equal(b)
      expect(arr[2]).to.equal(c)
      expect(arr[3]).to.equal(d)

