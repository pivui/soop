function objPtr = soop_new(objType)
    obj     = soop_new_(objType)
    objPtr  = soop_newPtr(objType, obj.id)
endfunction
