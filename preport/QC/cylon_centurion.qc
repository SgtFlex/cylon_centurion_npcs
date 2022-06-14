$scale 1.0
$body Cylon_Centurion "Cylon_Base.smd"
$modelname	"bsg/cylon_centurion.mdl"
$cdmaterials "models/bsg/cylon_centurion/"
$surfaceprop "metal"
$contents "solid"

$attachment "RArmRCannon" "CATRigRArmRWeapon2" 7.00 0.00 0.00 rotate 0 0 0
$attachment "RArmLCannon" "CATRigRArmLWeapon2" 7.00 0.00 0.00 rotate 0 0 0
$attachment "RArmTCannon" "CATRigRArmLower" 12.50 3.00 0.00 rotate -0 -0 0

$attachment "LArmRCannon" "CATRigLArmRWeapon2" 7.00 0.00 0.00 rotate -0 0 0
$attachment "LArmLCannon" "CATRigLArmLWeapon2" 7.00 0.00 0.00 rotate -0 0 -0
$attachment "LArmTCannon" "CATRigLArmLower" 12.50 3.00 0.00 rotate 0 -0 -0

// $bodygroup "Head"
// {
// 	studio "Cylon_Head.smd"
// 	blank
// }

// $bodygroup "Left Arm"
// {
// 	studio "Cylon_LArm.smd"
// 	blank
// }

// $bodygroup "Right Arm"
// {
// 	studio "Cylon_RArm.smd"
// 	blank
// }

// $bodygroup "Left Leg"
// {
// 	studio "Cylon_LLeg.smd"
// 	blank
// }

// $bodygroup "Right Leg"
// {
// 	studio "Cylon_RLeg.smd"
// 	blank
// }

