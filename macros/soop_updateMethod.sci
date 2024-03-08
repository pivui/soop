function obj = soop_updateMethod(objPtr, m)
    global soopNameSpace 
    obj     = soop_getObj(objPtr)
    obj(m)  = soop_methodWrap(obj.type_, obj.id_, m)
    soop_storeObj(obj)
endfunction
