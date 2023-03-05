####################################################################################################################
#          Author: Brandon Cabatu										   #							
#          Red ID: 825130235											   #
#         Project: Bitmap Game - Maze Escape 									   #
# Completion Date: May 1, 2022                                                                                     #
#          NOTICE: THIS CODE IS THE PROPERTY OF BRANDON CABATU AND CAN NOT BE ALTERED OR CLAIMED AS OWN WITHOUT    #
#          EXPLICIT APPROVAL FROM THE AUTHOR								           #
####################################################################################################################

### DATA SEGMENT ###
.data

# bitmap display
framebuffer:		.space 0x00010000		# space is allocated for the bitmap display pixel addresses

# COLUMN INDICIES	      0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
map:			.word 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,6,6,6,6,6,1,1 # 0
			.word 1,0,0,0,2,0,0,0,1,0,0,0,0,0,0,0,5,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 1
			.word 1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,5,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 2
			.word 1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,5,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 3
			.word 1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,5,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 4
			.word 1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,1,0,0,0,0,0,0,0,1 # 5
			.word 1,0,0,1,0,1,0,0,1,0,0,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 6
			.word 1,0,1,1,3,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 7
			.word 1,0,0,0,0,1,1,1,1,0,3,0,0,0,0,0,1,1,0,0,0,1,1,1,1,1,1,1,0,0,0,1 # 8
			.word 1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 9
			.word 1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,0,1,0,1,1,0,0,0,0,0,0,0,1 # 10
			.word 1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 11
			.word 1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,0,1,1,0,1 # 12
			.word 1,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 13
			.word 1,0,0,0,1,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,1,1,1,1,0,0,0,1,1,1,1,1 # 14
			.word 1,0,0,0,1,3,0,0,1,0,0,0,3,1,0,0,1,0,0,0,0,0,3,1,0,0,0,0,0,0,0,1 # 15
			.word 1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 16
			.word 1,0,0,0,0,0,0,0,1,0,0,1,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 17
			.word 1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 18 
			.word 1,0,0,3,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,3,0,0,0,1,0,0,0,0,0,0,0,1 # 19
			.word 1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,3,1,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1 # 20 
			.word 1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 21
			.word 1,0,0,0,0,0,0,0,1,0,0,1,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1 # 22
			.word 1,1,1,1,1,0,0,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1 # 23
			.word 1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 24
			.word 1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 25
			.word 1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1 # 26
			.word 1,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,1,0,0,0,0,0,0,5,0,0,0,0,0,0,0,1 # 27
			.word 1,0,0,0,0,0,0,0,5,0,0,0,0,0,0,3,1,0,0,0,0,0,0,5,0,0,0,0,0,0,0,1 # 28
			.word 1,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,1,0,0,0,0,0,0,5,0,0,0,0,0,0,0,1 # 29
			.word 1,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,1,0,0,0,0,0,0,5,0,0,0,0,0,0,0,1 # 30
			.word 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 # 31
											      # ROW INDICES
# 2D array ABOVE contains the integer representation of all objects in the bitmap display
# map array determines what hex value to write into the corresponding bitmap display framebuffer addresses
# INTEGER KEY:
# 1 - wall
# 2 - character
# 3 - token
# 5 - door
# 6 - gate			
			

# bitmap objects
wall:			.word	0x009d9e9f	# hex value of wall (grey)
character:		.word	0x00006400	# hex value of character (green)
black:			.word	0x00000000	# hex value of background (black)
token:			.word   0x00ffd500	# hex value of token (yellow)
gate:			.word   0x00654321	# hex value of gate (brown)
door:			.word   0x005d5d5d	# hex value of door (dark grey)

# door events
door_to_open:		.word   0x00000001	# specified door to open when token_count reaches certain value

# counters
token_count:		.word	0x00000000	# character starts with no tokens collected
health_count:		.word   0x00000003	# character starts with 3 health points

# MMIO keyboard input	
key_control_address:	.word	0xffff0000	# address for keyboard data control
key_receiver_address:	.word   0xffff0004	# address for keyboard data receiver

