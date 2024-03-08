function soop_newClass(objType, objAtt, objMeth)
    // Test if the class is not already defined
    if soop_classExists(objType) then
        error('Class ''%s'' already defined', objType)
    end
    // If not, proceed to add it to the global namespace
    global soopNameSpace 
    soopNameSpace(1)($+1)       = objType
    soopNameSpace(objType)      = list()
    soopNameSpace(objType)(1)   = list(objType, objAtt, objMeth)
    soopNameSpace(objType)(2)   = list()
endfunction
