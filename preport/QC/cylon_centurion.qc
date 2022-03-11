$body cylon "cylon_centurion.smd"
$modelname	"bsg/cylon_centurion.mdl"
$cdmaterials "models/bsg/cylon_centurion/"



$sequence "reference" {
	"cylon_centurion.smd"
	fps 30
	loop
	hidden
}

$sequence "Walk" {
    "anims/WalkF_Relaxed.smd"
    activity "ACT_WALK" 1
    fadein 0.2
    fadeout 0.2
    fps 30
	walkframe 50 LX LY
}

// $collisionjoints "cylon_centurion_phys.smd" {
// 	$automass
// }