# special characters
play:			.byte 'p'		# play game character
quit:			.byte 'q'		# quit game character

# characters
space:			.byte ' '  		# space
dash:			.byte '-'  		# dash
newline:		.byte '\n' 		# newline 

# MENU strings
title:			.asciiz "<(Maze Escape)>\n"
playgame:		.asciiz "Play Game [p]\n"
quitgame:		.asciiz "Quit Game [q]\n"
characterinput:		.asciiz "Press [p/q]: "

# GAME string
gameWon:		.asciiz "\n\n\n\n------------------\n|<<< You Won! >>>|\n------------------\n"

# display format
head:			.asciiz "\n\n\n\n\n\n######################"
health_s:	        .asciiz "HEALTH: "
tokens_s:		.asciiz "TOKENS: "
tail:			.asciiz "######################\n"

#-----------------------------------------------------------------------------------------------------------------------------#
### CODE SEGMENT ###
.text

#####################Format######################
#LABEL		#INSTRUCTION             #COMMENT

# begin main() driver function
# {

### MENU Segment ###
# $s0 reserved for: write to register (input)
# $s1 reserved for:    q  character
# $s2 reserved for:    p  character
#--------------------------------------------#
main:		li 	$s0, 0					# load 0 into $s0
		lb	$s1, quit				# load character p into $s1
		lb	$s2, play				# load 0 for $s2 input register
		jal 	printHeader				# prints the title of game to I/O screen with formatting
		jal	printOptions				# prints the menu options of game to I/O screen with formatting 
		
						
menu:		
		beq 	$s0, $s2, game 				# if 'p' is selected enter game loop 
		beq	$s0, $s1, terminate			# if 'q' is selected terminate program
								# if neither 'p' or 'q' then repeat execution of menu selection 
		li	$v0, 4					
		la	$a0, characterinput			
		syscall						# prints characterinput "Press [p/q]: "
		
		li 	$v0, 12							
		syscall                 			# reads character from standard input
		move 	$s0, $v0     				# relocates read character from $v0 to $s0
		
		li	$v0, 11
		lb	$a0, newline
		syscall						# prints newline
		
		
		j 	menu 					# end scope of while loop

### GAME Segment ###
# $s2 reserved for: framebuffer base address
# $s3 reserved for: map base address
# $s4 reserved for: control for printing static elements
# $s5 reserved for: x position of character [ROW]
# $s6 reserved for: y position of character [COLUMN]
# $s7 reserved for: control for stat display
#---------------------------------------------------------------#
 						 						
game:		la	$s2, framebuffer			# base address of bitmap display buffer for hex values
		la      $s3, map				# base address of 2D array that determines what hex value to write to framebuffer
		li	$s4, 0					# deterimines whether static elements have already been drawn
		li	$s5, 1					# 2D array ROW position of character
		li	$s6, 4 				        # 2D array Column position of character
		li	$s7, 0					# determines whether stat display has been printed to I/O one time
		
gameLoop:	
		move	$a0, $s2				# first argument is framebuffer base address
		move	$a1, $s3				# second argument is 2D map base address
		move	$a2, $s4				# third argument is static element drawn checker
		jal	draw					# call draw() function
		
		move	$a0, $s3				# first argument is 2D map base address 
		move	$a1, $s5				# second argument is ROW position of character
		move	$a2, $s6				# third argument is COLUMN position of character
		addi	$a3, $zero, 32				# fourth argument is number of COLUMNS per ROW
		jal	logic					# call logic() function
		move	$s5, $v0				# ROW INDEX = return value $v0
		move	$s6, $v1				# COLUMN INDEX = return value $v1
		
		beq	$s4, 1, static_elements_done		# if $s4 == 0 the static elements have just been drawn and need not be redrawn
		addi	$s4, $s4, 1 				# increment static element draw control to 1 (all static elements drawn)
		static_elements_done:
		
		beq	$s7, 1, display_done			# if $s7 == 0 the display has just been written to the I/O and need not be reprinted
		jal	display_Stats				# call idsplay_Stats() function
		addi	$s7, $s7, 1				# increment display stats print control to 1 (display already printed)
		display_done:
		
		li	$v0, 32					# sleep 50ms - 20 frames per second 
		li	$a0, 50
		syscall
		
		j	gameLoop				# end game loop
		
