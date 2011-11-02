###

###

# decorator for an exposed function
# Proof Of Concept - may be useless as exposed methods are stored as graphs in backend
expose = (func)->
    # wraps the class function
    returnedFunc = (args...) ->
        func(args...)
    returnedFunc.exposed = true # 
    # returns the wrapped function
    returnedFunc

# Main KaraCos registry for types available to KaraCos
registry =
    classes: {}
    register: (klass) ->
        # Grab name of class from it's source
        name=/\W*function\s+([\w\$]+)\(/.exec(klass)[1]
        @classes[name] = klass # Storing class in registry
        # commented part, see comments above
        #for nom, f of klass.prototype 
        #    if f.exposed
        #        if console?
        #            console.log nom
                # TODO: what to do for an exposed func
                # As exposed functs remains in graphs, this may not be used.
                # I could use this feature for 
        
        
# Registration of given class (metaprogramming-like feature)
# use like this :
# registered class MyClass ....
# This will allow karacos to instanciate MyClass from Node data if property class
# contains MyClass value
registered = (klass) ->
    registry.register klass