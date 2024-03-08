function obj = soop_new_(objType)
    global soopNameSpace
    //
    freeId      = soopNameSpace(objType)(3)
    //
    objAtt      = soopNameSpace(objType)(1)(2)
    objMeth     = soopNameSpace(objType)(1)(3)
    obj         = mlist([objType, 'id_','type_',list2vec(objAtt)', list2vec(objMeth)'])
    obj.id_     = freeId
    obj.type_   = objType 
    //
    for a = objAtt
        obj(a) = []
    end
    for m = objMeth
        obj(m)  = soop_methodWrap(obj.type_, obj.id_, m)
    end
    // store object
    soop_storeObj(obj)
    soopNameSpace(objType)(3)       = freeId + 1
endfunction
