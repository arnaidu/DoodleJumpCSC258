######################################################################
#CSC258H5S Fall 2020 Assembly Final Project
#University of Toronto, St. George
#
# Student: Anil Naidu, 1001281061
#
# Bitmap Display Configuration:
# - Unit width in pixels: 8
# - Unit height in pixels: 8
# - Display width in pixels: 256
# - Display height in pixels: 512
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestone is reached in this submission?
# 
# - Only milestones 1-4 have been achieved completely
#
# Which approved additional features have been implemented?
# 
# Technically, these are not additional features, but they are the features after milestone 3
# 
# For Milestone 4:
# 1. Scoreboard/score count
# 2. Game Over/ Retry 
#
# For Milestone 5:
# 
# None implemented
#
# Additional Information:
#
# None that I can think of.
######################################################################



.data
	startScreen: .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
		     0,0,1,1,1,0,0,0,1,1,0,0,0,1,1,0,0,1,1,1,0,0,1,0,0,0,1,1,1,0,0,0,
		     0,0,1,0,0,1,0,1,0,0,1,0,1,0,0,1,0,1,0,0,1,0,1,0,0,0,1,0,0,0,0,0,
		     0,0,1,0,0,1,0,1,0,0,1,0,1,0,0,1,0,1,0,0,1,0,1,0,0,0,1,1,1,0,0,0, 
		     0,0,1,0,0,1,0,1,0,0,1,0,1,0,0,1,0,1,0,0,1,0,1,0,0,0,1,0,0,0,0,0, 
		     0,0,1,1,1,0,0,0,1,1,0,0,0,1,1,0,0,1,1,1,0,0,1,1,1,0,1,1,1,0,0,0, 
		     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
		     0,0,0,0,0,0,1,1,1,1,0,1,0,0,1,0,1,1,0,1,1,0,1,1,1,0,0,0,0,0,0,0, 
		     0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,0,1,1,1,1,1,0,1,0,0,1,0,0,0,0,0,0, 
		     0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,0,1,0,1,0,1,0,1,1,1,0,0,0,0,0,0,0, 
		     0,0,0,0,0,0,1,0,1,0,0,1,1,1,1,0,1,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0, 
		     0,0,0,0,0,0,1,1,1,0,0,0,1,1,0,0,1,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0, 
		     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		     0,0,0,0,0,1,1,1,0,1,1,1,0,0,1,1,1,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0, 
		     0,0,0,0,0,1,0,1,0,1,0,0,1,0,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0, 
		     0,0,0,0,0,1,1,1,0,1,1,1,0,0,1,1,1,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0, 
		     0,0,0,0,0,1,0,0,0,1,0,1,1,0,1,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0, 
		     0,0,0,0,0,1,0,0,0,1,0,0,1,0,1,1,1,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0, 
		     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
		     0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
		     0,0,0,0,0,1,0,0,1,1,1,0,1,0,0,1,1,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0, 
		     0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0, 
		     0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0, 
		     0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0, 
		     0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,1,1,1,0,0,0,0,0,0,0, 
		     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
		     0,0,0,0,0,0,1,1,1,0,1,1,1,0,0,1,1,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0, 
		     0,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,1,0,1,0,0,1,0,0,1,0,0,0,0,0,0, 
		     0,0,0,0,0,1,1,1,0,0,0,1,0,0,1,1,1,1,0,1,1,1,0,0,0,1,0,0,0,0,0,0, 
		     0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,0,1,0,1,1,0,0,1,0,0,0,0,0,0, 
		     0,0,0,0,0,1,1,1,0,0,0,1,0,0,1,0,0,1,0,1,0,0,1,0,0,1,0,0,0,0,0,0, 
		     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	
	gameOverScreen: .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
			      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  
			      0,0,0,0,0,0,1,1,1,0,0,1,1,0,0,1,0,0,0,1,0,1,1,1,1,0,0,0,0,0,0,0,  
			      0,0,0,0,0,1,0,0,0,0,1,0,0,1,0,1,1,0,1,1,0,1,0,0,0,0,0,0,0,0,0,0, 
			      0,0,0,0,0,1,0,0,0,0,1,0,0,1,0,1,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,
			      0,0,0,0,0,1,0,1,1,0,1,1,1,1,0,1,0,1,0,1,0,1,1,1,1,0,0,0,0,0,0,0,  
			      0,0,0,0,0,1,0,0,1,0,1,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0, 
			      0,0,0,0,0,0,1,1,1,0,1,0,0,1,0,1,0,0,0,1,0,1,1,1,1,0,0,0,0,0,0,0, 
			      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  
			      0,0,0,0,0,0,1,1,0,0,1,0,0,0,1,0,1,1,1,1,0,1,1,1,0,0,0,0,0,0,0,0,  
			      0,0,0,0,0,1,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,  
			      0,0,0,0,0,1,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,  
			      0,0,0,0,0,1,0,0,1,0,1,1,0,1,1,0,1,1,1,1,0,1,1,1,0,0,0,0,0,0,0,0,  
			      0,0,0,0,0,1,0,0,1,0,0,1,1,1,0,0,1,0,0,0,0,1,0,1,1,0,0,0,0,0,0,0, 
			      0,0,0,0,0,0,1,1,0,0,0,0,1,0,0,0,1,1,1,1,0,1,0,0,1,0,0,0,0,0,0,0,  
			      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  
			      0,0,0,0,0,1,1,1,0,1,1,1,0,0,1,1,1,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,  
			      0,0,0,0,0,1,0,1,0,1,0,0,1,0,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,  
			      0,0,0,0,0,1,1,1,0,1,0,0,1,0,1,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,  
			      0,0,0,0,0,1,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,  
			      0,0,0,0,0,1,0,0,0,1,0,1,1,0,1,0,0,0,1,0,0,1,0,1,0,0,1,0,0,0,0,0,  
			      0,0,0,0,0,1,0,0,0,1,0,0,1,0,1,1,1,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,  
			      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  
			      0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,  
			      0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,  
			      0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  
			      0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  
			      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  
			      0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  
			      0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  
			      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  
			      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	
	scoreImage: .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
			   0,0,1,1,0,1,1,0,0,1,0,0,1,1,0,0,1,1,0, 
			   0,1,0,0,0,1,0,0,1,0,1,0,1,0,1,0,1,0,0, 
			   0,1,1,0,0,1,0,0,1,0,1,0,1,0,1,0,1,0,0, 
			   0,0,0,1,0,1,0,0,1,0,1,0,1,1,0,0,1,1,0, 
			   0,1,0,1,0,1,0,0,1,0,1,0,1,0,1,0,1,0,0, 
			   0,1,1,0,0,1,1,0,0,1,0,0,1,0,1,0,1,1,0, 
			   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
			   0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0, 
			   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			   
	oneImage: .byte 0,0,0,0,0
			0,0,1,0,0
			0,0,1,0,0
			0,0,1,0,0
			0,0,1,0,0
			0,0,1,0,0
			0,0,0,0,0
			
	twoImage: .byte 0,0,0,0,0
  			 0,1,1,1,0 
  			 0,0,0,1,0
			 0,1,1,1,0
			 0,1,0,0,0
 			 0,1,1,1,0
 			 0,0,0,0,0
 			 
 	threeImage: .byte 0,0,0,0,0,
			 0,1,1,1,0,
			 0,0,0,1,0,
			 0,0,1,1,0,
 			 0,0,0,1,0,
 			 0,1,1,1,0,
 			 0,0,0,0,0
 	
 	fourImage: .byte 0,0,0,0,0,
 			 0,1,0,1,0,
 			 0,1,0,1,0,
			 0,1,1,1,0,
			 0,0,0,1,0,
 			 0,0,0,1,0,
 			 0,0,0,0,0
 		 
  	fiveImage: .byte 0,0,0,0,0, 
 			0,1,1,1,0,
 			0,1,0,0,0,
 			0,1,1,1,0,
 			0,0,0,1,0, 
 			0,1,1,1,0,
 			0,0,0,0,0
 
 	sixImage: .byte 0,0,0,0,0,
 			0,1,1,1,0,
 			0,1,0,0,0,
 			0,1,1,1,0,
 			0,1,0,1,0,
 			 0,1,1,1,0,
  			0,0,0,0,0
  
  	sevenImage: .byte 0,0,0,0,0,
 			  0,1,1,1,0,
 			  0,0,0,1,0,
			  0,0,0,1,0,
			  0,0,0,1,0,
 			  0,0,0,1,0,
			  0,0,0,0,0
 
 	eightImage: .byte 0,0,0,0,0,
			  0,1,1,1,0,
			  0,1,0,1,0,
			  0,1,1,1,0,
			  0,1,0,1,0,
  			  0,1,1,1,0,
			  0,0,0,0,0

	nineImage: .byte 0,0,0,0,0,
			 0,1,1,1,0,
			 0,1,0,1,0,
  			 0,1,1,1,0,
 			 0,0,0,1,0,
			 0,0,0,1,0,
			 0,0,0,0,0

	zeroImage: .byte 0,0,0,0,0,
 			0,1,1,1,0,
			0,1,0,1,0,
 			0,1,0,1,0,
 			0,1,0,1,0,
 			0,1,1,1,0,
			0,0,0,0,0
			
	displayAddress: .word 0x10008000
	keyboardAddress: .word 0xffff0000
	keys: .word 0xffff0004
	scoreBoardHeight: .word 20
	screenHeight: .word 43 
	screenWidth: .word 32
	platSpacing: .word 5
	platStart: .word 0
	platLength: .word 8
	numPlatforms: .word 1
	currPlatY: .word 63 
	currPlatX: .word 13
	zeroConst: .word 0
	currScore: .word 0
	topScreen: .word 20
	amountToMoveLeftRight: .word 0
	scoreNumX: .word 27
	scoreNumY: .word 12
	currScoreX: .word 27
	nextScoreX: .word 27
	currScoreY: .word 12
	maxHeightReached: .word 0
	currentHeight: .word 0
	
	# amount background has moved down instead of doodler moving up. If this hits the random platSpacing, then 
	# we will set this value back to 0, and draw a platform on the top row of screen
	screenMoveDown: .word 0
	jumpHeight: .word 14
	currHeight: .word 0
	threshold: .word 44#44 # half the height of screen not including scoreboard
	
	moveUp: .word 1 # this tells me if it is time to move down -- 0 No, 1 Yes
	moveDown: .word 0 # this tells me if it is time to move up -- 0 No, 1 Yes
	moveScreen: .word 0
	
	# so we have 32 "pixels" per row. each "pixel" is a color and is 4 bytes. Move 128 bytes to get first element on second row.
	# so we have a total of 32 rows. Therefore we have 32*4 to get to the first element of next row. We have 32*31 + 124 to get to the
	# last element in our display given size of 256 x 256
	skyColor: .word 0xfffdd0
	doodlerColor: .word 0xf00cff
	platformColor: .word 0x00ff00
	scoreBackground: .word 0xbcffff
	scoreColor: .word 0x000000
	startScreenBackground: .word 0x3638f0
	startScreenColor: .word 0xf9ff71
	borderColor: .word 0xffe7bc
	endBackground: .word 0x3638f0
	endColor: .word 0xf9ff71
	
	offset: .word 0
	offsetY: .word 20
	offsetX: .word 0
	numPixelsDisplay: .word 0 # this is number of pixels until end of display
	numPixelsScoreBoard: .word 0
	storage: .word 0:2048 # create the array to store the background and sky at any time --
				     # it also stores an extra 10 rows for easier spawning. This means the displayStorage starts at 320 pixe
	
	displayStorage: .word 0:2048 # this is the second storage for the display. We draw the background storage and then doodler on this
	# the idea is that we can update the doodler after updating the screen from this array
	# -- so when redrawing we, 1. update the background and sky, using the updated values in this sotrage display
	# 				2. we then draw the doodler directly to the display
	
	# this is to store the background. All update to background will be made here then moved to the storageDisplay
	# where we will then drw the doodler to that storageDisplay and then draw to the actual display
	# storageBackground: .word 0:1024
	
	ycoordDoodlerInit: .word 59, 60, 60, 60, 61, 61 # array for doodler pixels and their x coordinates
	xcoordDoodlerInit: .word 16, 15, 16, 17, 15, 17 # array for doodler pixels and their y coordinates; equal order as x array
	
	# for the initial safe platform
	safePlatformy: .word 62 
	safePlatformx: .word 13
	
	
	ycoordDoodlerCurr: .word 59, 60, 60, 60, 61, 61
	xcoordDoodlerCurr: .word 16, 15, 16, 17, 15, 17

