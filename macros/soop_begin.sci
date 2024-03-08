function soop_begin()
    //
    //  Initialise variable required by soop such as its global namespace where 
    //  object instances are stored. Any soop-related action will not work before
    //  this call.
    //
    //  Syntax 
    //      soop_begin()
    //
    //  Authors
    //      Pierre Vuillemin - 2024
  
    global soopNameSpace
    soopNameSpace = tlist(['soopNameSpace'])
endfunction
