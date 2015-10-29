module slice(n)
{
	intersection() {
		translate([0,0,-n]) import("gnomon.stl");
		cube([250,250,4], center=true);
	}
}


for(x=[0:3])
{
	for(y=[0:3])
	translate([x*260,y*110,0]) slice((x*4+y)*4.0);
}

//%cube([200,100,1], center=true);