.text

# originally made for the 32x32 pixel version. since I have increased height of display, add some borders
startScreenInit:
	jal drawStartScreen
	loopUntilStart:
		lw $t8, keyboardAddress # check for an input
		lw $t8, 0($t8)
		beq $t8, 1, wasStartPressed
		j loopUntilStart
	wasStartPressed:
		lw $t2, keys # check the value at this address
		lw $t2, 0($t2)
		beq $t2, 0x73, initVars # if we hit "s", then we initialize the game
		j loopUntilStart # otherwise keep looping


drawStartScreen:
	lw $t0, displayAddress # we will draw straight to display
	la $t1, startScreen # load array for startscreen
	li $t2, 1024 # number pixels to draw. We need an offset for the startscreen
	li $t3, 512 # number of pixel to draw before drawing the start screen
	lw $t4, borderColor
	lw $t5, startScreenBackground
	lw $t6, startScreenColor
	drawTopBorder:
		beq $t3, 0, nextDraw
		sw $t4, 0($t0)
		addi $t0, $t0, 4
		addi $t3, $t3, -1
		j drawTopBorder
	
	nextDraw:
		beq $t2, 0, drawBottomBorder
		lb $t7, 0($t1)
		beq $t7, 0, drawTheBackground
		beq $t7, 1, drawTheTitle
		continueStartScreen:
			addi $t1, $t1, 1 # move to next element in startScreen
			addi $t0, $t0, 4 # move to next pixel in display
			addi $t2, $t2, -1
			j nextDraw
			
	drawTheBackground:
		sw $t5, 0($t0)
		j continueStartScreen
	drawTheTitle:
		sw $t6, 0($t0)
		j continueStartScreen
	drawBottomBorder:
		beq $t3, 512, leave
		sw $t4, 0($t0)
		addi $t0, $t0, 4
		addi $t3, $t3, 1
		j drawBottomBorder
	leave:
		jr $ra

