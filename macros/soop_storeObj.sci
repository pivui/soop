
function soop_storeObj(obj)
    global soopNameSpace
    objPos = soop_getObjPos(obj)
    if isempty(objPos) then
        soopNameSpace(obj.type)(2)($+1) = obj
    else 
        soopNameSpace(obj.type)(2)(objPos) = obj
    end
endfunction
