
function varargout = %soopPtr_e(varargin)
    p   = varargin($)
    obj = soop_getObj(p)
    //
    if argn(2) == 2 & typeof(varargin(1)) == 'string' then
        t = soop_testField(p, varargin(1))
        if t == 0
            error(sprintf('Invalid attribute/method ''%s'' for class %s',varargin(1), p.type_))
        end
        if t==2
            m = obj(varargin(1))
            if typeof(m) ~= 'function'
                obj = soop_updateMethod(p, varargin(1))
            end
        end
    end
    //
//    varargout = obj(varargin(1:$-1))
    outStr = ''
    for i = 1:argn(1)
        if i > 1 then
            outStr = outStr +  ','
        end
        outStr = outStr + 'varargout('+string(i)+')'
    end
    execstr('[' + outStr + '] = obj(varargin(1:$-1))')

endfunction