# initialize variables first, then drawScoreInit, then jump to draw the background init
		
drawScoreInit:
	# paint the top of the screen portion light blue
	# then initialize the score stuff.
	
	jal drawScore
	j initBackground

updateScore:
	# draw black before updating the score -- i.e. redrawing the new stuff
	la $t0, storage
	lw $t1, scoreBackground
	lw $t4, numPixelsScoreBoard
	add $t2, $zero, $t4 # num pixels scoreboard stored in $s3
	looop:
		beq $t2, 0, donee
		sw $t1, 0($t0)
		addi $t0, $t0, 4
		addi $t2, $t2, -1
		j looop
	donee:
		la $s5, 0($ra)
		jal drawScore
		la $ra, 0($s5)
		jr $ra
	
		
# $s1 contains the offset
# $s2 contains number of pixel for the display
# $s3 contains number of pixels for the scoreBoard
# $s4 contains the topScreen
# these are set up during the initSteps

initVars:
	li $t8, 6
	la $t7, ycoordDoodlerCurr
	la $t6, xcoordDoodlerCurr
	la $t5, ycoordDoodlerInit
	la $t4, xcoordDoodlerInit
	initDoodlerCoord:
		beq $t8, 0, restInit
		lw $t3, 0($t5)
		lw $t2, 0($t4)
		sw $t3, 0($t7)
		sw $t2, 0($t6)
		addi $t7, $t7, 4
		addi $t6, $t6, 4
		addi $t5, $t5, 4
		addi $t4, $t4, 4
		addi $t8, $t8, -1
		j initDoodlerCoord
	
	restInit:
		lw $a1, offsetX
		lw $a2, offsetY
		jal convCoordAddr
		sw $v1, offset # this is the number of pixel we traverse before we start drawing our actual display
	
		# now we can increment our storage 
		lw $t1, screenHeight
		lw $t2, screenWidth
		mul $t3, $t1, $t2 # total number of pixels for the Display
		sw $t3, numPixelsDisplay
	
		lw $t1, scoreBoardHeight
		lw $t2, screenWidth
		mul $t3, $t1, $t2
		sw $t3, numPixelsScoreBoard
	
		lw $s4, topScreen 
	
		# set all the data back to original values
		addi $t6, $zero, 5
		sw $t6, platSpacing
		addi $t6, $zero, 0
		sw $t6, platStart
		sw $t6, currHeight
		sw $t6, moveDown
		sw $t6, amountToMoveLeftRight
		sw $t6, maxHeightReached
		sw $t6, currentHeight
		sw $t6, currScore
		addi $t6, $zero, 27
		sw $t6, scoreNumX
		sw $t6, currScoreX
		sw $t6, nextScoreX
		addi $t6, $zero, 12
		sw $t6, scoreNumY
		sw $t6, currScoreY
		addi $t6, $zero, 1
		sw $t6, numPlatforms
		sw $t6, moveUp
		addi $t6, $zero, 8
		sw $t6, platLength
		addi $t6, $zero, 63
		sw $t6, currPlatY
		addi $t6, $zero, 13
		sw $t6, currPlatX
		j drawScoreInit
		
	
