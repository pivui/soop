function obj = soop_new_(objType)
    global soopNameSpace
    // find free Id
    freeId      = soop_findFreeId(objType)
    //
    objAtt      = soopNameSpace(objType)(1)(2)
    objMeth     = soopNameSpace(objType)(1)(3)
    obj         = mlist([objType, 'id','type',list2vec(objAtt)', list2vec(objMeth)'])
    obj.id      = freeId
    obj.type    = objType 
    //
    for a = objAtt
        obj(a) = []
    end
    for m = objMeth
        obj(m)  = [];//soop_methodWrap(obj.type, obj.id, m)
    end
    // store object
    soop_storeObj(obj)
endfunction
