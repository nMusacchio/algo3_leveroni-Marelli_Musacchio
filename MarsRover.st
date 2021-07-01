!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test01RoverDoesntMoveWithEmptyString

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingSouthAt: startingPosition. 
	
	marsRover recieveCommands: ''.
	
	self assert: (marsRover position = startingPosition ).
	self assert: marsRover headingSouth.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test02MoveForwardHeadingNorth

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingNorthAt: startingPosition.
	
	marsRover recieveCommands: 'f'.
	
	self assert: (marsRover position = (1@2)).	
	self assert: marsRover headingNorth.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test03MoveBackwardHeadingNorth

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingNorthAt: startingPosition.
	
	marsRover recieveCommands: 'b'.
	
	self assert: (marsRover position = (1@0)).
	self assert: marsRover headingNorth.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test04MoveForwardHeadingSouth

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingSouthAt: startingPosition.
	
	marsRover recieveCommands: 'f'.
	
	self assert: (marsRover position = (1@0)).	
	self assert: marsRover headingSouth.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test05MoveBackwardHeadingSouth

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingSouthAt: startingPosition.	
	
	marsRover recieveCommands: 'b'.
	
	self assert: (marsRover position = (1@2)).
	self assert: marsRover headingSouth ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test06MoveForwardHeadingEast

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingEastAt: startingPosition.
	
	marsRover recieveCommands: 'f'.
	
	marsRover assert: (marsRover position = (2@1)).
	self assert: marsRover headingEast.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test07MoveBackwardHeadingEast

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingEastAt: startingPosition	.
	
	marsRover recieveCommands: 'b'.
	
	self assert: (marsRover position = (0@1)).	
	self assert: marsRover headingEast.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test08MoveForwardHeadingWest

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingWestAt: startingPosition.
	
	marsRover recieveCommands: 'f'.
	
	self assert: (marsRover position = (0@1)).
	self assert: marsRover headingWest.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test09MoveBackwardHeadingWest

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingWestAt: startingPosition.
	
	marsRover recieveCommands: 'b'.
	
	self assert: (marsRover position = (2@1)).
	self assert: marsRover headingWest.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test10RotateRightHeadingNorth

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingNorthAt: startingPosition.
	
	marsRover recieveCommands: 'r'.
	
	self assert: (marsRover position = startingPosition).
	self deny: marsRover headingNorth.
	self assert: marsRover headingEast.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test11RotateLeftHeadingNorth

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingNorthAt: startingPosition.
	
	marsRover recieveCommands: 'l'.
	
	self assert: (marsRover position = startingPosition).
	self deny: marsRover headingNorth.
	self assert: marsRover headingWest.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test12RotateRightHeadingEast

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingEastAt: startingPosition.
	
	marsRover recieveCommands: 'r'.
	
	self assert: (marsRover position = startingPosition).
	self deny: marsRover headingEast.
	self assert: marsRover headingSouth.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test13RotateLeftHeadingEast

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingEastAt: startingPosition.
	
	marsRover recieveCommands: 'l'.
	
	self assert: (marsRover position = startingPosition).
	self deny: marsRover headingEast.
	self assert: marsRover headingNorth.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test14RotateRightHeadingSouth

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingSouthAt: startingPosition.
	
	marsRover recieveCommands: 'r'.
	
	self assert: (marsRover position = startingPosition).
	self deny: marsRover headingSouth.
	self assert: marsRover headingWest.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test15RotateLeftHeadingSouth

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingSouthAt: startingPosition.
	
	marsRover recieveCommands: 'l'.
	
	self assert: (marsRover position = startingPosition).
	self deny: marsRover headingSouth.
	self assert: marsRover headingEast.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test16RotateRightHeadingWest

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingWestAt: startingPosition.
	
	marsRover recieveCommands: 'r'.
	
	self assert: (marsRover position = startingPosition).
	self deny: marsRover headingWest.
	self assert: marsRover headingNorth.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test17RotateLeftHeadingWest

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingWestAt: startingPosition.
	
	marsRover recieveCommands: 'l'.
	
	self assert: (marsRover position = startingPosition).
	self deny: marsRover headingWest.
	self assert: marsRover headingSouth.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test18MoveForwardAndBackward

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingNorthAt: startingPosition.
	
	marsRover recieveCommands: 'fb'.
	
	self assert: (marsRover position = startingPosition).	
	self assert: marsRover headingNorth.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test19RotateThenMoveForward

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingWestAt: startingPosition.	
	
	marsRover recieveCommands: 'lf'.
	
	self assert: (marsRover position = (1@0)).	
	self deny: marsRover headingWest.
	self assert: marsRover headingSouth.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test20TurnAroundThenMoveBackward

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingNorthAt: startingPosition.	
	
	marsRover recieveCommands: 'rrff'.
	
	self assert: (marsRover position = (1@-1)).	
	self deny: marsRover headingNorth.
	self assert: marsRover headingSouth.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test21ProcessCorrectlyALargePath

	| marsRover startingPosition |
	startingPosition := 1@1.
	marsRover := MarsRover headingNorthAt: startingPosition.	
	
	marsRover recieveCommands: 'llllffrb'.
	
	self assert: (marsRover position = (0@3)).	
	self deny: marsRover headingNorth.
	self assert: marsRover headingEast.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test22DoesntProcessIncorrectCommands

	| marsRover startingPosition |	
	startingPosition := 1@1.
	marsRover := MarsRover headingNorthAt: startingPosition.
	
	marsRover recieveCommands: 'p'.	
	
	self assert: (marsRover position = startingPosition).
	self assert: marsRover headingNorth.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 13:59:22'!
