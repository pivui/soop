function soop_delObj(obj)
    global soopNameSpace
    [dummy, objPos]                     = soop_getObj(obj)
    soopNameSpace(obj.type)(2)(objPos)  = []
    // store free position 
    soopNameSpace(obj.type)(4)($+1)     = objPos
endfunction