terminate:	la	$a0, framebuffer			# loads base address of framebuffer into first argument of clear_Screen() function
		jal	clear_Screen				# sets all hex values in bitmap display buffer to 0x00000000 (black) 

		li 	$v0, 10
		syscall						# terminate program 
			
# }
# end main() driver function
#----------------------------------------------------------------
# child function 
# void printHeader() {
# 	prints the header including the title of game and formatting onto I/O
# }
printHeader:	li 	$v0, 11					# set service number to 11: print character
		li 	$t0, 0					# int i = 0
		li 	$t1, 10					# while i < 10
		
	headerSpace:	beq 	$t0, $t1, headerTitle		# for loop that prints out certain number of spaces specified above (10)
			lb 	$a0, space			
			syscall					# print space ' '
			addi 	$t0, $t0, 1			# ++i
			j 	headerSpace			
					
	headerTitle:	li 	$v0, 4				
			la 	$a0, title
			syscall					# print title string
		
			li 	$v0, 11				# set service number to 11: print character
			li 	$t0, 0				# int i = 0
			li 	$t1, 35				# while i < 10
		
	headerDash:	beq 	$t0, $t1, headerFinished	# for loop that prints out certain number of dashes specified above (35)
			lb 	$a0, dash	
			syscall					# print dash '-'
			addi 	$t0, $t0, 1			# ++i
			j 	headerDash
		
headerFinished:		lb 	$a0, newline			# print newline charcter '\n'
			syscall
			jr 	$ra				# jump back to caller function [main()]

# end printHeader() child function
#----------------------------------------------------------------
# child function 
# printOptions() {
# 	prints menu option on I/O
# }
printOptions:	li	$t2, 0					# determines which option title string to print
		
printOpFormat:	li	$v0, 11					# set service number to 11: print character
		li	$t0, 0					# int i = 0
		li	$t1, 11					# while i < 11
		
	optionSpace:	lb	$a0, space
			beq 	$t0, $t1, optionTitles		# for loop that prints out specified number of spaces specified above (11)
			syscall					# print space ' '
			addi	$t0, $t0, 1			# ++i
			j optionSpace		

	optionTitles:	li	$v0, 4				# set service number to 4: print string
			beq	$t2, 1, titletwo		# if control is 1 then skip to printing QUIT GAME string else print PLAY GAME string

		titleone:	la	$a0, playgame
				syscall				# print playgame string
				addi	$t2, $t2, 1		# set control to 1 so that quit game is print during second iteration of loop
				j printOpFormat
		
		titletwo:	la	$a0, quitgame
				syscall				# print quitgame string
				
				li	$v0, 11			
				li	$t0, 0
				li	$t1, 35
				lb	$a0, dash
				
		borderDash:	beq	$t0, $t1, options_Printed
				syscall					# print 35 dashes
				addi	$t0, $t0, 1
				j	borderDash
				
options_Printed:		lb	$a0, newline
				syscall					# print newline '\n'
				jr 	$ra			# jump back to caller function [main()]

# end printOptions() child function
#----------------------------------------------------------------
# child function
# void clear_Screen(int* framebuffer) {
#	sets all hex values in framebuffer to 0x00000000 black
#	makes bitmap display all black 
# }
clear_Screen:		li	$t0, 0				# i = 0
			move	$t1, $a0			# set $t1 to the base address of the bitmap display framebuffer

set_Black:		beq	$t0, 1024, screen_Cleared
			
			sw	$zero, 0($t1)			# set memory location to 0x00000000 in hex (black in RGB encoding)
			addi	$t1, $t1, 4
			addi	$t0, $t0, 1
			
			j	set_Black
			
