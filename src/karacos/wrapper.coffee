# This file is part of KaraCos


nocr = require "NoCR"
karacos = require "karacos"

class Wrapper
    #Wraps object lookup and returns live instances for objects
        
    getObject: (session, path, callback) ->
        # returns the object instance corresponding to given path
        if session not instanceof nocr.Session
            callback "invalid Session object"
        session.getNode path, (err, node) ->
            if err isnt null
                callback err
            else
                type = item.getProperty 'karacos:type'
                if type not of karacos.registry
                    callback "Unknown node type"
                else
                    callback null, new karacos.registry[type](node)
    
    createObject: (type, data, callback) ->
        if type not of karacos.registry
            callback "Unknown node type"
        else
            # Insert here code for creating NoCR Node and it's properties then returns the karacos object instance