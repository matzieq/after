pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
	plr={
		x=1,
		y=1,
		anim={
			frm={1,2},
			spd=10,
			t=0,
			cur=1
		}
	}
	
	entities={plr}
end

function _draw()
	cls()
	e_draw_all(entities)
	
	local mv={x=0,y=0}
	local is_moving=false
	
	if btnp(⬅️) then
		mv.x-=1
		is_moving=true
	end
	
	if btnp(➡️) then
		mv.x+=1
		is_moving=true
	end
	
	if btnp(⬆️) then
		mv.y-=1
		is_moving=true
	end
	
	if btnp(⬇️) then
		mv.y+=1
		is_moving=true
	end
	
	if is_moving then
		e_move(plr,mv)
	end
end
-->8
--entities

function e_draw(e)
	local cur=e.anim.cur
	local fr=e.anim.frm[cur]
	
	spr(fr,e.x*8,e.y*8)
	
	e.anim.t+=1
	if e.anim.t>e.anim.spd then
		e.anim.cur+=1
		e.anim.t=0
		if e.anim.cur>#e.anim.frm then
			e.anim.cur=1
		end
	end
end

function e_draw_all(es) 
	foreach(es, function(e)
		e_draw(e)
	end)
end

function e_move(e,mv)
	e.x+=mv.x or 0
	e.y+=mv.y or 0
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000aa000000aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000aaaaa0a0aaaaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000aaaa0aa00aaa0aa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700000aaaaa0a0aaaaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000aa000000aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
