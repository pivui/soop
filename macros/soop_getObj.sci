function [obj, objPos] = soop_getObj(objPtr)
    global soopNameSpace
    // Get object position
    objList = soopNameSpace(objPtr.type_)(2)
    objPos  = []
    obj     = []
    for i=(1:length(objList)) do
        if ~isempty(objList(i)) then
            if (objList(i).id_ == objPtr.id_) then
                objPos  = i
                obj     = objList(i)
                return
            end
        end
    end

endfunction