screen_Cleared:		jr	$ra				# return to caller
#----------------------------------------------------------------
# child function
# void display_Stats() {
#	print strings corresponding to health points and token count
#	updates when token and/or enemey is encountered
# }
display_Stats:		lw	$t0, token_count
			lw	$t1, health_count
			
			li	$v0, 4
			la	$a0, head
			syscall					# print '#' top of display box
			
			li	$v0, 11
			lb	$a0, newline
			syscall					# print newline character '\n' 
			
			li	$v0, 4
			la	$a0, health_s
			syscall					# print health string label
			
			li	$v0, 1
			move	$a0, $t1
			syscall					# print health counter integer
			
			li	$v0, 11
			lb	$a0, newline
			syscall					# print newline character '\n'
			
			li	$v0, 4
			la	$a0, tokens_s
			syscall					# print token string label
			
			li	$v0, 1
			move	$a0, $t0
			syscall					# print token count 
			
			li	$v0, 11
			lb	$a0, newline
			syscall					# print newline character '\n'
			
			li	$v0, 4
			la	$a0, tail
			syscall					# print '#' bottom of box
			
			jr 	$ra				# return to caller
#----------------------------------------------------------------
# child function 
# void draw(int* framebuffer, int* map, int staticControl) {
#  	draw all objects in the game
#		call drawBlankSpace()
#		call drawCharacter()
#		if (staticControl != 1) {
#			call drawWalls()
#			call drawTokens()
#			call drawGates()
#			call drawDoors()
#		}
#
# }
draw:		addiu	$sp, $sp, -16				# push stack and allocate 4 memory spaces
		sw	$a0, 12($sp)				# store base address of framebuffer
		sw	$a1,  8($sp)				# store base address of 2D map
		sw	$a2,  4($sp)				# store static element control
		sw	$ra,  0($sp)				# store return address
		
		jal	drawBlankSpace				# call drawBlankSpace()
		
		lw	$a0, 12($sp)				
		lw	$a1,  8($sp)
		jal	drawCharacter				# call drawCharacter(base address of framebuffer, base address of 2D map)
		
		beq	$a2, 1, wallsdone			# if static element control is 1 then skip execution
		lw	$a0, 12($sp)
		lw	$a1,  8($sp)
		jal	drawWalls				# call drawWalls(base address of framebuffer, base address of 2D map)
		wallsdone:
		
		beq	$a2, 1, tokensdone			# if static element control is 1 then skip execution
		lw	$a0, 12($sp)
		lw	$a1,  8($sp)
		jal	drawTokens				# call drawTokens(base address of framebuffer, base address of 2D map)
		tokensdone:
		
		beq	$a2, 1, gatesdone			# if static element control is 1 then skip execution
		lw	$a0, 12($sp)
		lw	$a1,  8($sp)
		jal	drawGates				# call drawGates(base address of framebuffer, base address of 2D map)
		gatesdone:
		
		beq	$a2, 1, doorsdone			# if static element control is 1 then skip execution
		lw	$a0, 12($sp)
		lw	$a1,  8($sp)
		jal	drawDoors				# call drawDoors(base address of framebuffer, base address of 2D map)
		doorsdone:
		
mapDrawn:	lw	$ra,  0($sp)				# load return address
		lw	$a2,  4($sp)				# load static element control
		lw	$a1,  8($sp)				# load base address of 2D map
		lw	$a0, 12($sp)				# load base address of framebuffer
		addiu	$sp, $sp, 16				# pop stack and deallocate 4 memory spaces
		jr	$ra					# return to caller
		
# end draw() child function
#----------------------------------------------------------------
	# drawBlankSpace() grandchild function 
	# {
	drawBlankSpace:		li	$t0, 0				# int i = 0
				lw	$t1, black			# load color hex value	
	
	check_Blank_Space:	beq	$t0, 1024, blankSpaceDrawn	# loop 1024 times
				lw	$t2, 0($a1)			# load integer from 2D map array into $t2
				bne	$t2, 0, not_Blank_Space		# if $t2 == 0 then store black hex value into corresponding framebuffer address
				sw	$t1, 0($a0)
					
	not_Blank_Space:	
				addi	$a0, $a0, 4			# increment values
				addi	$a1, $a1, 4
				addi	$t0, $t0, 1
				 
				j	check_Blank_Space		# end for loop
	
	blankSpaceDrawn:	jr	$ra				# return to caller
	
	# }
	# end drawBlankSpace() child function