$collisionjoints Cylon_physics {

	$mass 140.0
	$inertia 1.00
	$damping 0.00
	$rotdamping 0.00
	$rootbone "catrigpelvis"

	$jointconstrain "catrigrlegthigh" x limit -15.00 15.00 0.00
	$jointconstrain "catrigrlegthigh" y limit -30.00 10.00 0.00
	$jointconstrain "catrigrlegthigh" z limit -48.00 91.00 0.00

	$jointconstrain "catrigrleglower" x limit 0.00 0.00 0.00
	$jointconstrain "catrigrleglower" y limit 0.00 0.00 0.00
	$jointconstrain "catrigrleglower" z limit -93.00 26.00 0.00

	$jointconstrain "catrigrlegankle" x limit 0.00 0.00 0.00
	$jointconstrain "catrigrlegankle" y limit 0.00 0.00 0.00
	$jointconstrain "catrigrlegankle" z limit -77.00 30.00 0.00

	$jointconstrain "catrigllegthigh" x limit -15.00 15.00 0.00
	$jointconstrain "catrigllegthigh" y limit -30.00 10.00 0.00
	$jointconstrain "catrigllegthigh" z limit -48.00 91.00 0.00

	$jointconstrain "catriglleglower" x limit 0.00 0.00 0.00
	$jointconstrain "catriglleglower" y limit 0.00 0.00 0.00
	$jointconstrain "catriglleglower" z limit -93.00 26.00 0.00

	$jointconstrain "catrigllegankle" x limit 0.00 0.00 0.00
	$jointconstrain "catrigllegankle" y limit 0.00 0.00 0.00
	$jointconstrain "catrigllegankle" z limit -77.00 30.00 0.00

	$jointconstrain "catrigllegfoot" x limit 0.00 0.00 0.00
	$jointconstrain "catrigllegfoot" y limit 0.00 0.00 0.00
	$jointconstrain "catrigllegfoot" z limit 0.00 0.00 0.00

	$jointconstrain "catrigstomach1" x limit 0.00 0.00 0.00
	$jointconstrain "catrigstomach1" y limit 0.00 0.00 0.00
	$jointconstrain "catrigstomach1" z limit -21.00 21.00 0.00

	$jointconstrain "catrigstomach2" x limit 0.00 0.00 0.00
	$jointconstrain "catrigstomach2" y limit 0.00 0.00 0.00
	$jointconstrain "catrigstomach2" z limit 0.00 0.00 0.00

	$jointconstrain "catrigstomach3" x limit -82.00 82.00 0.00
	$jointconstrain "catrigstomach3" y limit 0.00 0.00 0.00
	$jointconstrain "catrigstomach3" z limit 0.00 0.00 0.00

	$jointconstrain "catrigchest" x limit 0.00 0.00 0.00
	$jointconstrain "catrigchest" y limit 0.00 0.00 0.00
	$jointconstrain "catrigchest" z limit -39.00 39.00 0.00

	$jointconstrain "catrigrarmcollarbone" x limit -180.00 180.00 0.00
	$jointconstrain "catrigrarmcollarbone" y limit -1.00 -1.00 0.00
	$jointconstrain "catrigrarmcollarbone" z limit -1.00 1.00 0.00

	$jointconstrain "catrigtail1" x limit 0.00 0.00 0.00
	$jointconstrain "catrigtail1" y limit 0.00 0.00 0.00
	$jointconstrain "catrigtail1" z limit 0.00 0.00 0.00

	$jointconstrain "catriglarmcollarbone" x limit -180.00 180.00 0.00
	$jointconstrain "catriglarmcollarbone" y limit -1.00 -1.00 0.00
	$jointconstrain "catriglarmcollarbone" z limit -1.00 1.00 0.00

	$jointconstrain "catriglarmupper" x limit -30.00 30.00 0.00
	$jointconstrain "catriglarmupper" y limit -61.00 15.00 0.00
	$jointconstrain "catriglarmupper" z limit -1.00 -1.00 0.00

	$jointconstrain "catriglarmlower" x limit 0.00 0.00 0.00
	$jointconstrain "catriglarmlower" y limit 0.00 0.00 0.00
	$jointconstrain "catriglarmlower" z limit -39.00 95.00 0.00

	$jointconstrain "catriglarmwrist" x limit -180.00 180.00 0.00
	$jointconstrain "catriglarmwrist" y limit 0.00 0.00 0.00
	$jointconstrain "catriglarmwrist" z limit -57.00 57.00 0.00

	$jointconstrain "catrigrarmupper" x limit -30.00 30.00 0.00
	$jointconstrain "catrigrarmupper" y limit -61.00 15.00 0.00
	$jointconstrain "catrigrarmupper" z limit -1.00 -1.00 0.00

	$jointconstrain "catrigrarmlower" x limit 0.00 0.00 0.00
	$jointconstrain "catrigrarmlower" y limit 0.00 0.00 0.00
	$jointconstrain "catrigrarmlower" z limit -39.00 95.00 0.00

	$jointconstrain "catrigrarmwrist" x limit -180.00 180.00 0.00
	$jointconstrain "catrigrarmwrist" y limit 0.00 0.00 0.00
	$jointconstrain "catrigrarmwrist" z limit -57.00 57.00 0.00

	$jointconstrain "catrigtail2" x limit -19.00 19.00 0.00
	$jointconstrain "catrigtail2" y limit 0.00 0.00 0.00
	$jointconstrain "catrigtail2" z limit -10.00 10.00 0.00

	$jointconstrain "catriganklebone001" x limit 0.00 0.00 0.00
	$jointconstrain "catriganklebone001" y limit 0.00 0.00 0.00
	$jointconstrain "catriganklebone001" z limit 0.00 0.00 0.00
}



$animation Reference "anims/Reference.smd"



$animation Chest_LookF "anims/Reference.smd" subtract Reference 0
$animation Chest_LookR "anims/Chest_LookR.smd" subtract Reference 0
$animation Chest_LookL "anims/Chest_LookL.smd" subtract Reference 0
$animation Chest_LookU "anims/Chest_LookU.smd" subtract Reference 0
$animation Chest_LookD "anims/Chest_LookD.smd" subtract Reference 0

$sequence "aim_pitch_body" {
	"Chest_LookU"
	"Chest_LookF"
	"Chest_LookD"
	blend "aim_pitch" -90 90
	blendwidth 3
	delta
	fadein 0.2
	fadeout 0.2
}

