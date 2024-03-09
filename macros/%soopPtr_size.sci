function varargout = %soopPtr_size(p, varargin)
    obj    = soop_getObj(p)
    //
    outStr = ''
    for i = 1:argn(1)
        if i > 1 then
            outStr = outStr +  ','
        end
        outStr = outStr + 'varargout('+string(i)+')'
    end
    execstr('[' + outStr + '] = size(obj, varargin(1:$))')
endfunction 
