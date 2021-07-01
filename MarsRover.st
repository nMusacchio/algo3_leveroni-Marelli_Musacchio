!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'startingPosition marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:41:52'!
test01RoverDoesntMoveWithEmptyString

	self createRoverHeadingNorthAt: -1@-1 andSendCommands: ''.
	self assertThatRoverIsHeadingNorthAt: -1@-1.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:38:23'!
test02MoveForwardHeadingNorth

	self createRoverHeadingNorthAt: 1@1 andSendCommands: 'f'.
	self assertThatRoverIsHeadingNorthAt: 1@2.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:41:37'!
test03MoveBackwardHeadingNorth

	self createRoverHeadingNorthAt: 0@0 andSendCommands: 'b'.
	self assertThatRoverIsHeadingNorthAt: 0@-1.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:41:24'!
test04MoveForwardHeadingSouth

	self createRoverHeadingSouthAt: 3@2 andSendCommands: 'f'.
	self assertThatRoverIsHeadingSouthAt: 3@1.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:41:12'!
test05MoveBackwardHeadingSouth

	self createRoverHeadingSouthAt: 5@5 andSendCommands: 'b'.
	self assertThatRoverIsHeadingSouthAt: 5@6.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:43:17'!
test06MoveForwardHeadingEast

	self createRoverHeadingEastAt: 2@2 andSendCommands: 'f'.
	self assertThatRoverIsHeadingEastAt: 3@2.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:43:49'!
test07MoveBackwardHeadingEast

	self createRoverHeadingEastAt: 1@1 andSendCommands: 'b'.
	self assertThatRoverIsHeadingEastAt: 0@1.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:44:29'!
test08MoveForwardHeadingWest

	self createRoverHeadingWestAt: 1@1 andSendCommands: 'f'.
	self assertThatRoverIsHeadingWestAt: 0@1.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:44:55'!
test09MoveBackwardHeadingWest

	self createRoverHeadingWestAt: 1@1 andSendCommands: 'b'.
	self assertThatRoverIsHeadingWestAt: 2@1.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:45:31'!
test10RotateRightHeadingNorth

	self createRoverHeadingNorthAt: 1@1 andSendCommands: 'r'.
	self assertThatRoverIsHeadingEastAt: 1@1.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:53:38'!
test11RotateLeftHeadingNorth

	self createRoverHeadingNorthAt: 6@6 andSendCommands: 'l'.
	self assertThatRoverIsHeadingWestAt: 6@6.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:53:26'!
test12RotateRightHeadingEast

	self createRoverHeadingEastAt: 0@0 andSendCommands: 'r'.
	self assertThatRoverIsHeadingSouthAt: 0@0.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:46:47'!
test13RotateLeftHeadingEast

	self createRoverHeadingEastAt: 1@1 andSendCommands: 'l'.
	self assertThatRoverIsHeadingNorthAt: 1@1.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:53:13'!
test14RotateRightHeadingSouth

	self createRoverHeadingSouthAt: 4@7 andSendCommands: 'r'.
	self assertThatRoverIsHeadingWestAt: 4@7.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:53:01'!
test15RotateLeftHeadingSouth

	self createRoverHeadingSouthAt: -10@-11 andSendCommands: 'l'.
	self assertThatRoverIsHeadingEastAt: -10@-11.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:48:06'!
test16RotateRightHeadingWest

	self createRoverHeadingWestAt: 1@1 andSendCommands: 'r'.
	self assertThatRoverIsHeadingNorthAt: 1@1.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:52:41'!
test17RotateLeftHeadingWest

	self createRoverHeadingWestAt: 3@4 andSendCommands: 'l'.
	self assertThatRoverIsHeadingSouthAt: 3@4.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:52:29'!
test18MoveForwardAndBackward

	self createRoverHeadingNorthAt: 16@16 andSendCommands: 'fb'.
	self assertThatRoverIsHeadingNorthAt: 16@16.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:49:55'!
test19RotateThenMoveForward

	self createRoverHeadingWestAt: 3@2 andSendCommands: 'lf'.
	self assertThatRoverIsHeadingSouthAt: 3@1.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:50:30'!
test20TurnAroundThenMoveBackward

	self createRoverHeadingNorthAt: 2@2 andSendCommands: 'rrff'.
	self assertThatRoverIsHeadingSouthAt: 2@0.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:51:02'!
test21ProcessCorrectlyALargePath

	self createRoverHeadingNorthAt: 1@1 andSendCommands: 'llllffrb'.
	self assertThatRoverIsHeadingEastAt: 0@3.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 18:35:03'!
test22DoesntProcessIncorrectCommands
	
	self createRoverHeadingNorthAt: 10@10.
	self assertThatErrorIsRaisedWhenSentCommands: 'p'.
	self assertThatRoverIsHeadingNorthAt: 10@10.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 18:38:15'!
test23StopsProcessingCommandsAfterError

	self createRoverHeadingNorthAt: 1@1.
	self assertThatErrorIsRaisedWhenSentCommands: 'fflfqffrbflbfb'.
	self assertThatRoverIsHeadingWestAt: 0@3.! !


!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 18:34:05'!
assertThatErrorIsRaisedWhenSentCommands: aCommandList

	self should: [ marsRover processCommands: aCommandList ]
	raise: Error
	withExceptionDo: [ :anError |
		self assert: anError messageText = MarsRover unknownCommandErrorText.	
	].! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 18:17:56'!
assertThatRoverIsHeadingEastAt: aPosition

	self assert: (marsRover isAtPosition: aPosition).
	self assert: marsRover headingEast.
	self deny: marsRover headingNorth.
	self deny: marsRover headingSouth.
	self deny: marsRover headingWest.
	
	! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 18:18:10'!
