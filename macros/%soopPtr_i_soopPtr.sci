function p = %soopPtr_i_soopPtr(varargin)
    p           = varargin($)
    rhs         = varargin($-1)
    idx         = varargin(1:$-2)
    //
    obj         = soop_getObj(p)
    obj         = setfield(idx, soop_getObj(rhs), obj)
    soop_storeObj(obj)
endfunction
