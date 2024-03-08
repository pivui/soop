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
    [dummy, objPos] = soop_getObj(obj)
    if isempty(objPos) then
        freePos = soopNameSpace(obj.type)(4)
        if ~isempty(freePos) then 
            soopNameSpace(obj.type)(2)(freePos(1))  = obj
            soopNameSpace(obj.type)(4)(1)           = null()
        else
            soopNameSpace(obj.type)(2)($+1)  = obj
        end
    else 
        soopNameSpace(obj.type)(2)(objPos) = obj
    end
endfunction
