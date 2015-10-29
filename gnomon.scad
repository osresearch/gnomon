/** \file
 * Solar-powered sundial.
 */


%color("red") cube([200,200,1], center=true);


module project(pos, a1)
{
	translate(pos)
	rotate([0,a1,0])
	//translate([0,0,200/2])
	//cube([3,3,200], center=true);
	scale([2.0,1,1]) cylinder(r=2, h=400, $fn=16);
}


digits = [
[ // 0
	[ 1, 1, 1 ],
	[ 1, 0, 1 ],
	[ 1, 0, 1 ],
	[ 1, 0, 1 ],
	[ 1, 1, 1 ],
],
[ // 1
	[ 0, 1, 0 ],
	[ 1, 1, 0 ],
	[ 0, 1, 0 ],
	[ 0, 1, 0 ],
	[ 0, 1, 0 ],
],
[ // 2
	[ 1, 1, 1 ],
	[ 0, 0, 1 ],
	[ 1, 1, 0 ],
	[ 1, 0, 0 ],
	[ 1, 1, 1 ],
],
[ // 3
	[ 1, 1, 1 ],
	[ 0, 0, 1 ],
	[ 0, 1, 1 ],
	[ 0, 0, 1 ],
	[ 1, 1, 1 ],
],
[ // 4
	[ 1, 0, 1 ],
	[ 1, 0, 1 ],
	[ 1, 1, 1 ],
	[ 0, 0, 1 ],
	[ 0, 0, 1 ],
],
[ // 5
	[ 1, 1, 1 ],
	[ 1, 0, 0 ],
	[ 1, 1, 1 ],
	[ 0, 0, 1 ],
	[ 1, 1, 1 ],
],
[ // 6
	[ 1, 1, 1 ],
	[ 1, 0, 0 ],
	[ 1, 1, 1 ],
	[ 1, 0, 1 ],
	[ 1, 1, 1 ],
],
[ // 7
	[ 1, 1, 1 ],
	[ 0, 0, 1 ],
	[ 0, 1, 0 ],
	[ 0, 1, 0 ],
	[ 0, 1, 0 ],
],
[ // 8
	[ 1, 1, 1 ],
	[ 1, 0, 1 ],
	[ 0, 1, 0 ],
	[ 1, 0, 1 ],
	[ 1, 1, 1 ],
],
[ // 9
	[ 1, 1, 1 ],
	[ 1, 0, 1 ],
	[ 1, 1, 1 ],
	[ 0, 0, 1 ],
	[ 0, 1, 0 ],
],
];


module project_digit(d)
{
	for(x=[0:2])
	{
		for(y=[0:4])
		{
			if (digits[d][y][x])
				project([10*(1-x),10*(y-2),0], (45/9)*d - 22.5);
		}
	}
}

colors=["red","green","blue","yellow","cyan","purple","white","black","gray"];

translate([0,0,-250]) 
difference()
{
/*
	// generate the plates
	union() for(h=[0:15])
	{
		translate([0,0,50+h*3.1]) cube([200,100,3], center=true);
	}
*/
	translate([0,0,250]) intersection() {
		translate([0,0,3*20/2]) cube([400,100,3*20], center=true);
		translate([0,0,-250/2]) rotate([90,0,0]) cylinder(d=400,h=100, center=true);
	}

	// and back-project each of the digits
	for(d=[0:9])
	{
		color(colors[d]) project_digit(d);
	}
}
