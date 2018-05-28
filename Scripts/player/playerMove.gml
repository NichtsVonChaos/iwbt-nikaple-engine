nearPlatform = place_meeting(x, y + yflag * 4, platform)
onBlock =
    place_meeting(x, y + yflag, objBlock) ||
    place_meeting(x, y + yflag, activeBlock) ||
    place_meeting(x, y + yflag, obj_wall)
onIvyL = place_meeting(x - 1, y, WalljumpL) && !onBlock && !onPlatform
onIvyR = place_meeting(x + 1, y, WalljumpR) && !onBlock && !onPlatform
onIvy = onIvyL || onIvyR

if (!onIvy) {
    if (h != 0) {
        image_xscale = h
        hspeed = maxSpeed * h
        spr = RUNNING
    } else {
        hspeed = 0
        spr = IDLING
    }
}

//jumping sprites
if (!onIvy && abs(vspeed) > grav && !onPlatform) {
    if (vspeed * yflag < 0) {
        spr = JUMPING
    } else if (vspeed * yflag > 0) {
        spr = FALLING
    }
}

// restore 1st jump
if (onBlock) {
    curJumps = 1
}

//vertical speed limitations
if (vspeed * yflag > maxVspeed) {
    vspeed = sign(vspeed) * maxVspeed
}
//shooting and jumping
if (!global.frozen && !ivyL && !ivyR) {
    playerShoot()
    playerJump()
}

