function soop_end()
    uvars   = who_user(%f);
    outStr  = ''
    argsStr = ''
    //
    prevProt = funcprot(0)
    for v = uvars'
        execstr('vcopy = '+v)
        if typeof(vcopy) == 'soopPtr'
            if length(outStr) > 0
                outStr = outStr + ','
                argsStr = argsStr + ','
            end
            outStr = outStr + v
            argsStr = argsStr + '[]'
        end
        clear vcopy
    end
    execstr('['+outStr+']=resume('+argsStr+')')
    //
    funcprot(prevProt)
    //
    clearglobal soopNameSpace
endfunction
