function soop_storeObj(obj)
    //
    //  Store an object in soop's global namespace.
    //
    //  Syntax 
    //      soop_storeObj(obj)
    //
    //  Authors
    //      Pierre Vuillemin - 2024
  
    global soopNameSpace
    objPos = soop_getObjPos(obj)
    if isempty(objPos) then
        soopNameSpace(obj.type)(2)($+1) = obj
    else 
        soopNameSpace(obj.type)(2)(objPos) = obj
    end
endfunction