#----------------------------------------------------------------
	# drawWalls() grandchild function 
	# {
	drawWalls:		li	$t0, 0				# int i = 0
				lw	$t1, wall			# load color hex value
	
	drawWall:		
				beq	$t0, 1024, wallsDrawn		# loop 1024 times
				lw	$t2, 0($a1)			# load integer from 2D map array into $t2
				bne	$t2, 1, incrementWallPosition	# if $t2 == 1 then store grey hex value into corresponding framebuffer address	
				sw	$t1, 0($a0)			
			
	incrementWallPosition:
				addi	$a0, $a0, 4			# increment values
				addi	$a1, $a1, 4
				addi	$t0, $t0, 1
		
				j	drawWall			# end for loop
		
	wallsDrawn:		jr	$ra				# return to caller
	
	# }
	# end drawWalls() grandchild function
#----------------------------------------------------------------
	# drawTokens() grandchild function 
	# {
	drawTokens:		li	$t0, 0				# int i = 0
				lw	$t1, token			# load color hex value
				
	drawToken:		
				beq	$t0, 1024, tokensDrawn		# loop 1024 times
				lw	$t2, 0($a1)			# load integer from 2D map array 
				bne	$t2, 3, not_Token		# if $t2 == 3 then store yellow hex value into corresponding framebuffer address
				sw	$t1, 0($a0)
				
	not_Token:		addi	$a0, $a0, 4			# increment values
				addi	$a1, $a1, 4
				addi	$t0, $t0, 1
				
				j	drawToken			# end for loop			
	
	tokensDrawn:		jr	$ra				# return to caller
	
	# }
	# end drawTokens() grandchild function
#----------------------------------------------------------------
	# drawGates() grandchild function 
	# {
	drawGates:		li	$t0, 0				# int i = 0
				lw	$t1, gate 			# load color hex values
				
	drawGate:		beq	$t0, 1024, gatesDrawn		# loop 1024 times
				lw	$t2, 0($a1)			# load integer from 2D map array
				bne	$t2, 6, not_Gate		# if $t2 == 6 then store brown hex value into corresponding framebuffer address
				sw	$t1, 0($a0)
				
	not_Gate:		addi	$a0, $a0, 4			# increment values
				addi	$a1, $a1, 4
				addi	$t0, $t0, 1
				
				j	drawGate			# end for loop			
	
	gatesDrawn:		jr	$ra				# return to caller
	
	# }
	# end drawGates() grandchild function
#----------------------------------------------------------------
	# drawDoors() grandchild function 
	# {
	drawDoors:		li	$t0, 0				# int i = 0
				lw	$t1, door			# load color hex values
	
	drawDoor:		beq	$t0, 1024, doorsDrawn		# loop 1024 times
				lw	$t2, 0($a1)			# load integer from 2D map array
				bne	$t2, 5, not_Door		# if $t2 == 5 then store dark grey hex value into corresponding framebuffer address
				sw	$t1, 0($a0)
	
	not_Door:		addi	$a0, $a0, 4			# increment values
				addi	$a1, $a1, 4
				addi	$t0, $t0, 1
				
				j	drawDoor			# end for loop
	
	doorsDrawn:		jr	$ra				# return to caller
	
	# }
	# end drawDoors() grandchild function
