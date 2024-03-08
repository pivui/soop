function objList = soop_getAllObj(objType)
    global soopNameSpace
    if ~soop_classExists(objType) then
        error('Class ''%s'' does not exist', objType)
    end
    objList = soopNameSpace(objType)(2)
endfunction