test23StopsProcessingCommandsAfterError

	| marsRover startingPosition |	
	startingPosition := 1@1.
	marsRover := MarsRover headingSouthAt: startingPosition.
	
	marsRover recieveCommands: 'fflfqffrbflbfb'.	
	
	self assert: (marsRover position = (2@-1)).
	self assert: marsRover headingEast.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'testing' stamp: 'fm 7/1/2021 13:09:50'!
headingEast

	^heading = (1@0).! !

!MarsRover methodsFor: 'testing' stamp: 'fm 7/1/2021 13:09:55'!
headingNorth

	^heading = (0@1).! !

!MarsRover methodsFor: 'testing' stamp: 'fm 7/1/2021 13:10:00'!
headingSouth

	^heading = (0@-1).! !

!MarsRover methodsFor: 'testing' stamp: 'fm 7/1/2021 13:10:06'!
headingWest

	^heading = (-1@0).! !

!MarsRover methodsFor: 'testing' stamp: 'fm 7/1/2021 12:59:03'!
position

	^position.! !


!MarsRover methodsFor: 'initialization' stamp: 'fm 7/1/2021 13:04:26'!
initializeAt: aPosition facing: aDirection

	position := aPosition.
	heading := aDirection.! !


!MarsRover methodsFor: 'movement' stamp: 'fm 6/30/2021 20:08:56'!
moveBackward

	^ position 	:= position - heading! !

!MarsRover methodsFor: 'movement' stamp: 'fm 6/30/2021 20:08:42'!
moveForward

	^ position 	:= position + heading! !

!MarsRover methodsFor: 'movement' stamp: 'fm 6/30/2021 20:09:34'!
rotateLeft

	^ heading := (heading rotatedBy: 3.14/2) rounded! !

!MarsRover methodsFor: 'movement' stamp: 'fm 6/30/2021 20:09:19'!
rotateRight

	^ heading := (heading rotatedBy: -3.14/2) rounded! !


!MarsRover methodsFor: 'commands' stamp: 'fm 7/1/2021 14:29:06'!
processACommand: aCommand

	aCommand = $f ifTrue: [
		self moveForward.
	].
	aCommand = $b ifTrue: [
		self moveBackward.
	].
	aCommand = $r ifTrue: [
		self rotateRight.
	].
	aCommand = $l ifTrue: [
		self rotateLeft.
	].

	! !

!MarsRover methodsFor: 'commands' stamp: 'fm 7/1/2021 14:29:06'!
recieveCommands: aString 
	
	| commandList |
	commandList := aString asOrderedCollection.
	
	 commandList do: [ :command | 
		(self validCommand: command) ifFalse: [
			^self.	
		].
		self processACommand: command.
	].	! !

!MarsRover methodsFor: 'commands' stamp: 'IAM 6/30/2021 17:59:41'!
validCommand: aCommand

	| validCommands |
	validCommands := #($b $f $l $r).
	
	^validCommands includes: aCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'fm 7/1/2021 13:07:06'!
headingEastAt: startingPosition

	^self new initializeAt: startingPosition facing: 1@0.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'fm 7/1/2021 13:07:47'!
headingNorthAt: startingPosition

	^self new initializeAt: startingPosition facing: 0@1.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'fm 7/1/2021 13:07:37'!
headingSouthAt: startingPosition

	^self new initializeAt: startingPosition facing: 0@-1.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'fm 7/1/2021 13:07:19'!
headingWestAt: startingPosition

	^self new initializeAt: startingPosition facing: -1@0.! !


!classDefinition: #MarsRoverCommands category: 'MarsRover'!
Object subclass: #MarsRoverCommands
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverCommands methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 14:12:42'!
canHandle: aCharacter

	self subclassResponsibility.! !

!MarsRoverCommands methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 14:13:02'!
for: marsRover

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommands class' category: 'MarsRover'!
MarsRoverCommands class
	instanceVariableNames: ''!

!MarsRoverCommands class methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 14:12:21'!
for: marsRover with: aCharacter

	^(MarsRoverCommands allSubclasses detect: [ :class | class canHandle: aCharacter]) for: marsRover.! !


!classDefinition: #MoveForward category: 'MarsRover'!
MarsRoverCommands subclass: #MoveForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MoveForward methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 14:13:35'!
canHandle: aCharacter

	^aCharacter = $f.! !

!MoveForward methodsFor: 'as yet unclassified' stamp: 'fm 7/1/2021 14:13:56'!
for: marsRover

	^marsRover moveForward.! !