#----------------------------------------------------------------	
	# drawCharacter() grandchild function 
	# {
	drawCharacter:		li	$t0, 0				# int i = 0
				lw	$t1, character			# load color hex values
				
	check_Char_Position:	beq	$t0, 1024, characterDrawn	# loop 1024 times
				lw	$t2, 0($a1)			# load integer from 2D map array
				bne	$t2, 2, not_Character		# if $t2 == 2then store dark green hex vaue into corresponding framebuffer address
				sw	$t1, 0($a0)
				
	not_Character:		addi	$a0, $a0, 4			# increment values
				addi	$a1, $a1, 4
				addi	$t0, $t0, 1
				
				j 	check_Char_Position		# end for loop
				 		
	
	characterDrawn:		jr	$ra				# return to caller
	
	# }
	# end drawCharacter() grandchild function
#----------------------------------------------------------------	
# child function 
# int logic(int* map, int ROW, int COLUMN, int COLUMNSperROW) {
#	call characterPosition()
#	store address of character in map on stack
#       call characterMovement() - moves character based on current position
#	check for doorAction()
#	return x and y position of character
# }
logic:			addiu	$sp, $sp, -24
			sw	$a0, 24($sp)  			# base address of 2D map array
			sw	$a1, 20($sp)  			# ROW position
			sw	$a2, 16($sp)  			# COLUMN position
			sw	$a3, 12($sp) 			# COLUMNS/ROW (COLUMNS Per ROW)
			sw	$ra,  0($sp) 			# return address
			
			jal 	characterPosition		# call characterPosition() function
			sw	$v0, 8($sp)
			
			lw	$a0, 8($sp)  			# current 2D map array address of character argument ($v0)
			lw	$a1, 20($sp) 			# ROW position argument
			lw	$a2, 16($sp) 			# COLUMN position argument
			jal	characterMovement		# call characterMovement() function
			sw	$v0, 8($sp)			# store return value $v0 on stack
			sw	$v1, 4($sp)			# store return value $v1 on stack
			
			#########################
			lw	$t0, door_to_open		# store door action control into $t0
			lw	$t1, token_count		# store token count into $t1
				
	check_door_one:		bne	$t0, 1, check_door_two		# if $t0 == 1 and $t1 == 3 then execute body
				bne	$t1, 3,  no_door_action
					lw	$a0, 24($sp)		# base address of 2D map array
					move	$a1, $a3		# number of COLUMNS/ROW (COLUMNS Per ROW)
					li	$a2, 27			# x position (ROW) of the top first block of the door
					li	$a3, 8			# y position (COLUMN) of the top first block of the door
					jal	doorAction		# call doorAction($a0, $a1, $a2, $a3)
					addi	$t0, $zero, 2
					sw	$t0, door_to_open	# set door_to_open memory to 2 
					j	no_door_action
	check_door_two:		bne	$t0, 2, check_door_three	# if $t0 == 2 and $t1 == 7 then execute body
				bne	$t1, 7,  no_door_action
					lw	$a0, 24($sp)		# base address of 2D map array
					move	$a1, $a3		# number of COLUMNS/ROW (COLUMNS Per ROW)
					li	$a2, 1			# x position (ROW) of the top first block of the door
					li	$a3, 16			# y position (COLUMN) of the top first block of the door
					jal	doorAction		# call doorAction($a0, $a1, $a2, $a3)
					addi	$t0, $zero, 3
					sw	$t0, door_to_open	# set door_to_open memory to 3
					j	no_door_action
	check_door_three:	bne	$t0, 3, no_door_action		# if $t0 == 3 and $t1 == 10 then execute body
				bne	$t1, 10, no_door_action 
					lw	$a0, 24($sp)		# base address of 2D map array
					move	$a1, $a3		# number of COLUMNS/ROW (COLUMNS Per ROW)
					li	$a2, 27			# x position (ROW) of the top first block of the door
					li	$a3, 23			# y position (COLUMN) of the top first block of the door
					jal	doorAction		# call doorAction($a0, $a1, $a2, $a3)
					addi	$t0, $zero, 0		
					sw	$t0, door_to_open	# door_to_open memory set to 0
			#########################	
			no_door_action:					# end if-else/else-if statements
			
