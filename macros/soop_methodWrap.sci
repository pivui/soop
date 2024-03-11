function fun = soop_methodWrap(objType, objId, m)
    m = objType + '_' + m
    if ~isdef(m) then
        fun = []
        return
    end
    funStart    = 'objPtr = soop_newPtr(""'+objType+'"",'+string(objId)+');'
    vars        = evstr('macrovar('+m+')')
    // nargin
    funIn       = strcat(vars(1)(2:$),',')
    if isempty(funIn)
        funHead     = 'varargout = soop_'+m'+'_()'
        funIn       = 'objPtr'
    else 
        funHead     = 'soop_'+m'+'_('+funIn+')'
        funIn       = strcat(['objPtr',funIn],',')
    end 
    // nargout
    funOut = ''
    if size(vars(2),'*')> 0 then
        funOut = []
        for i = 1:size(vars(2),'*')
            funOut(i) = 'varargout('+string(i)+')'
        end
        funOut = '['+strcat(funOut,',')+']='
    end
    funCall     = funOut + m+'('+funIn+');'
    fun = deff(funHead, funStart + funCall)
endfunction
