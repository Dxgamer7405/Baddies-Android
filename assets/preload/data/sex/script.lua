function onCreate()

	makeAnimatedLuaSprite('move', 'icons/jasminehorn', getProperty('iconP2.x'), getProperty('iconP2.y'))
	addAnimationByPrefix('move', 'idle', 'horn', 24, false)
	setObjectCamera('move', 'hud')
	addLuaSprite('move', true)

	makeAnimatedLuaSprite('move2', 'icons/novaBed2', getProperty('iconP1.x'), getProperty('iconP1.y'))
	addAnimationByPrefix('move2', 'idle', 'oof', 24, false)
	setObjectCamera('move2', 'hud')
	addLuaSprite('move2', true)

end

function onUpdate(elapsed)



    setProperty('move2.flipX', true)
    setProperty('move2.visible', true)
    setProperty('move2.x', getProperty('iconP1.x') - 20)
    setProperty('move2.angle', getProperty('iconP1.angle'))
    setProperty('move2.y', getProperty('iconP1.y') - -20)
    setProperty('move2.x', getProperty('iconP1.scale.x') - -920)
    setProperty('move2.scale.y', getProperty('iconP1.scale.y'))
    setProperty('move2.antialiasing',true)

 
	setObjectOrder('move2', getObjectOrder('iconP1') + 1)
    setObjectOrder('move', getObjectOrder('iconP2') + 1)

    setProperty('move.flipX', false)
    setProperty('move.visible', true)
    setProperty('move.x', getProperty('iconP2.x') - 30)
    setProperty('move.angle', getProperty('iconP2.angle'))
    setProperty('move.y', getProperty('iconP2.y') - -20)
    setProperty('move.x', getProperty('iconP2.scale.x') - -220)
    setProperty('move.scale.y', getProperty('iconP2.scale.y') - 0)
    setProperty('move.antialiasing',true)

    setProperty('iconP2.alpha', 0) 
	objectPlayAnimation('move2','idle');
        objectPlayAnimation('move','idle');

end

local xx = 450;
local yy = 450;
local xx2 = 720;
local yy2 = 400;
local ofs = 80;
local followchars = true;
local del = 0;
local del2 = 0;


function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end


stepHitFuncs = {

	[256] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.4 then
        			setProperty('health', health- 0.015);
   			 end
		end
	end,
	[290] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.1 then
        			setProperty('health', health- 0);
   			 end
		end
	end,
	[578] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.3 then
        			setProperty('health', health- 0.035);
   			 end
		end
	end,
	[605] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.1 then
        			setProperty('health', health- 0);
   			 end
		end
	end,
	[704] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.2 then
        			setProperty('health', health- 0.060);
   			 end
		end
	end,
	[731] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.1 then
        			setProperty('health', health- 0);
   			 end
		end
	end
	
}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end
	
end
	
