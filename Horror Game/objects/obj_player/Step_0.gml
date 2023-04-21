///Woe, Movement Upon Ye
//Allow the player to move
if keyboard_check(ord("A"))
{
    x = x - 2;
	sprite_index = spr_playerLeft
	global.input = 180;
}
if keyboard_check(ord("D"))
{
    x = x + 2;
	sprite_index = spr_playerRight
	global.input = 0;
}
if keyboard_check(ord("W"))
{
    y = y - 2;
	sprite_index = spr_playerUp
	global.input = 90;
}
if keyboard_check(ord("S"))
{
    y = y + 2;
	sprite_index = spr_playerDown
	global.input = 270;
}
//Sprint Kek
if keyboard_check(ord("A")) && keyboard_check(vk_lshift)
{
    x = x - 4;
}
if keyboard_check(ord("D")) && keyboard_check(vk_lshift)
{
    x = x + 4;
}
if keyboard_check(ord("W")) && keyboard_check(vk_lshift)
{
    y = y - 4;
}
if keyboard_check(ord("S")) && keyboard_check(vk_lshift)
{
    y = y + 4;
}

//Interaction.jpg
if keyboard_check(vk_space)
{
	
}