initBackground:
	la $t0, storage # load start address of array for storage -- this is how we update background independent from doodler
	
	lw $s1, offset # this is how many pixel we need to move before we can start drawing the game and not the scoreboard
	#lw $t0, displayAddress # load start address of bitmap display
	add, $t0, $t0, $s1 # apply the offset
	lw $t1, skyColor # load sky color to use
	li $t2, 0 # initialize counter for loop
	lw $s2, numPixelsDisplay # store for number of pixels of entire non-scorboard region
	drawSkyInit:
		beq $t2, $s2, drawSafeStartStorage # exit condition when whole screen is drawn
		sw $t1, 0($t0)	# load the colour in $t1 into the first memory in $t0 
		#sw $t1, 0($t3) # load into the bitmap display as well
		addi $t0, $t0, 4 # increment memory location by 4 bytes or 32 bits
		#addiu $t3, $t3, 4 # do the same for the bitmap display
		addi $t2, $t2, 1 # increment loop counter
		j drawSkyInit
		
		
# this draws the one platform that is always in the beginning to allow for a safe start	
drawSafeStartStorage:
	la $t0, storage
	#add $t0, $t0, $s1 # add the offset in $s1
	# lw $t1, displayAddress
	addiu $a1, $zero, 13 # x-coord start platform
	addiu $a2, $zero, 62 # y-coord start platform
	jal convCoordAddr
	add $t0, $t0, $v1
	#addu $t1, $t1, $v1
	li $t3, 0  # counter for how many pixels to draw -- good for platforms and the sky
	lw $t2, platformColor
	drawSafePlat:
		
		beq $t3, 7, drawRandomInitPlatforms
		sw $t2, 0($t0) # store in the storage
		#sw $t2, 0($t1) # store in the bitmap
		addiu $t0, $t0, 4
		#addiu $t1, $t1, 4
		addiu $t3, $t3, 1
		j drawSafePlat

# we need to figure out how to do many platforms later after milestone 4
drawRandomInitPlatforms:
	# let us try to draw 20 platforms to start
	li $t5, 9
	drawPlats:
		beq $t5, 0, drawDoodlerFlowThrough
		jal drawOneRandomPlatform # draws a random platform above the single platform below 
		addi $t5, $t5, -1
		j drawPlats
		
# this draws random platform only for top row of screen when screen moves down
drawOneRandomPlatformTop:
	la $t9, 0($ra)
	lw $t4, platSpacing
	lw $t3, currPlatY # this supposedly gives me the current y-coord on top platform
	sub $t5, $t3, $t4
	# now if the substraction is equal
	lw $t4, topScreen
	beq $t5, $t4, drawRanPlat
	jr $ra

drawRanPlat:
	jal getRandomPlatformX # get the x coordinates
	lw $a1, platStart # get the x value
	lw $a2, topScreen # get the y-coord
	sw $a2, currPlatY # store it here
	jal convCoordAddr # convert coordinate to address
	la $t0, storage # load the storage address
	add $t0, $t0, $v1 # add the return value to traverse to start point of platform
	jal getRandomPlatLength # how many pixels to draw
	lw $t4, platLength # store how many pixels to draw temporarily for loop
	lw $t2, zeroConst
	lw $t1, platformColor
	loopPlat:
		beq $t2, $t4, doneDrawingPlat
		sw $t1, 0($t0) # draw to storage
		addi $t0, $t0, 4
		addi $t2, $t2, 1
		j loopPlat
		
# this will draw random platforms in the top 10 pixel rows in the storage that are not on the display -- actually we only draw one row (top row)
# and if and only if the screen has moved down the spacing value, then we will reset the screen move down to 0 and set the spacing to a new 
# random number
drawOneRandomPlatform:
	la $t9, 0($ra) # store where I came from
	lw $t4, platSpacing
	lw $t3, currPlatY # get the previous platform
	#lw $t5, currPlatY # another way to keep track without changing the height of currPlatY... since when screen moves this updates
	lw $t2, zeroConst 
	
	# perform a check to see if we can even draw the platform, if not, then ...
	# if the difference in coordinates (from top) are less than 0, i.e. -1 since 1 pixel motion for now, then can't draw
	# when the screen moves down, we will update the currplatform Y-coord so that we can know when it is next to draw given a 
	# certain random spacing 
	check:
		beq $t3, $s4, nextcheck # $s4 is the new top of Scren y-value
		beq $t2, $t4, canDraw # if 0 and $t4 not 0
		addi $t3, $t3, -1 # get the next y-coordinate given spacing, but if we hit 0, then branch
		sw $t3, currPlatY # update variable
		#addi $t3, $t3, -1
		addi $t2, $t2, 1
		j check
	
	nextcheck:
		beq $t4, $t2, canDraw
		bne $t4, $t2, cantDrawPlat		

	canDraw:
		jal getRandomPlatformX # get the x coordinates
		lw $a1, platStart # get the x value
		lw $a2, currPlatY # get the y-coord
		#move $a2, $t3
		jal convCoordAddr # convert coordinate to address
		la $t0, storage # load the storage address
		add $t0, $t0, $v1 # add the return value to traverse to start point of platform
		jal getRandomPlatLength # how many pixels to draw
		lw $t4, platLength # store how many pixels to draw temporarily for loop
		lw $t2, zeroConst
		lw $t1, platformColor
		loopPlat3:
			beq $t2, $t4, doneDrawingPlat
			sw $t1, 0($t0) # draw to storage
			addi $t0, $t0, 4
			addi $t2, $t2, 1
			j loopPlat3
	cantDrawPlat:
		j couldNotDrawPlat

couldNotDrawPlat:
	la $ra, 0($t9) # load the address back to go where I originally came from
	jr $ra

# go back to original address
doneDrawingPlat:
	jal getRandomPlatformSpacing # this is how many Y units above the previous platform it should be
	la $ra, 0($t9) # load the address back to go where I originally came from
	jr $ra
	
