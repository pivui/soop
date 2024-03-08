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
    N = length(soopNameSpace(obj.type)(2))
    if obj.id <= N then 
        soopNameSpace(obj.type)(2)(obj.id) = obj
    elseif obj.id == N + 1 then
        soopNameSpace(obj.type)(2)($+1) = obj
    else
        error('error storing')
    end
endfunction
