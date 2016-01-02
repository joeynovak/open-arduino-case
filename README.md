#OpenCase
A tool for generating dxf files for laser cut cases (Arduino, RaspPi, etc...)

##Description
Open Case is an OpenScad file which can easily be used to generate any size of case.  You define the internal dimensions, your material thickness, the "padding", and the overhang (see: https://github.com/joeynovak/open-arduino-case/blob/master/dimension-example.png)

##Dimensions
The dimensions of the box are defined in the first few lines of the file.  Below is an example configuration (this is for an Arduino Uno (with USB Mini instead of Micro), with a HR911105A Ethernet Board next to it, with enough height to wire the two together using jumpers.)  

	//Dimensions
	materialThickness = .14;
	
	//Inside Box Dimensions
	spaceBetweenParts = .1;
	padding = 1;
	width = 3.5;
	height = 2.7;
	tall= 1.7;
	
	
	//Overhang
	overhang=.12;
	
	insideBottomHoles = [
	    //Arduino Holes
	    [.125/2, 1.34 + .1 + .1, .6],
	    [.125/2, 1.34 + .1 + 1.995, .54],
	    [.125/2, 1.34 + .1 + .7, 2.6],
	    [.125/2, 1.34 + .1 + 1.795, 2.6],
	    
	    //Ethernet Adapter Holes
	    [.125/2, 0 + .123, .16],
	    [.125/2, 0 + 1.2, .16],
	    [.125/2, 0 + .123, 2.06],
	    [.125/2, 0 + 1.2, 2.06]
	    
	];
	
	insideTopHoles = [
	[.125/2, 1.34 + .1 + .1, .6],
	];
	
	panelCutouts = [
	    //Power
	    [1.34 + .1 + 1.63, .12,.356,.433],
	    
	    //USB
	    [1.34 + .1 + .4,.12,.45,.31]    
	];
	
	panelHoles = [    
	];

##Holes
Currently, you can define round holes in the top and bottom of the case. As well as in the front face.

##Cut Outs
Currently, you can define rectangular cut-outs in the front face of the case.   
 
##Padding
Padding is similar to HTML padding.  Padding is added to the inside width and height dimensions you specify for the case, and is automatically accounted for when you put your holes and cut-outs in the faces.  The idea behind padding, is that you measure the board you want to make a case for exactly, and use those exact measurements to place your holes and cut-outs.  Then, when you cut your pieces, the padding will make it so your board can get in and out of the case.  .02" (20 thousandths of an inch) is usually about right. 

##Exporting DXF Files
To Export the case pieces to DXF files, you have to press F6, and actually "Render" the file.  For whatever reason OpenScad's "projection" function doesn't do anything until you do an "official" render.  Once you've rendered the file, you can go to File -> Export -> Export As DXF

##Planned Improvements
Currently, the code is crap.  I just wanted to get it done, and am not THAT experienced with OpenSCAD, so there is A LOT of duplicated code, and some very messy math expressions.  

An option to render a fully assembled Case, instead of just the pieces.

#Change Log
* Initial Release (Joey Novak)