drawDoodlerFlowThrough:
	# this is for the initializer
	jal drawDoodler
	j main

drawDoodler:
	# la $t0, storageDisplay -- don't do this for doodler
	li $t2, 6 # loop counter, we want 6 times for number of pixels for doodler
	la $t3, xcoordDoodlerCurr # x-coord of one pixel
	la $t4, ycoordDoodlerCurr # y-coord of same one pixel
	# need to store the $ra somewhere else for now
	la $t9, 0($ra)
	lw $t5, doodlerColor
	loop:
		beq $t2, $zero, back # if we hit zero, then have drawn 8 pixels
		la $t0, displayStorage # load first bitmap address
		lw $a2, 0($t4) # load first y-coord into $a2
		lw $a1, 0($t3) # load first x-coord into $a1
		jal convCoordAddr # converte the (x, y) into address location
		add $t0, $t0, $v1 # traverse to spot where the bit should be on bitmap display
		sw $t5, 0($t0) # store color at spot
		
		addi $t3, $t3, 4 # go to next array element/ x coordinate
		addi $t4, $t4, 4 # go to next array element/ y coordinate		
		addi $t2, $t2, -1 # subtract one each time
		j loop
	back:	
		la $ra, 0($t9)
		jr $ra	
	

# we need to update the doodler position
updateDoodlerUpDown:
	# if the moveUp is 1 then we move Up -- however, if the 
	# if the moveDown is 1 then we move down
	la $s7, 0($ra)
	lw $t4, moveUp 
	lw $t5, moveDown
	beq $t4, 1, updateDoodlerUp
	beq $t5, 1, updateDoodlerDown	

updateDoodlerDown:
	# for this we get the y-coordinates of doodler and just move them down one. But first
	# we must check Collision with platform. In otherwords, calculate the new coordinates of the bottom of the doodler.
	# get the address in the storage + offset (add offset later for scoreboard region)
	# if the value in storage is equal to the platformColor, then we have collision. If collision, set moveUp to 1, moveDown to 0 and
	# set the currHeight to 0. 
	
	la $t1, ycoordDoodlerCurr # load the y-coordinates for each pixel of doodler
	la $t2, xcoordDoodlerCurr # load the x-coordinates for each pixel of doodler (needed for collision check)
	addi $t1, $t1, 16 # move to the legs portion of doodler
	addi $t2, $t2, 16 # move to the legs portion of doodler
	
	# perform a collision check with platform below. If we are going to move down 1, if the next pixel is a platform
	# then there is a collision and we should immediately switch the variables for moveUp and moveDown, and jump
	# to move the doodler up One instead, since on this cycle, we would have gone down, but we can't so instead, we go up one
	li $t4, 0
	collisionPlatform:
		beq $t4, 2, canMoveDown 
		# we check the bottommost pixels
		lw $a2, 0($t1) # get the y-coord 
		lw $a1, 0($t2) # get the x-coord
		addi $a2, $a2, 1 # get next y-coord.
		# we don't have a platform below, so check for bottom of screen (i.e. the next coordinate will be bottom of screen)
		beq $a2, 63, bottomScreenCollision
		
		jal convCoordAddr # get the address of storage
		la $t0, storage
		add $t0, $t0, $v1 # move to spot in storage
		# check to see if we have a platform. if we don't, then check to see if we are at bottom of screen 
		# (i.e. the next pixel is below the allowed screen space)
		lw $t3, platformColor
		lw $t5, 0($t0)
		beq $t5, $t3, weHavePlatform
		
		# we are not in bottom of screen, so clear to lower the entire doodler by 1 pixel
		
		# go to next set of coordinates for the legs, since this is what will determine if we can jump
		addi $t1, $t1, 4 
		addi $t2, $t2, 4 
		addi $t4, $t4, 1
		j collisionPlatform

	weHavePlatform:
		
		#set moveup to one, move down to 0, currHeight to 0 and 
		sw $zero, currHeight # set back to zero for new jump
		addi $t5, $zero, 1
		sw $t5, moveUp # make it so we will immediately move up
		sw $zero, moveDown # make it so we are no longer moving down
		# now immediatly jump to the updateDoodler
		j updateDoodlerUp # we can jump directly here for now, maybe better to jump to updateDoodler
	
	bottomScreenCollision:
		# we just need to jump to a game over screen
		j gameOverScreenInit
	
	canMoveDown:
		li $t2, 6 # number of pixels to update
		la $t1, ycoordDoodlerCurr # load the y-coordinates for each pixel of doodler
		moveDoodlerDownOne:
			beq $t2, 0, doneUpdatingDoodlerDown# if we are done incrmeenting all pixels by 1, then we finish
			lw $t3, 0($t1) # get the current y-value
			addi $t3, $t3, 1 # increment by 1
			sw $t3, 0($t1) # store the new value
			addi $t2, $t2, -1 # decrement by 1 for counter
			addi $t1, $t1, 4 # go to next y coordinate
			j moveDoodlerDownOne

doneUpdatingDoodlerDown:
	# set currentHeight to be one less, since we moved down
	lw $t6, currentHeight
	addi $t6, $t6, -1
	sw $t6, currentHeight
	la $ra, 0($s7)
	jr $ra
	

