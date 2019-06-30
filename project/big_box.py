import solid
from solid import utils

from . import dimensions

def lateral_wall(thickness=1):
    wall = solid.cube([thickness, dimensions.box_y, dimensions.box_z])
    return wall

def back_wall(thickness=1):
    wall = solid.cube([dimensions.box_x, thickness, dimensions.box_z])
    return wall

def bottom_top_wall(thickness=1):
    wall = solid.cube([dimensions.box_x + 1, dimensions.box_y, thickness])
    return wall


def assembly():
    left_wall = lateral_wall()
    right_wall = utils.right(dimensions.box_x)(lateral_wall())
    bottom  = bottom_top_wall()
    top = utils.up(dimensions.box_z)(bottom_top_wall())
    back = utils.forward(dimensions.box_y - 1)(back_wall())
    return left_wall + right_wall + bottom + top + back

if __name__ == "__main__":
    box = assembly()
    solid.scad_render_to_file(box, 'big_box.scad')