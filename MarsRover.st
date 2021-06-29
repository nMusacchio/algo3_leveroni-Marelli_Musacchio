!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:21:06'!
test01RoverDoesntMoveWithEmptyString

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingSouthAt: startingPosition. 
	
	marsRover command: ''.
	
	marsRover assert: (marsRover position = startingPosition ).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:21:06'!
test02MoveForwardHeadingNorth

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingNorthAt: startingPosition.
	
	marsRover command: 'f'.
	
	marsRover assert: (marsRover position = (1@2)).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:21:06'!
test03MoveBackwardsHeadingNorth

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingNorthAt: startingPosition.
	
	marsRover command: 'b'.
	
	marsRover assert: (marsRover position = (1@0)).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:21:06'!
test04MoveForwardHeadingSouth

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingSouthAt: startingPosition.
	
	marsRover command: 'f'.
	
	marsRover assert: (marsRover position = (1@0)).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:21:06'!
test05MoveBackwardHeadingSouth

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingSouthAt: startingPosition.
	
	marsRover command: 'b'.
	
	marsRover assert: (marsRover position = (1@2)).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:21:06'!
test06MoveForwardHeadingEast

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingEastAt: startingPosition.
	
	marsRover command: 'f'.
	
	marsRover assert: (marsRover position = (2@1)).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:21:06'!
test07MoveBackwardHeadingEast

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingEastAt: startingPosition.
	
	marsRover command: 'b'.
	
	marsRover assert: (marsRover position = (0@1)).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:21:06'!
test08MoveForwardHeadingWest

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingWestAt: startingPosition.
	
	marsRover command: 'f'.
	
	marsRover assert: (marsRover position = (0@1)).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:21:06'!
test09MoveBackwardHeadingWest

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingWestAt: startingPosition.
	
	marsRover command: 'b'.
	
	marsRover assert: (marsRover position = (2@1)).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:21:06'!
test10

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingNorthAt: startingPosition.
	
	marsRover command: 'fb'.
	
	marsRover assert: (marsRover position = startingPosition).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:21:06'!
test11

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingNorthAt: startingPosition.
	
	marsRover command: 'ff'.
	
	marsRover assert: (marsRover position = (1@3)).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:29:05'!
test12

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingEastAt: startingPosition.
	
	marsRover command: 'ffbffb'.
	
	marsRover assert: (marsRover position = (3@1)).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:30:36'!
test13

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingEastAt: startingPosition.
	
	marsRover command: 'r'.
	
	marsRover assert: (marsRover position = startingPosition).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:31:19'!
test14

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingNorthAt: startingPosition.
	
	marsRover command: 'frf'.
	
	marsRover assert: (marsRover position = (2@2)).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:37:48'!
test15

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingWestAt: startingPosition.
	
	marsRover command: 'flf'.
	
	marsRover assert: (marsRover position = (0@0)).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:39:40'!
test16

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingEastAt: startingPosition.
	
	marsRover command: 'frrrrb'.
	
	marsRover assert: (marsRover position = startingPosition ).
	! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:23:47'!
command: aString 
	
	aString asOrderedCollection do: [ :command | self process: command ].
	
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:06:46'!
initializeAt: aPosition heading: aDirection

	position := aPosition.
	heading := aDirection.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 18:03:03'!
position

	^position.

	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'fm 6/29/2021 19:38:25'!
process: aCommand

	aCommand = $f ifTrue: [
		position 	:= position + heading.
	].
	aCommand = $b ifTrue: [
		position 	:= position - heading.
	].
	aCommand = $r ifTrue: [
		heading := (heading rotatedBy: -3.14/2) rounded.
	].
	aCommand = $l ifTrue: [
		heading := (heading rotatedBy: 3.14/2) rounded.
	].

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'fm 6/29/2021 19:06:02'!
headingEastAt: startingPosition

	^self new initializeAt: startingPosition heading: 1@0.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'fm 6/29/2021 19:01:50'!
headingNorthAt: startingPosition

	^self new initializeAt: startingPosition heading: 0@1.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'fm 6/29/2021 19:04:35'!
headingSouthAt: startingPosition

	^self new initializeAt: startingPosition heading: 0@-1.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'fm 6/29/2021 19:05:56'!
headingWestAt: startingPosition

	^self new initializeAt: startingPosition heading: -1@0.! !
