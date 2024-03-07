
function objPtr = soop_newPtr(objType, objId)
    objPtr          = mlist(['soopPtr','type','id'])
    objPtr.type     = objType
    objPtr.id       = objId
endfunction

// sopiPtr(i) = <string>
function p = %c_i_soopPtr(varargin)
    p           = varargin($)
    rhs         = varargin($-1)
    idx         = varargin(1:$-2)
    //
    obj         = soop_getObj(p)
    obj(idx)    = rhs   
    soop_storeObj(obj)
endfunction

function %soopPtr_p(p)
   disp('Pointer towards:')
   disp(soop_getObj(p))
endfunction

function out = %soopPtr_e(varargin)
    p   = varargin($)
    obj = soop_getObj(p)
    //
    if argn(2) == 2 & typeof(varargin(1)) == 'string' then
        t = soop_testField(p, varargin(1))
        if t == 0
            error('Invalid attribute/method ''s'' for class %s',varargin(1), p.type)
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


function %soopPtr_6(varargin)
    disp(varargin)
endfunction
