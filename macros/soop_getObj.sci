function [obj, objPos] = soop_getObj(objPtr)
    global soopNameSpace
    // Get object position
    objList = soopNameSpace(objPtr.type)(2)
    objPos  = []
    obj     = []
    for i=(1:length(objList)) do
        if (objList(i).id == objPtr.id) then
            objPos  = i
            obj     = objList(i)
            return
        end
    end

endfunction
