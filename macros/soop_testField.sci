function out = soop_testField(objPtr, attr)
    global soopNameSpace 
    out = 0 
    if isfield(soopNameSpace, obj.type) then 
        isAttr = or(attr == list2vec(soopNameSpace(objPtr.type)(1)(2)))
        if isAttr then 
            out = 1
            return
        end
        isMeth = or(attr == list2vec(soopNameSpace(objPtr.type)(1)(3)))
        if isMeth then 
            out = 2
            return
        end
    end

endfunction
