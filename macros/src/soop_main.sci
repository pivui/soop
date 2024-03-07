// soop_begin ..................................................................
// initialises a dedicated namespace for soop where all the objects will actually 
// be stored
function soop_begin()
    global soopNameSpace
    soopNameSpace = tlist(['soopNameSpace'])
endfunction
// soop_existingClasses ........................................................
// list already existing classes
function cNames = soop_existingClasses()
    global soopNameSpace
    cNames = soopNameSpace(1)(2:$)
endfunction
// soop_classExists ............................................................
// test if given class exists 
function out = soop_classExists(cName)
    out = or(cName == soop_existingClasses())
endfunction
// soop_newClass ...............................................................
// define new class 
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
// soop_new ....................................................................
function objPtr = soop_new(objType)
    obj     = soop_new_(objType)
    objPtr  = soop_newPtr(objType, obj.id)
endfunction
// soop_new_ ...................................................................
function obj = soop_new_(objType)
    global soopNameSpace
    // find free Id
    freeId      = soop_findFreeId(objType)
    //
    objAtt      = soopNameSpace(objType)(1)(2)
    objMeth     = soopNameSpace(objType)(1)(3)
    obj         = mlist([objType, 'id','type',list2vec(objAtt)', list2vec(objMeth)'])
    obj.id      = freeId
    obj.type    = objType 
    //
    for a = objAtt
        obj(a) = []
    end
    for m = objMeth
        obj(m)  = [];//soop_methodWrap(obj.type, obj.id, m)
    end
    // store object
    soopNameSpace(objType)(2)($+1) = obj
endfunction
function obj = soop_updateMethod(objPtr, m)
    global soopNameSpace 
    obj     = soop_getObj(objPtr)
    obj(m)  = soop_methodWrap(obj.type, obj.id, m)
    soop_storeObj(obj)
endfunction
//
function fun = soop_methodWrap(objType, objId, m)
    if ~isdef(m) then
        fun = []
        return
    end
    funHead     = 'soop_'+m'+'_(varargin)'
    funStart    = 'objPtr = soop_newPtr(""'+objType+'"",'+string(objId)+');'
    vars        = evstr('macrovar('+m+')')
    // nargin 
    if size(vars(1),'*') == 1
        funIn = ''
    else
        funIn = ', varargin'
    end
    // nargout
    if size(vars(2),'*') == 0 
        funOut = ''
    else
        funOut = 'varargout = '
    end
    funCall = m+'(objPtr'+funIn+');'
    funStr  = funStart+funOut +funCall
    fun = deff(funHead, funStr)
endfunction
//
function obj = soop_getObj(objPtr)
    global soopNameSpace
    objPos  = soop_getObjPos(objPtr)
    obj     = soopNameSpace(objPtr.type)(2)(objPos)
endfunction

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

function soop_storeObj(obj)
    global soopNameSpace
    objPos = soop_getObjPos(obj)
    if isempty(objPos) then
        soopNameSpace(obj.type)(2)($+1) = obj
    else 
        soopNameSpace(obj.type)(2)(objPos) = obj
    end
endfunction

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

function objList = soop_getAllObj(objType)
    global soopNameSpace
    if ~soop_classExists(objType) then
        error('Class ''%s'' does not exist', objType)
    end
    objList = soopNameSpace(objType)(2)
endfunction
//
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
// soop_defineObject ...........................................................
function soop_defineObject(objType, objAtt, objMethods)
   
endfunction
