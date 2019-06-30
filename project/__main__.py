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
