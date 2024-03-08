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
    //      listOfAttributes (list) : list of string, the attributes..
    //      listOfMethods (list) : list of string, the methods.
    //
    //  Authors
    //      Pierre Vuillemin - 2024
  
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
