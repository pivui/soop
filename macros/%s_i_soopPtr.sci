
// sopiPtr(i) = <string>
function p = %s_i_soopPtr(varargin)
    p           = varargin($)
    rhs         = varargin($-1)
    idx         = varargin(1:$-2)
    //
    obj         = soop_getObj(p)
    obj         = setfield(idx, rhs, obj)
    soop_storeObj(obj)
endfunction
