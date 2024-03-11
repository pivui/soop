# Soop

An attempt to mimic some object oriented programming features in Scilab.

## Example

```scilab 
soop_begin;
// Define a cat class 
className         = 'cat'
listOfAttributes  = list('name','weight'); // with attributes 'name' and 'weight'
listOfMethods     = list('meow','feed');   // and methods 'meow' and 'feed' to be defined somewhere
soop_newClass(className, listOfAttributes, listOfMethods);
// Create new instance of cat and fill its attributes
fe        = soop_new('cat');
fe.name   = 'Felix';
fe.weight = 1;
// and another one 
re        = soop_new('cat');
re.name   = 'Reglisse';
re.weight = 2;
// Defines the methods  
deff('cat_meow(self)','disp(msprintf(""cat %s: meow!"",self.name));');
deff('cat_feed(self)','self.weight = self.weight + 1;');
// And some overloading, here <= 
deff('out = %cat_3_cat(c1, c2)','out = c1.weight <= c2.weight');
//
fe.meow()       // >> "cat Felix: meow!" 
re.meow()       // >> "cat Reglisse: meow!"
disp(fe == re)  // >> F
fe.feed()
disp(fe.weight) // >> 2
disp(fe <= re)  // >> T
```


