function obj = soop_updateMethod(objPtr, m)
    global soopNameSpace 
    obj     = soop_getObj(objPtr)
    obj(m)  = soop_methodWrap(obj.type, obj.id, m)
    soop_storeObj(obj)
endfunction