# ##### --3#### !!!!!!!!!!! We need to set the currHeight. increment. If it hits max height, then start moving down
updateDoodlerUp:
	# if the doodler position is halfway point of screen (i.e. its top most pixel) then move screen down instead
	
	# for now just move the position up 1 pixel
	la $t1, ycoordDoodlerCurr # load the y-coordinates for each pixel of doodler
	
	# if the first coordinate is equal to 16 (i.e. half the screen), then instead, move screen down 1 pixel
	lw $t3, 0($t1) # get the current y-value
	lw $t2, threshold # load in the threshold for screenMoving
	beq $t3, $t2, moveScreenDownOne
	
	li $t2, 6 # number of pixels to update
	moveDoodlerUpOne:
		beq $t2, 0, doneUpdatingDoodlerUp
		lw $t3, 0($t1) # get the current y-value
		addi $t3, $t3, -1 # move up one by decrementing y by one
		sw $t3, 0($t1) # store the new value
		addi $t2, $t2, -1 # decrement by 1 for counter
		addi $t1, $t1, 4 # go to next y coordinate
		j moveDoodlerUpOne

	needToMoveScreenDownOne:
		# set moveScreen to 1
		addi $t7, $zero, 1
		sw $t7, moveScreen # now we know we need to move the screen
		
		jr $ra


moveScreenDownOne:
	#lw $t6, moveScreen
	#beq $t6, 0, dontMoveScreen
	# take all elements in the storage and move down 1 pixel (from a given offset when we add the scoreboard)
	la $t1, storage # load storage array
	#add $t1, $t1, $s1 # load in the offset -- offset already in $s1 -- go to start of display
	
	# get number of bits to last pixel in the second last row. Get number of bits to last pixel
	li $a1, 31
	li $a2, 61
	jal convCoordAddr
	add $t2, $t1, $v1 # this should take me to the last address of the second last row 
	#addi $t2, $t1, 7932
	
	li $a1, 31
	li $a2, 62
	jal convCoordAddr
	add $t1, $t1, $v1 # this should take me to the last address in my display not including scoreboard
	#addi $t1, $t1, 8060
	
	#addi $t1, $t1, 3964 # go to end of second last row of storage array (3964)
	#addi $t2, $t1, $s2 # go to last element of storage using $s2 which stores numPixelsDisplay -- or can load directly from label
	# now loop from end to top, moving everything by 128 bytes (down one row)
	add $t3, $zero, $s2 # number of pixels to move + 32
	addi $t3, $t3, -32 # subtract 32 pixels for one row
	#li $t3, 1344
	loopScreen:
		beq $t3, 0, drawFirstRow
		lw $t4, 0($t2)
		sw $t4, 0($t1)
		addi $t1, $t1, -4 # go to the next address
		addi $t2, $t2, -4 # go to the next address
		addi $t3, $t3, -1 # decrement counter by 1
		j loopScreen
	
	# we should draw the background color, as well as try to draw a random platform if we can

	drawFirstRow:
		la $t1, storage
		add $t1, $t1, $s1 # add the offset
		lw $t2, skyColor
		# draw to storage in first row
		li $t3, 32
		rowLoop:
			beq $t3, 0, spawnPlatform
			sw $t2, 0($t1)
			addi $t1, $t1, 4 # go to next address
			addi $t3, $t3, -1 # decrement
			j rowLoop
	
		spawnPlatform:
			# now increment the currPlatY by 1 (topmost platform by 1) and try to draw random platform
			lw $t2, currPlatY
			addi $t2, $t2, 1
			sw $t2, currPlatY
			jal drawOneRandomPlatformTop # either we did or did not draw a platform
			j doneUpdatingDoodlerUp	
		

doneUpdatingDoodlerUp:
	lw $t6, currentHeight
	addi $t6, $t6, 1
	sw $t6, currentHeight
	
	# if the current height is greater than the maxHeight, then the new maxHeight
	# equals the currentHeight, and we will increase the score by one
	lw $t7, maxHeightReached
	addi $t8, $t6, -1
	beq $t7, $t8, setScore
	bne $t7, $t8, pass
	setScore:
		# update score since new maxHeight reached
		lw $t2, currScore
		addi $t2, $t2, 1
		sw $t2, currScore
		# set new max height
		sw $t6, maxHeightReached
	pass:
		# now set the currHeight to one more than before since we moved up
		lw $t2, currHeight
		addi $t2, $t2, 1
		sw $t2, currHeight
		# check to see if the currHeight is equal to jumpHeight, if so then set moveUp to 0 and moveDown to 1
		lw $t3, jumpHeight
		beq $t3, $t2, switchDirections
		# if we are here then they are not equal, so we are still moving up. So the only thing we do is go back to where we can from
		la $ra, 0($s7)
		jr $ra #-- need to set $ra properly
	
		# can make this more global by having a swapping set of instruction. Just load both value, then swap both values and store
		switchDirections:
			sw $zero, currHeight # set back to zero
			sw $zero, moveUp # make it so we don't move up anymore
			addi $t2, $zero, 1
			sw $t2, moveDown # make it so we now are moving down on next update
			# now we can go back to where we came from
			la $ra, 0($s7)
			jr $ra


updateDoodlerLeftRight:
	# get the doodler x coordinates and move them over by 1 pixel right
	la $s7, 0($ra)
	la $t5, xcoordDoodlerCurr
	li $t6, 6
	moveRight:
		beq $t6, 0, doneUpdatingLeftRight
		lw $t4, 0($t5)
		lw $t9, amountToMoveLeftRight 
		add $a1, $t4, $t9
		# now check to see if we need to screen wrap
		jal screenWrap
		sw $v1, 0($t5)
		addi $t5, $t5, 4
		addi $t6, $t6, -1
		j moveRight	
	doneUpdatingLeftRight:
		# just return back
		la $ra, 0($s7)
		jr $ra	
		
# if the x-ccord is equal to 32, then we set it to 0, if the x-coord is equal to -1, then set to 31
screenWrap:
	beq $a1, 32, setZero
	beq $a1, -1, setThirtyOne
	# else
	add $v1, $a1, $zero # just return the original value no screen wrapping
	jr $ra
	setZero:
		li $t8, 0
		add $v1, $t8, $zero
		jr $ra
	setThirtyOne:
		li $t8, 31
		add $v1, $t8, $zero
		jr $ra

# here is where we have our main loop of action
# 1. check keyboard input
# 2. update x and y coordinates for the doodler (in array for doodler) and the background in storageDisplay
# 3. redraw the screen by drawing the storage and the doodler
# 4. Sleep
# 5. Repeat --- move this loop to the top

