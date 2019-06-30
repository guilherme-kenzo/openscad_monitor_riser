

union() {
	cube(size = [1, 14, 4]);
	translate(v = [28, 0, 0]) {
		cube(size = [1, 14, 4]);
	}
	cube(size = [28, 14, 1]);
	cube(size = [28, 1, 4]);
	translate(v = [0, 13, 0]) {
		cube(size = [28, 1, 4]);
	}
	translate(v = [0, 0, 2.0000000000]) {
		translate(v = [14, 0, 0]) {
			translate(v = [0, -0.4000000000, 0]) {
				difference() {
					sphere($fn = 1000, r = 1);
					translate(v = [0, 3, 0]) {
						cube(size = 6);
					}
				}
			}
		}
	}
}
/***********************************************
*********      SolidPython code:      **********
************************************************
 
import solid
from solid import utils

from . import dimensions

def draw_side_wall():
    wall = solid.cube([1, dimensions.drawer_y, dimensions.drawer_z])
    return wall

def draw_bottom():
    wall = solid.cube([dimensions.drawer_x, dimensions.drawer_y, 1])
    return wall

def draw_front_back():
    wall = solid.cube([dimensions.drawer_x, 1, dimensions.drawer_z])
    return wall

def draw_knob():
    sphere = solid.sphere(r=1, segments=1000)
    knob = sphere - utils.forward(3)(solid.cube(6))
    return knob

def assembly():
    left_wall = draw_side_wall()
    right_wall = utils.right(dimensions.drawer_x)(draw_side_wall())
    bottom = draw_bottom()
    front_wall = draw_front_back()
    back_wall = utils.forward(dimensions.drawer_y - 1)(draw_front_back())
    knob = utils.back(0.4)(draw_knob())
    knob = utils.right(dimensions.drawer_y)(knob)
    knob = utils.up(dimensions.drawer_z/2)(knob)
    drawer = left_wall + right_wall + bottom + front_wall + back_wall + knob
    return drawer

if __name__ == "__main__":
    drawer = assembly()
    solid.scad_render_to_file(drawer, 'drawer.scad') 
 
************************************************/
