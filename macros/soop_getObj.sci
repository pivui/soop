function obj = soop_getObj(objPtr)
    global soopNameSpace
    objPos  = soop_getObjPos(objPtr)
    obj     = soopNameSpace(objPtr.type)(2)(objPos)
endfunction
