function objPtr = soop_new(objType)
    //
    //  New instance of some class.
    //
    //  Syntax 
    //      ptr = soop_new(className)
    //
    //  Parameters
    //      className (string) : name of the associated class. It needs to be defined beforehand.
    //      ptr (soopPtr): pointer towards the actual object.
    //
    //  Description
    //      The pointer is meant to be used as if it was the actual object (and it should be).
    //      In particular:
    //      * set/get attributes works as expected ptr.attr = rhs
    //      * methods must be defined somewhere with a first argument being the pointer, i.e.
    //       foo = function(ptr, args). It is then called as ptr.fun(args).
    //      * overloading is done through scilab, the pointer passes corresponding call to the 
    //      dedicated objects functions themselves. Use soop_storeObj() if the objects are modified 
    //      there.
    //
    //  Authors
    //      Pierre Vuillemin - 2024
  
    obj     = soop_new_(objType)
    objPtr  = soop_newPtr(objType, obj.id_)
endfunction
