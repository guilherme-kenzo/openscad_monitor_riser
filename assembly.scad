

union() {
	color(c = "blue") {
		union() {
			cube(size = [1, 15, 11]);
			translate(v = [30, 0, 0]) {
				cube(size = [1, 15, 11]);
			}
			cube(size = [31, 15, 1]);
			translate(v = [0, 0, 11]) {
				cube(size = [31, 15, 1]);
			}
			translate(v = [0, 14, 0]) {
				cube(size = [30, 1, 11]);
			}
		}
	}
	color(c = "red") {
		translate(v = [0, 0, 1]) {
			translate(v = [1, 0, 0]) {
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
			}
		}
	}
	color(c = "green") {
		translate(v = [1, 0, 0]) {
			translate(v = [0, 0, 6.5000000000]) {
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
			}
		}
	}
	color(c = "blue") {
		translate(v = [0.5000000000, 0, 0]) {
			translate(v = [0, 0, 5.0000000000]) {
				cube(size = [30, 1, 1.5000000000]);
			}
		}
	}
}
/***********************************************
*********      SolidPython code:      **********
************************************************
 
from . import big_box
from . import drawers
from . import dimensions

import solid
from solid import utils

def assembly():
    box = big_box.assembly()
    box = utils.color('blue')(box)
    bottom_drawer = utils.up(1)(utils.right(1)(drawers.assembly()))
    bottom_drawer = utils.color('red')(bottom_drawer)
    top_drawer = utils.right(1)(utils.up((dimensions.box_x/4)-1)(drawers.assembly()))
    top_drawer = utils.color('green')(top_drawer)
    middle_spacer = solid.cube([dimensions.box_x, 1, 1.5])
    middle_spacer = utils.up((dimensions.box_z/2)-0.5)(middle_spacer)
    middle_spacer = utils.right(0.5)(middle_spacer)
    middle_spacer = utils.color('blue')(middle_spacer)
    monitor_stand = box + bottom_drawer + top_drawer + middle_spacer
    return monitor_stand

if __name__ == "__main__":
    monitor_stand = assembly()
    solid.scad_render_to_file(monitor_stand, 'assembly.scad')
 
 
************************************************/
