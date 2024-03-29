function soop_newClass(objType, objAtt, objMeth)
    //
    //  Initialise variable required by soop such as its global namespace where 
    //  object instances are stored. Any soop-related action will not work before
    //  this call.
    //
    //  Syntax 
    //      soop_newClass(className, listOfAttributes, listOfMethods)
    //
    //  Parameters
    //      className (string) : name of the class. Will be the type of associated objects.
    //      listOfAttributes (list) : list of string, the attributes. ''id_'' and ''type_'' are reserved and cannot be used.
    //      listOfMethods (list) : list of string, the methods.
    //
    //  Authors
    //      Pierre Vuillemin - 2024
  
    // Test if the class is not already defined
    if soop_classExists(objType) then
        error('Class ''%s'' already defined', objType)
    end
    //
    for a = objAtt
        if a == 'id_' | a =='type_' then 
            error('''id_'' and ''type_'' are attributes reserved to soop. Please choose something else')
        end
    end
    // If not, proceed to add it to the global namespace
    global soopNameSpace 
    soopNameSpace(1)($+1)       = objType
    soopNameSpace(objType)      = list()
    soopNameSpace(objType)(1)   = list(objType, objAtt, objMeth)
    soopNameSpace(objType)(2)   = list() // list of objects
    soopNameSpace(objType)(3)   = 0      // identifier 
    soopNameSpace(objType)(4)   = list() // free positions
    
endfunction
