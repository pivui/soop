soop_begin;
// Define cat "class" with
// - attributes: name and color 
// - method: meow
attr = list('name','color');
meth = list('meow');
soop_newClass('cat', attr, meth);

// Create new instance of cat
cat1        = soop_new('cat');
cat1.name   = "Felix";
cat1.color  = "black";
// Define meow method 
deff('meow(self)','disp(msprintf(""cat %s: meow!"",self.name));');
//
