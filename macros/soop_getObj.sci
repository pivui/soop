function obj = soop_getObj(objPtr)
    global soopNameSpace
    obj     = soopNameSpace(objPtr.type)(2)(objPtr.id)
endfunction
