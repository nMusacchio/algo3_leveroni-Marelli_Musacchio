!classDefinition: #TestMarsRover category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LL 7/1/2021 00:42:36'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #TestMarsRoverLogger category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRoverLogger
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:13:51'!
test00LogIsEmptyWhenRoverIsCreated

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverLog := MarsRoverLog new.
	
	marsRover addPositionLog: aMarsRoverLog.
	marsRover processCommands: ''.
	
	self assert: aMarsRoverLog isEmpty.! !

!TestMarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:58:22'!
test01LogsPositionWhenMovingUp

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverLog := MarsRoverLog new.
	
	marsRover addPositionLog: aMarsRoverLog.
	marsRover processCommands: 'f'.
	
	self assert: 1 equals: aMarsRoverLog entries size.
	self assert: '0@1' equals: aMarsRoverLog firstEntry.! !

!TestMarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:58:27'!
test02LogsPositionWhenMovingRight

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: 0@0 heading: #East.
	aMarsRoverLog := MarsRoverLog new.
	
	marsRover addPositionLog: aMarsRoverLog.
	marsRover processCommands: 'f'.
	
	self assert: 1 equals: aMarsRoverLog entries size.
	self assert: '1@0' equals: aMarsRoverLog firstEntry.! !

!TestMarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:58:32'!
test03LogsHeadingWhenRotatingEast

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverLog := MarsRoverLog new.
	marsRover addHeadingLog: aMarsRoverLog.
	
	marsRover processCommands: 'r'.
	
	self assert: 1 equals: aMarsRoverLog entries size.
	self assert: 'Este' equals: aMarsRoverLog firstEntry.! !

!TestMarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:58:39'!
test04LogsHeadingWhenRotatingWest

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: 0@0 heading: #South.
	aMarsRoverLog := MarsRoverLog new.
	marsRover addHeadingLog: aMarsRoverLog.
	
	marsRover processCommands: 'r'.
	
	self assert: 1 equals: aMarsRoverLog entries size.
	self assert: 'Oeste' equals: aMarsRoverLog firstEntry.! !

!TestMarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:58:44'!
test05LogsHeadingWhenRotatingSouth

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: 0@0 heading: #East.
	aMarsRoverLog := MarsRoverLog new.
	marsRover addHeadingLog: aMarsRoverLog.
	
	marsRover processCommands: 'r'.
	
	self assert: 1 equals: aMarsRoverLog entries size.
	self assert: 'Sur' equals: aMarsRoverLog firstEntry.! !

!TestMarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:58:49'!
test06LogsHeadingWhenRotatingNorth

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: 0@0 heading: #West.
	aMarsRoverLog := MarsRoverLog new.
	marsRover addHeadingLog: aMarsRoverLog.
	
	marsRover processCommands: 'r'.
	
	self assert: 1 equals: aMarsRoverLog entries size.
	self assert: 'Norte' equals: aMarsRoverLog firstEntry.! !

!TestMarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:41:34'!
test07StatusWindowPositionWhenCreated

	| marsRover aMarsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverStatusWindow := MarsRoverStatusWindow new.
	
	marsRover addPositionStatusWindow: aMarsRoverStatusWindow.
	marsRover processCommands: ''.
	
	self assert: '0@0' equals: aMarsRoverStatusWindow positionTextField.! !

!TestMarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:43:04'!
test08StatusWIndowPositionWhenMovingUp

	| marsRover aMarsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverStatusWindow := MarsRoverStatusWindow new.
	
	marsRover addPositionStatusWindow: aMarsRoverStatusWindow.
	marsRover processCommands: 'f'.
	
	self assert: '0@1' equals: aMarsRoverStatusWindow positionTextField.! !

!TestMarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:46:53'!
test09StatusWindowHeadingWhenCreated

	| marsRover aMarsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverStatusWindow := MarsRoverStatusWindow new.
	
	marsRover addHeadingStatusWindow: aMarsRoverStatusWindow.
	marsRover processCommands: ''.
	
	self assert: 'Norte' equals: aMarsRoverStatusWindow headingTextField.! !

!TestMarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:56:09'!
test10StatusWindowHeadingWhenRotatingEast

	| marsRover aMarsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverStatusWindow := MarsRoverStatusWindow new.
	
	marsRover addHeadingStatusWindow: aMarsRoverStatusWindow.
	marsRover processCommands: 'r'.
	
	self assert: 'Este' equals: aMarsRoverStatusWindow headingTextField.! !

!TestMarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:56:32'!
test11StatusWindowHeadingWhenRotatingSouth

	| marsRover aMarsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #East.
	aMarsRoverStatusWindow := MarsRoverStatusWindow new.
	
	marsRover addHeadingStatusWindow: aMarsRoverStatusWindow.
	marsRover processCommands: 'r'.
	
	self assert: 'Sur' equals: aMarsRoverStatusWindow headingTextField.! !

!TestMarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:56:49'!
test12StatusWindowHeadingWhenRotatingWest

	| marsRover aMarsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #South.
	aMarsRoverStatusWindow := MarsRoverStatusWindow new.
	
	marsRover addHeadingStatusWindow: aMarsRoverStatusWindow.
	marsRover processCommands: 'r'.
	
	self assert: 'Oeste' equals: aMarsRoverStatusWindow headingTextField.! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head positionLog headingLog positionStatusWindow headingStatusWindow'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!
