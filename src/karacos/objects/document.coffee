# This file is part of Karacos

nocr = require "NoCR"

registered class Document 
    # Base class for any node
    # wraps the nocr node
    constructor: (@dataNode) ->
        if @dataNode not instanceof nocr.Node
            throw "invalid Data object"
        
        