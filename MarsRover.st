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

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:51:42'!
test22DoesntProcessIncorrectCommands

	self createRoverHeadingNorthAt: 10@10 andSendCommands: 'p'.
	self assertThatRoverIsHeadingNorthAt: 10@10.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'fm 7/1/2021 16:52:15'!
test23StopsProcessingCommandsAfterError

	self createRoverHeadingSouthAt: 1@1 andSendCommands: 'fflfqffrbflbfb'.
	self assertThatRoverIsHeadingEastAt: 2@-1.! !


!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 16:23:19'!
assertThatRoverIsHeadingEastAt: aPosition

	self assert: (marsRover position = aPosition).	
	self assert: marsRover headingEast.
	self deny: marsRover headingNorth.
	self deny: marsRover headingSouth.
	self deny: marsRover headingWest.
	
	! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 16:22:51'!
assertThatRoverIsHeadingNorthAt: aPosition

	self assert: (marsRover position = aPosition).	
	self assert: marsRover headingNorth.
	self deny: marsRover headingSouth.
	self deny: marsRover headingWest.
	self deny: marsRover headingEast.
	! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 16:24:06'!
assertThatRoverIsHeadingSouthAt: aPosition

	self assert: (marsRover position = aPosition).	
	self assert: marsRover headingSouth.
	self deny: marsRover headingEast.
	self deny: marsRover headingNorth.
	self deny: marsRover headingWest.
	
	! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 16:24:15'!
assertThatRoverIsHeadingWestAt: aPosition

	self assert: (marsRover position = aPosition).	
	self assert: marsRover headingWest.
	self deny: marsRover headingEast.
	self deny: marsRover headingNorth.
	self deny: marsRover headingSouth.
	! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 16:36:02'!
createRoverHeadingEastAt: aPosition andSendCommands: commands
	
	marsRover := MarsRover headingEastAt: aPosition.
	marsRover recieveCommands: commands.
	
	! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 16:35:28'!
createRoverHeadingNorthAt: aPosition andSendCommands: commands
	
	marsRover := MarsRover headingNorthAt: aPosition.
	marsRover recieveCommands: commands.
	
	! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 16:36:14'!
createRoverHeadingSouthAt: aPosition andSendCommands: commands
	
	marsRover := MarsRover headingSouthAt: aPosition.
	marsRover recieveCommands: commands.
	
	! !

!MarsRoverTest methodsFor: 'private' stamp: 'fm 7/1/2021 16:36:28'!
createRoverHeadingWestAt: aPosition andSendCommands: commands
	
	marsRover := MarsRover headingWestAt: aPosition.
	marsRover recieveCommands: commands.
	
	! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRover commentStamp: '<historical>' prior: 0!
error cuando hay un command erroneo
SUBCLASE DE COMMANDS
si esta bien el heading south!


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


!MarsRover methodsFor: 'initialization' stamp: 'fm 7/1/2021 14:44:33'!
initializeAt: aPosition heading: aDirection

	position := aPosition.
	heading := aDirection.! !


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


!MarsRover methodsFor: 'private' stamp: 'fm 6/30/2021 20:08:56'!
moveBackward

	^ position 	:= position - heading! !

!MarsRover methodsFor: 'private' stamp: 'fm 6/30/2021 20:08:42'!
moveForward

	^ position 	:= position + heading! !

!MarsRover methodsFor: 'private' stamp: 'fm 7/1/2021 14:29:06'!
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

!MarsRover methodsFor: 'private' stamp: 'fm 6/30/2021 20:09:34'!
rotateLeft

	^ heading := (heading rotatedBy: 3.14/2) rounded! !

!MarsRover methodsFor: 'private' stamp: 'fm 6/30/2021 20:09:19'!
rotateRight

	^ heading := (heading rotatedBy: -3.14/2) rounded! !

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