logicfinished:		lw	$ra,  0($sp)
			lw	$v1,  4($sp)
			lw	$v0,  8($sp)
			lw	$a3, 12($sp)
			lw	$a2, 16($sp)
			lw	$a1, 20($sp)
			lw	$a0, 24($sp)				
			addiu	$sp, $sp, 24			# pop stack and deallocate 6 memory spaces
			
			jr	$ra				# return to caller
#----------------------------------------------------------------
# grandchild function
# int characterPosition(int x, int y)
#	find and return map address of character given x and y coordinates (ROW and COLUMN) of character
# }
	characterPosition:	move	$t0, $a1
				move	$t1, $a2
				
				
	calculateAddress:	sll	$t2, $a3, 2		# Length of ROW = COLUMNS * 4
				mul	$t0, $t0, $t2		# ROW INCREMENT = ROW INDEX * Length of ROW
				 
				sll	$t1, $t1, 2		# COLUMN INCREMENT = COULUMN INDEX * 4
				add	$v0, $t0, $t1		
				add	$v0, $v0, $a0		# return value = ROW INCREMENT + COLUMN INCREMENT + base address of 2D array
	
	positionCalculated:	jr	$ra			# return to caller
	
# end of characterPosition()
#----------------------------------------------------------------
	# characterMovement() grandchild function 
	# {
	characterMovement:	lw	$t0, key_control_address
				lw	$t1, key_receiver_address
				li	$t2, 2				# character integer code
				
				addiu	$sp, $sp, -20
				sw	$a0,  16($sp)			# save base address of map
				sw	$t2,  12($sp)			# save character integer code
				sw	$t1,   8($sp)			# save key_receiver_address
				sw	$t0,   4($sp)			# save key_control_address
				sw	$ra,   0($sp)			# save return address
				
	check_key_pressed:	lw	$t0, 0($t0)
				beqz	$t0, movementFinished		# if value in key_control_address is 0 then there is no movement
				
	key_pressed:		lw	$t1, 0($t1)
				beq	$t1, 0x0000006a, move_left	# if value in key_receiver address is 0x0000006a(j) then jump to move_left body
				beq	$t1, 0x0000006c, move_right 	# if value in key_receiver address is 0x0000006c(l) then jump to move_right body
				beq	$t1, 0x00000069, move_up	# if value in key_receiver address is 0x00000069(i) then jump to move_up body
				beq	$t1, 0x0000006b, move_down	# if value in key_receiver address is 0x0000006b(k) then jump to move_down body
				beq	$t1, 0x00000071, quit_game	# if value in key_receiver address is 0x00000071(q) then jump to quit_game body
				j	movementFinished
	#-----------------------------------------------
	move_left:		lw	$t3, -4($a0)			# load word of map address to the left of current address
	
        check_left_wall:	beq	$t3, 1, wall_left
        			beq	$t3, 5, wall_left
        			########################
        check_left_token:	bne	$t3, 3, change_position_left
        			lw	$t4, token_count
        			addi	$t4, $t4, 1
        			sw	$t4, token_count		# add 1 to the token count in data memory
        			
        			jal	display_Stats			# display token count and health count on I/O
        			lw	$a0, 16($sp)
        			lw	$t2, 12($sp)
        			lw	$t1,  8($sp)
        			lw	$t0,  4($sp)
        			########################					
	change_position_left:	sw	$zero, 0($a0)
				subi 	$a2, $a2, 1
				sw	$t2, -4($a0)			# change position of character in map to the left (current position of character become 0 and the next position 2)		
	wall_left:		j 	movementFinished
	#-----------------------------------------------			
	move_right:		lw	$t3, 4($a0)			# load word of map address to the right of current address
	
	check_right_wall:	beq	$t3, 1, wall_right
				beq	$t3, 5, wall_right
				########################
        check_right_token:	bne	$t3, 3, change_position_right
        			lw	$t4, token_count
        			addi	$t4, $t4, 1
        			sw	$t4, token_count		# add 1 to the token count in data memory
        			
        			jal	display_Stats			# display token count and health count on I/O
        			lw	$a0, 16($sp)
        			lw	$t2, 12($sp)
        			lw	$t1,  8($sp)
        			lw	$t0,  4($sp)
        			########################
	
	change_position_right:	sw	$zero, 0($a0)
				addi	$a2, $a2, 1
				sw	$t2, 4($a0)			# change position of character in map to the right (current position of character become 0 and the next position 2)	
	wall_right:		j 	movementFinished
	#-----------------------------------------------			
	move_up:		lw	$t3, -128($a0)			# load word of map address on top of the current address
	
	check_above_wall:	beq	$t3, 1, wall_above
				beq	$t3, 5, wall_above
				########################
        check_up_token:		bne	$t3, 3, check_end_up
        			lw	$t4, token_count
        			addi	$t4, $t4, 1
        			sw	$t4, token_count		# add 1 to the token count in data memory
        			
        			jal	display_Stats			# display token count and health count on I/O
        			lw	$a0, 16($sp)
        			lw	$t2, 12($sp)
        			lw	$t1,  8($sp)
        			lw	$t0,  4($sp)
        			j	change_position_up
        			########################
        check_end_up:		bne	$t3, 6, change_position_up
        			li	$v0, 4
        			la	$a0, gameWon
        			syscall					# if integer is 6 in map, then you win the game and the program terminates
        			addi	$sp, $sp, 44
        			j 	terminate	
        			########################	
	change_position_up:	sw	$zero, 0($a0)
				subi	$a1, $a1, 1 
				sw	$t2, -128($a0)			# change position of character in map up (current position of character become 0 and the next position 2)
	wall_above:		j 	movementFinished
	#-----------------------------------------------
	move_down:		lw	$t3, 128($a0)			# load word of map address on the bottom of current address 
	
	check_below_wall:	beq	$t3, 1, wall_below
				beq	$t3, 5, wall_below
				########################
        check_down_token:	bne	$t3, 3, change_position_down
        			lw	$t4, token_count
        			addi	$t4, $t4, 1
        			sw	$t4, token_count		# add 1 to the token count in data memory
        			
        			jal	display_Stats			# display token count and health count on I/O
        			lw	$a0, 16($sp)
        			lw	$t2, 12($sp)
        			lw	$t1,  8($sp)
        			lw	$t0,  4($sp)
				########################
	change_position_down:	sw	$zero, 0($a0)
				addi	$a1, $a1, 1
				sw	$t2, 128($a0)			# change position of character in map down (current position of character become 0 and the next position 2)
	wall_below:		j	movementFinished
	#-----------------------------------------------					
	quit_game:		j	terminate
	
					
	movementFinished:	lw	$a0,  16($sp)
				lw	$ra,   0($sp)
				addiu	$sp, $sp, 20
	
				move	$v0, $a1			# return current x position of character
				move    $v1, $a2			# return current y position of character
				
				jr	$ra				# return to caller
	# } 
	# end characterMovement() grandchild function
#----------------------------------------------------------------
# grandchild function
# void doorAction() {
#	provide x and y position of top of door
#	make all pixels of 4 block door black (blank space) 
# }
	doorAction:		li	$t1, 0
				
	door_address:		sll	$t2, $a1, 2			# Length of ROW = COLUMNS * 4					
				mul	$t3, $a2, $t2			# ROW INCREMENT = ROW INDEX * Length of ROW
				
				sll	$t4, $a3, 2			# COLUMN INCREMENT = COULUMN INDEX * 4		
				add	$t5, $t3, $t4
				add     $t5, $t5, $a0			# return value = ROW INCREMENT + COLUMN INCREMENT + base address of 2D array
				
	door_open:		beq	$t1, 4, doorActionDone		# iterate 4 times
				sw	$zero, 0($t5)			# set 5 to 0 in 2D map array
				add	$t5, $t5, $t2			# add 128 to current map address to move to next row (increment current row index by 1)
				addi	$t1, $t1, 1			# add 1 to the for loop counter
				j	door_open
				
	
	doorActionDone:		jr	$ra				# return to caller
	
# end of doorAction()



