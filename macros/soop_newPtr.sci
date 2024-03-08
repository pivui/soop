
function objPtr = soop_newPtr(objType, objId)
    objPtr          = mlist(['soopPtr','type_','id_'])
    objPtr.type_    = objType
    objPtr.id_      = objId
endfunction
