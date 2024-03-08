
function out = %soopPtr_e(varargin)
    p   = varargin($)
    obj = soop_getObj(p)
    //
    if argn(2) == 2 & typeof(varargin(1)) == 'string' then
        t = soop_testField(p, varargin(1))
        if t == 0
            error('Invalid attribute/method ''s'' for class %s',varargin(1), p.type_)
        end
        if t==2
            m = obj(varargin(1))
            if typeof(m) ~= 'function'
                obj = soop_updateMethod(p, varargin(1))
            end
        end
    end
    out = obj(varargin(1:$-1))
endfunction
