extends Area2D

var screen_size = Vector2.ZERO
var screen_width
var screen_height
var width_center
var height_center
var dropperPoints = 256.0
var dropperArrayPosition = 0
var dropperArray = [0]
var dropperArrayValue = 0
var swingMargin = 0.6

func _ready():
	screen_size = get_viewport_rect().size
	screen_width = screen_size[0]
	screen_height = screen_size[1]
	width_center = screen_width/2
	height_center = screen_height/2
	$window_size.text = str(screen_width)+" x "+str(screen_height)
	boardSetup()

func boardSetup():
	dropperSetup()
	
func dropperSetup():
	var i = 0
	var dropperArrayProportion = 0.0
	var dropperArrayValue = 0.0
	$dropper_res.text = str(dropperPoints)

	while i <= dropperPoints:
		dropperArrayProportion = (i/dropperPoints)
		dropperArrayValue = cos((PI)+dropperArrayProportion*(2*PI))
		i += 1
		dropperArray.append(dropperArrayValue)			
	#Populates an array (dropper[dropperPoints])
	#-1 to 1 to -1 again in a sinusoidal distribution
	#"dropperPoints" determines how many steps this translation takes

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screen_size = get_viewport_rect().size
	screen_width = screen_size[0]
	screen_height = screen_size[1]
	$window_size.text = str(screen_width)+" x "+str(screen_height)
	
	width_center = screen_width/2
	$tile_center.position.x = width_center + ((screen_width/2)*dropperArray[dropperArrayValue]*swingMargin)
	
	dropperArrayValue += 1
	print(dropperArrayValue)
	if dropperArrayValue > dropperPoints:
		dropperArrayValue = 1
	
