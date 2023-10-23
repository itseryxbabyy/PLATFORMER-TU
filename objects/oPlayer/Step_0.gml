/// @desc Core Player Logic

//Get player inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
keyjump = keyboard_check_pressed(vk_space);

//Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

//Horizontal collision
if (place_meeting(x+hsp,y,oInvisWall))
{
	while (!place_meeting(x+sign(hsp),y,oInvisWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical collision
if (place_meeting(x, y+vsp,oInvisWall))
{
	while (!place_meeting(x, y+sign(vsp),oInvisWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;