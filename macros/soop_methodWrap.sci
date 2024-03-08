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