# note that when drawing the storage, if the doodler is above a certain coordinate (we can figure this out when updating the doodler position)
# then we immediately call a procedure to shift the screen down N rows, and then redraw to storage the new N rows at the top
main:
	
	# 1. Check for all possible keyboard inputs
	lw $t8, keyboardAddress # check for an input
	lw $t8, 0($t8)
	beq $t8, 1, keyboardInput
	
	afterKeyInputAndUpdates:
		jal updateScore # this will update the score and draw it in storage
		jal updateDisplayStorage # this will take everything in the storage, and copy it over to displayStorage
		jal drawDoodler # this will draw the doodler on the display storage
	
	# maybe draw first to get initial thing, then update and draw at the start of a cycle
	# drawBackground
	jal drawToDisplay # take everything from displayStorage and move to display
	
	
	# pause
	jal Pause
	
	jal updateDoodlerUpDown # this will update the up and down motion, but also draw the updated background screen to the storage
		
	
	j main	
	
keyboardInput:
	lw $t2, keys # load in the value that was pressed
	lw $t2, 0($t2)
	beq $t2, 0x6a, updateDoodlerLeft # if we hit "j", then we need to move left -- 1 pixel movement 
	beq $t2, 0x6b, updateDoodlerRight # if we hit "k" then we need to move right -- 1 pixel movement
	
	updateDoodlerLeft:
		addi $t6, $zero, -1
		sw $t6, amountToMoveLeftRight
		jal updateDoodlerLeftRight
		j continue1
	
	updateDoodlerRight:
		addi $t6, $zero, 1
		sw $t6, amountToMoveLeftRight
		jal updateDoodlerLeftRight
		j continue1
	continue1:
		j afterKeyInputAndUpdates



updateDisplayStorage:
	la $s7, 0($ra)
	jal drawToDisplayStorage
	la $ra, 0($s7)
	jr $ra	
	
	
# random x location for start of platform
getRandomPlatformX:
	li $v0, 42
	li $a1, 24
	syscall
	sw $a0, platStart
	jr $ra

# random spacing between 3-7 spaces apart -- use this to calculate --- don't use as yet -- keep constant
getRandomPlatformSpacing:
	li $v0, 42
	li $a1, 2
	syscall
	addi $a0, $a0, 5
	sw $a0, platSpacing
	jr $ra

getRandomPlatLength:
	li $v0, 42
	li $a1, 4
	syscall
	addi $a0, $a0, 4
	sw $a0, platLength
	jr $ra

getRandomNumPlatforms:
	li $v0, 42
	li $a1, 1
	syscall
	addi $a0, $a0, 1
	sw $a0, numPlatforms
	jr $ra


# we take in an x and a y integer and convert it to a single address
# 128*y + 4*x --- x and y are in range [0, 31] and integer value
convCoordAddr: 
	#lw $v1, screenWidth # screen width 
	#mul $v1, $v1, $a2 # multiply by y position to get total number of pixel to get to certain row
	#add $v1, $v1, $a1 # add x to get total number of pixel to get to certain column given certain row
	#mul $v1, $v1, 4 # multiply result by 4
	#add $v1, $v1, $gp # add the bitmap display start
	mul $a2, $a2, 128 # $a2 should store y
	mul $a1, $a1, 4 # $a1 should store x
	addu $v1, $a1, $a2 # now we add them to give us the coordinate value
	jr $ra


drawToDisplayStorage:
	la $t1, storage
	la $t2, displayStorage
	li $t3, 0
	drawloop1:
		beq $t3, 2048, goBack1
		lw $t4, 0($t1)
		sw $t4, 0($t2)
		addi $t1, $t1, 4
		addi $t2, $t2, 4
		addi $t3, $t3, 1 # increment counter
		j drawloop1
	goBack1:
		jr $ra
	

drawToDisplay:
	la $t1, displayStorage
	#addi $t1, 320
	lw $t2, displayAddress
	li $t3, 0 # this counts which pixel value we are on
	drawloop:
		beq $t3, 2048, goBack
		lw $t4, 0($t1)
		sw $t4, 0($t2)
		addi $t1, $t1, 4
		addi $t2, $t2, 4
		addi $t3, $t3, 1 # increment counter
		j drawloop

	goBack:
		
		jr $ra

# we need to draw this to the first storage
drawScore:
		la $s6, 0($ra)
		# load score address
		la $t0, scoreImage
		la $t5, storage
		
		#load the displayScreen
		la $t1, storage
		
		# now loop for each row of the scoreImage
		li $t2, 19 # we need 19 pixels per row
		li $t6, 190 # total of 190 pixels
		loopScore:	
			beq $t6, 0, updateScoreToScreen
			beq $t2, 0, jumpNextRow
			# get value from image
			lb $t3, 0($t0)
			# if the result is zero, draw background, otherwise draw color
			
			beq $t3, 0, drawScoreB
			beq $t3, 1, drawScoreC
			continue:
			# increment to next diaplay address and value in the image
				addi $t0, $t0, 1 # move over one byte
				addi $t1, $t1, 4 # move over 4 bytes to next pixel
				addi $t2, $t2, -1 # decrement
				addi $t6, $t6, -1
				j loopScore
		
		jumpNextRow:
			# increment address by 128 and load back into $t0
			addi $t1, $t1, 52 # start of next row
			#lw $t1, 0($t5) # start the iteration from this next row
			
			# increment to the next byte in image
			# addi $t0, $t0, 1
			# reload $t2 back to 19
			li $t2, 19
			j loopScore # back to loop
		
		
	
	
	drawScoreB:
		lw $t7, scoreBackground
		sw $t7, 0($t1)
		j continue
	drawScoreC:
	
		lw $t7, scoreColor
		sw $t7, 0($t1)
		j continue