$sequence "aim_yaw_body" {
	"Chest_LookR"
	"Chest_LookF"
	"Chest_LookL"
	blend "aim_yaw" -90 90
	blendwidth 3
	delta
	fadein 0.2
	fadeout 0.2
}

$sequence "Idle_Relaxed" {
    "anims/Idle_Relaxed.smd"
	{ event 1100 0 "Rotate_Start" }
	{ event 1100 20 "Rotate_Stop" }
	{ event 1100 40 "Rotate_Start" }
	{ event 1100 70 "Rotate_Stop" }
	{ event 1100 90 "Rotate_Start" }
	{ event 1100 110 "Rotate_Stop" }
    activity "ACT_IDLE" 1
    fadein 0.2
    fadeout 0.2
    fps 30
	loop
}

$sequence "Idle_Alerted" {
    "anims/Idle_Alerted.smd"
	addlayer aim_yaw_body
	addlayer aim_pitch_body
    activity "ACT_IDLE_AGITATED" 1
    fadein 0.2
    fadeout 0.2
    fps 30
	loop
}

$sequence "Walk_Relaxed" {
    "anims/WalkF_Relaxed.smd"
	{ event 1100 2 "Raise" }
	{ event 1100 25 "Step" }
	{ event 1100 27 "Raise" }
	{ event 1100 50 "Step" }
    activity "ACT_WALK" 1
    fadein 0.2
    fadeout 0.2
    fps 30
	loop
	walkframe 100 LX LY
}

$sequence "Walk_Alerted" {
    "anims/WalkF_Alerted.smd"
	{ event 1100 2 "Raise" }
	{ event 1100 25 "Step" }
	{ event 1100 27 "Raise" }
	{ event 1100 50 "Step" }
	addlayer aim_yaw_body
	addlayer aim_pitch_body
    activity "ACT_WALK_AIM" 1
    fadein 0.2
    fadeout 0.2
    fps 30
	loop
	walkframe 100 LX LY
}

$sequence "Run_Relaxed" {
    "anims/RunF_Relaxed.smd"
	{ event 1100 2 "Step" }
	{ event 1100 3 "Raise" }
	{ event 1100 13 "Step" }
	{ event 1100 14 "Raise" }
    activity "ACT_RUN" 1
    fadein 0.2
    fadeout 0.2
    fps 30
	loop
	walkframe 100 LX LY
}

$sequence "Run_Alerted" {
    "anims/RunF_Alerted.smd"
	{ event 1100 2 "Step" }
	{ event 1100 3 "Raise" }
	{ event 1100 13 "Step" }
	{ event 1100 14 "Raise" }
	addlayer aim_yaw_body
	addlayer aim_pitch_body
    activity "ACT_RUN_AIM" 1
    fadein 0.2
    fadeout 0.2
    fps 30
	loop
	walkframe 100 LX LY
}

$sequence "Alert_To_Shoot" {
    "anims/AlertedToShooting.smd"
	activity "ACT_ALERT_TO_SHOOT" 1
    fadein 0.2
    fadeout 0.2
    fps 30
}

$sequence "Shooting_Stance" {
	"anims/ShootingStance.smd"
	addlayer aim_yaw_body
	addlayer aim_pitch_body
	activity "ACT_SHOOTING_STANCE" 1
	fadein 0.2
    fadeout 0.2
	loop
    fps 30
}

$animation Fire1 "anims/ShootingGesture" subtract Shooting_Stance 0
$sequence "Shooting_Gesture" {
	"Fire1"
	delta
}

$sequence "Melee_1" {
    "anims/Melee1.smd"
    activity "ACT_MELEE_ATTACK1" 1
	{ event 1100 0 "Melee_Ready" }
	{ event 1100 28 "Melee_Slash" }
    fadein 0.2
    fadeout 0.2
    fps 30
}

$sequence "Death_1" {
    "anims/Death1.smd"
	{ event 1100 20 "KneeClank" }
	{ event 1100 40 "GroundSlam" }
    activity "ACT_DIESIMPLE" 1
    fadein 0.2
    fadeout 0.2
    fps 30
	walkframe 100 LX LY
}