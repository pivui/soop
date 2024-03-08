
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
