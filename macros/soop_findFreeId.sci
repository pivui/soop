
// soop_findFreeId
function freeId = soop_findFreeId(objType)
    objList = soop_getAllObj(objType)
    N       = length(objList)
    if N == 0 then
        freeId = 1
        return
    end
    for i = 1:N
        if isempty(objList(i)) then 
            freeId = i
            return
        end
    end
    freeId = N + 1
endfunction