!MarsRover commentStamp: '<historical>' prior: 0!
objetos no completos log y window, error cuando se pide log sin agregar al rover
testear log para ambos position y heading nottdd!


!MarsRover methodsFor: 'initialization' stamp: 'fm 7/20/2021 15:52:07'!
initializeStartingAt: aPosition heading: aCardinalPoint 

	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.
	positionLog := nil.
	positionStatusWindow := nil.
	headingLog := nil.
	headingStatusWindow := nil.
	! !


!MarsRover methodsFor: 'process commands' stamp: 'LL 6/30/2021 15:54:14'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'LL 6/30/2021 19:47:14'!
isAt: aPosition heading: aCardinalPoint

	^ position = aPosition and: [ head isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 19:48:47'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'IAM 7/19/2021 20:41:14'!
moveDown

	self step: (0@-1)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'IAM 7/19/2021 20:41:08'!
moveLeft

	self step: (-1@0)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'IAM 7/19/2021 20:41:02'!
moveRight

	self step: (1@0)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'IAM 7/19/2021 20:40:55'!
moveUp

	self step: (0@1)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'fm 7/20/2021 15:35:49'!
step: aPoint

	position := position + aPoint.
	
	positionLog ifNotNil: [positionLog logPositionChangeTo: position].
	positionStatusWindow ifNotNil: [positionStatusWindow updatePositionTo: position].! !


!MarsRover methodsFor: 'dd - heading' stamp: 'IAM 7/19/2021 21:20:05'!
headEast

	self headTo:  (MarsRoverHeadFacingEast of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'IAM 7/19/2021 21:19:59'!
headNorth

	self headTo:  (MarsRoverHeadFacingNorth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'IAM 7/19/2021 21:19:51'!
headSouth

	self headTo:  (MarsRoverHeadFacingSouth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'fm 7/20/2021 15:51:15'!
headTo: aNewMarsRoverHead

	head := aNewMarsRoverHead.
	headingLog ifNotNil: [headingLog logHeadingChangeTo: head].
	headingStatusWindow ifNotNil: [headingStatusWindow updateHeadingTo: head].! !

!MarsRover methodsFor: 'dd - heading' stamp: 'IAM 7/19/2021 21:18:50'!
headWest

	self headTo: (MarsRoverHeadFacingWest of: self).! !


!MarsRover methodsFor: 'log' stamp: 'fm 7/20/2021 15:19:59'!
addHeadingLog: aMarsRoverLog

	headingLog := aMarsRoverLog.

	! !

!MarsRover methodsFor: 'log' stamp: 'fm 7/20/2021 15:48:03'!
addHeadingStatusWindow: aMarsRoverStatusWindow

	headingStatusWindow := aMarsRoverStatusWindow.
	headingStatusWindow updateHeadingTo: head.! !

!MarsRover methodsFor: 'log' stamp: 'fm 7/20/2021 15:06:36'!
addPositionLog: aMarsRoverLog

	positionLog := aMarsRoverLog.! !

!MarsRover methodsFor: 'log' stamp: 'fm 7/20/2021 15:40:13'!
addPositionStatusWindow: aMarsRoverStatusWindow

	positionStatusWindow := aMarsRoverStatusWindow.
	positionStatusWindow updatePositionTo: position.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Solucion'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverHead category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover-Solucion'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverLog category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverLog
	instanceVariableNames: 'entries'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:57:49'!
entries

	^entries.! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:04:54'!
firstEntry

	^entries first.! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:02:56'!
initialize

	entries := OrderedCollection new.! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:11:14'!
isEmpty

	^entries isEmpty.! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:26:10'!
logHeadingChangeTo: aNewMarsRoverHead
	
	(aNewMarsRoverHead isHeading: #North) ifTrue: [entries add: 'Norte'].
	(aNewMarsRoverHead isHeading: #East) ifTrue: [entries add: 'Este'].
	(aNewMarsRoverHead isHeading: #West) ifTrue: [entries add: 'Oeste'].
	(aNewMarsRoverHead isHeading: #South) ifTrue: [entries add: 'Sur'].
! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:04:05'!
logPositionChangeTo: aPosition

	entries add: aPosition asString.! !


!classDefinition: #MarsRoverStatusWindow category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverStatusWindow
	instanceVariableNames: 'currentHeadingTextField currentPositionTextField'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:49:08'!
headingTextField	

	^currentHeadingTextField.! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:49:55'!
initialize 

	currentPositionTextField := ''.! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:49:18'!
positionTextField	

	^currentPositionTextField asString.! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:54:45'!
updateHeadingTo: aNewMarsRoverHead

	(aNewMarsRoverHead isHeading: #North) ifTrue: [currentHeadingTextField := 'Norte'].
	(aNewMarsRoverHead isHeading: #East) ifTrue: [currentHeadingTextField := 'Este'].
	(aNewMarsRoverHead isHeading: #West) ifTrue: [currentHeadingTextField := 'Oeste'].
	(aNewMarsRoverHead isHeading: #South) ifTrue: [currentHeadingTextField := 'Sur'].

	! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 15:49:35'!
updatePositionTo: aNewPosition

	currentPositionTextField := aNewPosition asString.! !
