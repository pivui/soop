
function objPtr = soop_newPtr(objType, objId)
    objPtr          = mlist(['soopPtr','type','id'])
    objPtr.type     = objType
    objPtr.id       = objId
endfunction
