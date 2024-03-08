
// soop_findFreeId
function freeId = soop_findFreeId(objType)
    objList = soop_getAllObj(objType)
    N       = length(objList)
    if N == 0 then
        freeId = 1
        return
    end
    ids     = zeros(N,1)
    for i = 1:N
        ids(i) = objList(i).id
    end
    freeId = max(ids) + 1
endfunction


//
