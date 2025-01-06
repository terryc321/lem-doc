# lem documentation project

```
problem in a nutshell: 
 given an electronic book that presents a logical argument , 
 have some confidence that the conclusion follows from the assumptions .
 
timeless : 
 arguments presented once true are forever true 
 mathematical purity is extremely valuable 
 world class reasoning
 
robust :
 works easily on different hardware 
 boot strappable , does not require special compiler 
 
 
hurdles :
 operating system compromised
 hardware compromised
 solar storms affect electronics causing wrong bit to be placed in wrong address
 compiler errors such as c compiler 
 
difficulty: 
 computer math numericals is hard , overflow underflow etc..
 multiplying wildly different sized numbers floating point is a headache
 math algorithms need to be ensured correctness ?
 
computation order:
 results do not affect computations 
 
 a = 1 
 b = 2 
 c = a + b 
 
 result : c = 3
 
 c must always be 3 
 there is no situation where we can intercept c , change a to 2 , then find c to be 4
 
 in jupyter
 a = 1
 b = 2
  < revisit here and set a = 2 internally but visually looks like a = 1 >
 c = a + b 
 
 result : c = 4 
 
 this is because bad habits of imperative programming have been allowed a toxic spill into 
 logical world
 BAD
  

development : 
much like development of a proof may write things down in different orders
front to back
back to front
middle to end
lemmas , 
assumptions - what are the assumptions 


correctness :
correctness is more important than efficiency

efficiency : 
efficiency is important also , we can do a quick and dirty computation to achieve a result.
but that result must then be subject to interogation to assertain the correctness.
once correctness is established 

trying to present a cogent logic argument to human reader, going to need to represent
graphs , formulas , arguments and conclusions. 
There will be many many steps in the manuscript some require different software packages and 
different software languages.
some results may come from foreign sources such as books or other computations done on other 
computers.
may want to check computation of your own computer to ensure nothing un to ward has occured

so really looking at global scope of how do i trust what i see on the computer as the result.

gerald sussman from mit calls it trace-ability , given a result -
 what does the result rely on 
 where did those values plugged into formulae come from
  where did those formulae come from
   where did those formulae of formulae come from etc..
    
looking at computer verification isabelle/hol and coq theorem prover also for the code we are
writing a simple functional stack machine 

static verified typing with no type inference is idea from mathius felleisen racket scheme indiana university .

really what want is a system allows editing a manuscript


lem is inherently unstable , if something goes wrong the text editor ide crashes
so cannot be running the lem editor and write about using the lem editor because a 
crash loses all the work thats been done 
```

# mvp minimal viable product
```
a collection of buffers - simple as an array

buffer is a representation of 
buffer can be created from a file - 

some way to list known buffers - just the collection
close a buffer
open a buffer

buffer point - where is the cursor
insert text into a buffer at point
remove text from a buffer at point

insert text into a buffer region
remove text from a buffer region


frames vs window 

similar to model view controller 
visual presentation of buffer on a screen - 
split buffer visually - so can see two buffers on screen at any one time
switch between buffers visually 

visual presentation of buffer to allow scroll up down left right 



```

# init file
```
~/.lem/init.lisp

lem text editor uses this similar to emacs ~/.emacs.d/init.el 
any examples of stuff can do like change background color on startup 
silence the welcome screen ?

```

# strategy

start by comprehending a file in contrib/tetris/tetris.lisp

defconstant
(defconstant +pi+  3)
can visually see pi is a constant variable

defvar
(defvar *title* "main title")

defparameter 
(defparameter *title* "main title")

definition defvar / defparameter 
these define a global variable 

defpackage 
(defpackage )

(current-point)
(current-buffer)


