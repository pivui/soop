function objPos = soop_getObjPos(obj)
    global soopNameSpace
    objList = soop_getAllObj(obj.type)
    for i = 1:length(objList)
        if objList(i).id == obj.id then
            objPos = i 
            return
        end
    end
    objPos = []
endfunction