assertThatRoverIsHeadingNorthAt: aPosition

	self assert: (marsRover isAtPosition: aPosition).
	self assert: marsRover headingNorth.
	self deny: marsRover headingSouth.
	self deny: marsRover headingWest.
	self deny: marsRover headingEast.
	! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 18:18:15'!
assertThatRoverIsHeadingSouthAt: aPosition

	self assert: (marsRover isAtPosition: aPosition).
	self assert: marsRover headingSouth.
	self deny: marsRover headingEast.
	self deny: marsRover headingNorth.
	self deny: marsRover headingWest.
	
	! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 18:18:20'!
assertThatRoverIsHeadingWestAt: aPosition

	self assert: (marsRover isAtPosition: aPosition).
	self assert: marsRover headingWest.
	self deny: marsRover headingEast.
	self deny: marsRover headingNorth.
	self deny: marsRover headingSouth.
	! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 18:12:33'!
createRoverHeadingEastAt: aPosition andSendCommands: commands
	
	marsRover := MarsRover headingEastAt: aPosition.
	marsRover processCommands: commands.
	
	! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 18:35:40'!
createRoverHeadingNorthAt: aPosition

	marsRover := MarsRover headingNorthAt: aPosition.! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 18:12:33'!
createRoverHeadingNorthAt: aPosition andSendCommands: commands
	
	marsRover := MarsRover headingNorthAt: aPosition.
	marsRover processCommands: commands.
	
	! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 18:12:33'!
createRoverHeadingSouthAt: aPosition andSendCommands: commands
	
	marsRover := MarsRover headingSouthAt: aPosition.
	marsRover processCommands: commands.
	
	! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 18:12:33'!
createRoverHeadingWestAt: aPosition andSendCommands: commands
	
	marsRover := MarsRover headingWestAt: aPosition.
	marsRover processCommands: commands.
	
	! !


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

!MarsRover methodsFor: 'testing' stamp: 'fm 7/1/2021 18:17:20'!
isAtPosition: aPosition

	^position = aPosition.! !


!MarsRover methodsFor: 'initialization' stamp: 'fm 7/1/2021 14:44:33'!
initializeAt: aPosition heading: aDirection

	position := aPosition.
	heading := aDirection.! !


!MarsRover methodsFor: 'commands' stamp: 'fm 7/1/2021 18:23:56'!
processCommands: aCommandList 
	
	 aCommandList do: [ :command | 
		(self validCommand: command) ifFalse: [
			^self error: MarsRover unknownCommandErrorText.
		].
	
		self processACommand: command.
	].	! !


!MarsRover methodsFor: 'private' stamp: 'fm 7/1/2021 18:13:31'!
isBackwardCommand: aCommand

	^ aCommand = $b! !

!MarsRover methodsFor: 'private' stamp: 'fm 7/1/2021 18:13:01'!
isFowardCommand: aCommand

	^ aCommand = $f! !

!MarsRover methodsFor: 'private' stamp: 'fm 7/1/2021 18:14:12'!
isRotateLeftCommand: aCommand

	^ aCommand = $l! !

!MarsRover methodsFor: 'private' stamp: 'fm 7/1/2021 18:13:56'!
isRotateRightCommand: aCommand

	^ aCommand = $r! !

!MarsRover methodsFor: 'private' stamp: 'fm 6/30/2021 20:08:56'!
moveBackward

	^ position 	:= position - heading! !

!MarsRover methodsFor: 'private' stamp: 'fm 6/30/2021 20:08:42'!
moveForward

	^ position 	:= position + heading! !

!MarsRover methodsFor: 'private' stamp: 'fm 7/1/2021 18:14:12'!
processACommand: aCommand

	(self isFowardCommand: aCommand) ifTrue: [
		self moveForward.
	].
	(self isBackwardCommand: aCommand) ifTrue: [
		self moveBackward.
	].
	(self isRotateRightCommand: aCommand) ifTrue: [
		self rotateRight.
	].
	(self isRotateLeftCommand: aCommand) ifTrue: [
		self rotateLeft.
	].

	! !

!MarsRover methodsFor: 'private' stamp: 'fm 7/1/2021 18:21:04'!
rotateLeft
	
	| leftOrientation |
	leftOrientation := 3.14/2.
	^ heading := (heading rotatedBy: leftOrientation ) rounded! !

!MarsRover methodsFor: 'private' stamp: 'fm 7/1/2021 18:21:38'!
rotateRight
	
	| rightOrientation |
	rightOrientation := -3.14/2.
	^ heading := (heading rotatedBy: rightOrientation) rounded! !

!MarsRover methodsFor: 'private' stamp: 'IAM 6/30/2021 17:59:41'!
validCommand: aCommand

	| validCommands |
	validCommands := #($b $f $l $r).
	
	^validCommands includes: aCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'fm 7/1/2021 14:44:33'!
headingEastAt: startingPosition

	^self new initializeAt: startingPosition heading: 1@0.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'fm 7/1/2021 14:44:33'!
headingNorthAt: startingPosition

	^self new initializeAt: startingPosition heading: 0@1.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'fm 7/1/2021 14:44:33'!
headingSouthAt: startingPosition

	^self new initializeAt: startingPosition heading: 0@-1.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'fm 7/1/2021 14:44:33'!
headingWestAt: startingPosition

	^self new initializeAt: startingPosition heading: -1@0.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'fm 7/1/2021 18:23:03'!
unknownCommandErrorText

	^'Unknown command.'! !