# this is just the euclidean algorithm kind of
# we just use the div command and in the Hi register we remainder
# in the LO register we get the quotient. We always divide by 10, to get each
# digit of score
updateScoreToScreen:
	# load the current score value after doodler has been updated
	# -- actually take in score as argument
	lw $t1, currScore
	beq $t1, 9999999, cantUpdateScore
	li $t2, 10

	# divide this number by 10
	remainder:
		div $t1, $t2
	
		mfhi $t3
		mflo $t1
		jal drawRemainder
		# now access the LO register for the quotient
		
		beq $t1, 0, doneUpdatingScore
		
		# set the scoreNumX to be 4 less than before
		lw $t8, scoreNumY
		sw $t8, currScoreY
		
		lw $t8, nextScoreX
		addi $t8, $t8, -4
		sw $t8, nextScoreX
		sw $t8, currScoreX
		j remainder
		
	cantUpdateScore:
		# we have reached max score, so stop updating it
		la $ra, 0($s6)
		jr $ra # -- or whatever gets us back to where we came f
	doneUpdatingScore:
		# reset stuff and go back
		lw $t1, scoreNumX
		lw $t2, scoreNumY
		sw $t1, currScoreX
		sw $t1, nextScoreX
		sw $t2, currScoreY
		la $ra, 0($s6)
		jr $ra

drawRemainder:
	la $t5, 0($ra)
	beq $t3, 0, drawZero
	beq $t3, 1, drawOne
	beq $t3, 2, drawTwo
	beq $t3, 3, drawThree
	beq $t3, 4, drawFour
	beq $t3, 5, drawFive
	beq $t3, 6, drawSix
	beq $t3, 7, drawSeven
	beq $t3, 8, drawEight
	beq $t3, 9, drawNine	

drawZero:
	la $a0, zeroImage
	j drawNumber
drawOne:
	la $a0, oneImage
	j drawNumber
drawTwo:
	la $a0, twoImage
	j drawNumber
drawThree:
	la $a0, threeImage
	j drawNumber
drawFour:
	la $a0, fourImage
	j drawNumber
drawFive:
	la $a0, fiveImage
	j drawNumber
drawSix:
	la $a0, sixImage
	j drawNumber
drawSeven:
	la $a0, sevenImage
	j drawNumber
drawEight:
	la $a0, eightImage
	j drawNumber
drawNine:
	la $a0, nineImage
	j drawNumber

drawNumber:
	# jump to the place in memory first by setting coordinates to draw
	# load address of array of picture
	
	
	#addiu $a1, $zero, 13 # x-coord start platform
	#addiu $a2, $zero, 31 # y-coord start platform

	li $t9, 5 # width of image number
	li $t8, 35

	zero:	
		lw $a1, currScoreX # x coordinate for current number
		lw $a2, currScoreY # y coordinate for current number 
		beq $t8, 0, done # we are done drawing the current number
		beq $t9, 0, downOne
		
		jal convCoordAddr
		# jump to the point in the display we want
		la $t0, storage
		add $t0, $t0, $v1

		# now draw the number at this pixel and increment the x
		lb $t4, 0($a0) # check first value in array for image
		beq $t4, 0, drawScoreBackground
		beq $t4, 1, drawScoreColor
		continueScore:
			# make increment changes to array for image, x-coord, and loop counter
			addi $a0, $a0, 1
			# addi $a1, $a1, 1
			lw $t4, currScoreX
			addi $t4, $t4, 1 #increment by 1 for x-coord
			sw $t4, currScoreX
			#lw $t6, scoreNumY
			addi $t9, $t9, -1
			addi $t8, $t8, -1
			j zero
	
	drawScoreBackground:
		lw $t7, scoreBackground
		sw $t7, 0($t0)
		j continueScore 
	drawScoreColor:
		lw $t7, scoreColor
		sw $t7, 0($t0)
		j continueScore
		
	
	downOne:
		# addi $a2, $a2, 1 # move down one row
		lw $t4, currScoreY
		addi $t4, $t4, 1
		sw $t4, currScoreY
		li $t9, 5 # set back to five
		lw $t4, nextScoreX # set the x back to what is was
		sw $t4, currScoreX # set back to original x
		j zero
	
	done:
		la $ra, 0($t5)
		jr $ra

gameOverScreenInit:
	lw $t0, displayAddress
	la $t1, gameOverScreen
	add $t0, $t0, $s1 # add the offset since I made game over screen for 32x32
	li $t2, 1024 # 32x32 pixels
	lw $t3, endBackground
	lw $t4, endColor
	drawEndScreen:
		beq $t2, 0, drawBottomPart
		lb $t5, 0($t1)
		beq $t5, 0, drawEndBackground
		beq $t5, 1, drawEndColor
		next10:
			addi $t0, $t0, 4
			addi $t1, $t1, 1
			addi $t2, $t2, -1
		j drawEndScreen
	drawEndBackground:
		sw $t3, 0($t0)
		j next10
	drawEndColor:
		sw $t4, 0($t0)
		j next10
		
	drawBottomPart:
		li $t2, 384
		lw $t3, borderColor
			loop30:
				beq $t2, 0, endLoop
				sw $t3, 0($t0)
				addi $t2, $t2, -1
				addi $t0, $t0, 4
				j loop30
	
	endLoop:
		lw $t8, keyboardAddress # check for an input
		lw $t8, 0($t8)
		beq $t8, 1, wasStartPressedAgain
		j endLoop
	wasStartPressedAgain:
		lw $t2, keys # check the value at this address
		lw $t2, 0($t2)
		beq $t2, 0x73, initVars # if we hit "s", then we initialize the game
		j endLoop # otherwise keep looping			
		
# this is for sleeping before loop
Pause:		
	li $v0, 32
	li $a0, 18 # 24
	syscall
	jr $ra
Exit:
	#jal drawToDisplayStorage
	#jal drawDoodler
	#jal drawToDisplay
	li $v0, 10
	syscall
	
