
grv = 0.3;
vsp = 0;
hsp = 0;
hsp_walk = 3.5;
vsp_jump = -8;
can_jump = 0;
can_dash = false;
dashtime = 12;
dashdistance = 106;
StateFree = function()
{
	//horizontal movement
hsp = (_keyright - _keyleft) * hsp_walk;

//vertical movement
vsp = vsp + grv;

//can jump
if  (can_jump-- > 0) && (_keyjump)
{
    vsp = vsp_jump;
	can_jump = 0;
}
//can dash
if (can_dash) && (_keydash)
{
	can_dash = false;
	can_jump = 0
	dashdirection = point_direction(0,0,_keyright - _keyleft, _keydown -_keyup);
	dashsp = dashdistance / dashtime
	dashenergy = dashdistance;
	state = StateDash
}
//Collide/move
if (place_meeting(x + hsp, y, Owall))
{
	while	(abs(hsp) > 0.1)
	{
		hsp *= 0.5;
		if (!place_meeting(x = hsp, y, Owall)) x += hsp;
	}
	hsp = 0;
}
x += hsp;

if (place_meeting(x , y + vsp, Owall))
{
	if (vsp > 0) 
	{
	can_jump = 10;
	can_dash = true;
	}
	while (abs(vsp) > 0.1)
	{
		vsp *= 0.5;
		if (!place_meeting(x , y + vsp, Owall)) y += vsp;
	}
	vsp = 0;
}
y += vsp;
}
StateDash = function()
{
	
	//Move via dash
	hsp = lengthdir_x(dashsp,dashdirection);
	vsp = lengthdir_y(dashsp,dashdirection);
	
	//Trail Effect
	with (instance_create_depth(x,y,depth + 1, Otrail))
	{
		sprite_index = other.sprite_index;
		image_blend = c_fuchsia;
		image_alpha = 0.7;
	}
	
	//Collide/move
if (place_meeting(x + hsp, y, Owall))
{
	while	(abs(hsp) > 0.1)
	{
		hsp *= 0.5;
		if (!place_meeting(x = hsp, y, Owall)) x += hsp;
	}
	hsp = 0;
}
x += hsp;

if (place_meeting(x , y + vsp, Owall))
{
	while (abs(vsp) > 0.1)
	{
		vsp *= 0.5;
		if (!place_meeting(x , y + vsp, Owall)) y += vsp;
	}
	vsp = 0;
}
y += vsp;

//ending dash state
dashenergy -= dashsp;
if (dashenergy <= 0)
{
	hsp = 0;
	vsp = 0;
	state = StateFree;
}

}
state = StateFree
