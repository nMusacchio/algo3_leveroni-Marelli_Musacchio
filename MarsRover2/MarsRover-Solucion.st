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


!classDefinition: #TestMarsRoverTracing category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRoverTracing
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/21/2021 14:12:04'!
test00LogIsEmptyWhenRoverIsCreated

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverLog := MarsRoverLog new.
	
	marsRover addPositionTracer: aMarsRoverLog.
	marsRover processCommands: ''.
	
	self assert: aMarsRoverLog isEmpty.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/21/2021 14:12:04'!
test01LogsPositionWhenMovingUp

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverLog := MarsRoverLog new.
	
	marsRover addPositionTracer: aMarsRoverLog.
	marsRover processCommands: 'f'.
	
	self assert: 1 equals: aMarsRoverLog entries size.
	self assert: '0@1' equals: aMarsRoverLog firstEntry.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/21/2021 14:12:04'!
test02LogsPositionWhenMovingRight

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: 0@0 heading: #East.
	aMarsRoverLog := MarsRoverLog new.
	
	marsRover addPositionTracer: aMarsRoverLog.
	marsRover processCommands: 'f'.
	
	self assert: 1 equals: aMarsRoverLog entries size.
	self assert: '1@0' equals: aMarsRoverLog firstEntry.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/21/2021 14:11:52'!
test03LogsHeadingWhenRotatingEast

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverLog := MarsRoverLog new.
	
	marsRover addHeadingTracer: aMarsRoverLog.
	marsRover processCommands: 'r'.
	
	self assert: 1 equals: aMarsRoverLog entries size.
	self assert: 'Este' equals: aMarsRoverLog firstEntry.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/21/2021 14:11:52'!
test04LogsHeadingWhenRotatingWest

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: 0@0 heading: #South.
	aMarsRoverLog := MarsRoverLog new.
	
	marsRover addHeadingTracer: aMarsRoverLog.
	marsRover processCommands: 'r'.
	
	self assert: 1 equals: aMarsRoverLog entries size.
	self assert: 'Oeste' equals: aMarsRoverLog firstEntry.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/21/2021 14:11:52'!
test05LogsHeadingWhenRotatingSouth

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: 0@0 heading: #East.
	aMarsRoverLog := MarsRoverLog new.
	
	marsRover addHeadingTracer: aMarsRoverLog.
	marsRover processCommands: 'r'.
	
	self assert: 1 equals: aMarsRoverLog entries size.
	self assert: 'Sur' equals: aMarsRoverLog firstEntry.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/21/2021 14:11:52'!
test06LogsHeadingWhenRotatingNorth

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: 0@0 heading: #West.
	aMarsRoverLog := MarsRoverLog new.
	
	marsRover addHeadingTracer: aMarsRoverLog.
	marsRover processCommands: 'r'.
	
	self assert: 1 equals: aMarsRoverLog entries size.
	self assert: 'Norte' equals: aMarsRoverLog firstEntry.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/21/2021 14:12:04'!
test07StatusWIndowPositionWhenMovingUp

	| marsRover aMarsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverStatusWindow := MarsRoverStatusWindow new.
	
	marsRover addPositionTracer: aMarsRoverStatusWindow.
	marsRover processCommands: 'f'.
	
	self assert: '0@1' equals: aMarsRoverStatusWindow positionTextField.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/21/2021 14:12:04'!
test08StatusWIndowPositionWhenMovingRight

	| marsRover aMarsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #East.
	aMarsRoverStatusWindow := MarsRoverStatusWindow new.
	
	marsRover addPositionTracer: aMarsRoverStatusWindow.
	marsRover processCommands: 'f'.
	
	self assert: '1@0' equals: aMarsRoverStatusWindow positionTextField.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/21/2021 14:11:52'!
test09StatusWindowHeadingWhenRotatingNorth

	| marsRover aMarsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #West.
	aMarsRoverStatusWindow := MarsRoverStatusWindow new.
	
	marsRover addHeadingTracer: aMarsRoverStatusWindow.
	marsRover processCommands: 'r'.
	
	self assert: 'Norte' equals: aMarsRoverStatusWindow headingTextField.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/21/2021 14:11:52'!
test10StatusWindowHeadingWhenRotatingEast

	| marsRover aMarsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverStatusWindow := MarsRoverStatusWindow new.
	
	marsRover addHeadingTracer: aMarsRoverStatusWindow.
	marsRover processCommands: 'r'.
	
	self assert: 'Este' equals: aMarsRoverStatusWindow headingTextField.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/21/2021 14:11:52'!
test11StatusWindowHeadingWhenRotatingSouth

	| marsRover aMarsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #East.
	aMarsRoverStatusWindow := MarsRoverStatusWindow new.
	
	marsRover addHeadingTracer: aMarsRoverStatusWindow.
	marsRover processCommands: 'r'.
	
	self assert: 'Sur' equals: aMarsRoverStatusWindow headingTextField.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/21/2021 14:11:52'!
test12StatusWindowHeadingWhenRotatingWest

	| marsRover aMarsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: #South.
	aMarsRoverStatusWindow := MarsRoverStatusWindow new.
	
	marsRover addHeadingTracer: aMarsRoverStatusWindow.
	marsRover processCommands: 'r'.
	
	self assert: 'Oeste' equals: aMarsRoverStatusWindow headingTextField.! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!
!MarsRover commentStamp: '<historical>' prior: 0!
objetos no completos log y window, error cuando se pide log sin agregar al rover
testear log para ambos position y heading nottdd
preguntar solucion!


!MarsRover methodsFor: 'initialization' stamp: 'fm 7/21/2021 13:48:02'!
initializeStartingAt: aPosition heading: aCardinalPoint 

	| initialHead |
	initialHead := MarsRoverHead of: self facing: aCardinalPoint.
	
	position := ModificationObserverProxy forProxee: aPosition withUpdateBlock: [:anObserver :aNewPosition | anObserver updatePositionTo: aNewPosition].
	
	head := ModificationObserverProxy forProxee: initialHead withUpdateBlock: [:anObserver :aNewHead | anObserver updateHeadingTo: aNewHead].! !


!MarsRover methodsFor: 'process commands' stamp: 'LL 6/30/2021 15:54:14'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'fm 7/21/2021 13:51:10'!
isAt: aPosition heading: aCardinalPoint

	^ (position value) = aPosition and: [ head value isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'fm 7/20/2021 19:22:47'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head value movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head value movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head value rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head value rotateLeft ].
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

!MarsRover methodsFor: 'dd - moving' stamp: 'fm 7/21/2021 13:42:42'!
step: aPoint
	
	position modifyValueTo: ((position value) + aPoint).! !


!MarsRover methodsFor: 'dd - heading' stamp: 'IAM 7/19/2021 21:20:05'!
headEast

	self headTo:  (MarsRoverHeadFacingEast of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'IAM 7/19/2021 21:19:59'!
headNorth

	self headTo:  (MarsRoverHeadFacingNorth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'IAM 7/19/2021 21:19:51'!
headSouth

	self headTo:  (MarsRoverHeadFacingSouth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'fm 7/21/2021 13:42:42'!
headTo: aNewMarsRoverHead

	head modifyValueTo: aNewMarsRoverHead.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'IAM 7/19/2021 21:18:50'!
headWest

	self headTo: (MarsRoverHeadFacingWest of: self).! !


!MarsRover methodsFor: 'tracing' stamp: 'fm 7/21/2021 14:12:21'!
addHeadingTracer: aHeadingTracer

	head attachObserver: aHeadingTracer.! !

!MarsRover methodsFor: 'tracing' stamp: 'fm 7/21/2021 14:12:29'!
addPositionTracer: aPositionTracer

	position attachObserver: aPositionTracer.! !

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

!MarsRoverLog methodsFor: 'initialization' stamp: 'fm 7/20/2021 15:02:56'!
initialize

	entries := OrderedCollection new.! !


!MarsRoverLog methodsFor: 'accessing' stamp: 'fm 7/20/2021 15:57:49'!
entries

	^entries.! !

!MarsRoverLog methodsFor: 'accessing' stamp: 'fm 7/20/2021 15:04:54'!
firstEntry

	^entries first.! !


!MarsRoverLog methodsFor: 'testing' stamp: 'fm 7/20/2021 15:11:14'!
isEmpty

	^entries isEmpty.! !


!MarsRoverLog methodsFor: 'private' stamp: 'fm 7/21/2021 13:55:05'!
headingEntryFor: aNewMarsRoverHead

	(aNewMarsRoverHead isHeading: #North) ifTrue: [^'Norte'].
	(aNewMarsRoverHead isHeading: #East) ifTrue: [^'Este'].
	(aNewMarsRoverHead isHeading: #West) ifTrue: [^'Oeste'].
	(aNewMarsRoverHead isHeading: #South) ifTrue: [^'Sur']! !

!MarsRoverLog methodsFor: 'private' stamp: 'fm 7/21/2021 13:56:33'!
positionEntryFor: aPosition

	^ aPosition asString! !


!MarsRoverLog methodsFor: 'observer' stamp: 'fm 7/21/2021 13:55:19'!
updateHeadingTo: aNewMarsRoverHead
	
	entries add: (self headingEntryFor: aNewMarsRoverHead).
! !

!MarsRoverLog methodsFor: 'observer' stamp: 'fm 7/21/2021 13:56:33'!
updatePositionTo: aPosition

	entries add: (self positionEntryFor: aPosition).! !


!classDefinition: #MarsRoverStatusWindow category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverStatusWindow
	instanceVariableNames: 'currentHeadingTextField currentPositionTextField'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverStatusWindow methodsFor: 'observer' stamp: 'fm 7/21/2021 14:00:38'!
updateHeadingTo: aNewMarsRoverHead

	currentHeadingTextField := (self headingTextFieldFor: aNewMarsRoverHead).

	! !

!MarsRoverStatusWindow methodsFor: 'observer' stamp: 'fm 7/21/2021 14:01:04'!
updatePositionTo: aNewPosition

	currentPositionTextField := self positionTextFieldFor: aNewPosition.! !


!MarsRoverStatusWindow methodsFor: 'accessing' stamp: 'fm 7/20/2021 15:49:08'!
headingTextField	

	^currentHeadingTextField.! !

!MarsRoverStatusWindow methodsFor: 'accessing' stamp: 'fm 7/20/2021 15:49:18'!
positionTextField	

	^currentPositionTextField asString.! !


!MarsRoverStatusWindow methodsFor: 'initialization' stamp: 'fm 7/21/2021 14:09:36'!
initialize

	currentPositionTextField := ''.
	currentHeadingTextField := ''.! !


!MarsRoverStatusWindow methodsFor: 'private' stamp: 'fm 7/21/2021 14:02:49'!
headingTextFieldFor: aNewMarsRoverHead

	(aNewMarsRoverHead isHeading: #North) ifTrue: [^'Norte'].
	(aNewMarsRoverHead isHeading: #East) ifTrue: [^'Este'].
	(aNewMarsRoverHead isHeading: #West) ifTrue: [^'Oeste'].
	(aNewMarsRoverHead isHeading: #South) ifTrue: [^'Sur']! !

!MarsRoverStatusWindow methodsFor: 'private' stamp: 'fm 7/21/2021 14:01:22'!
positionTextFieldFor: aPosition

	^ aPosition asString! !


!classDefinition: #ModificationObserverProxy category: 'MarsRover-Solucion'!
Object subclass: #ModificationObserverProxy
	instanceVariableNames: 'proxee observers updateBlock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!ModificationObserverProxy methodsFor: 'initialization' stamp: 'fm 7/21/2021 13:40:17'!
initilizeFor: aProxee with: anUpdateBlock

	updateBlock := anUpdateBlock.
	proxee := aProxee.
	
	observers := OrderedCollection new.! !


!ModificationObserverProxy methodsFor: 'private' stamp: 'fm 7/20/2021 19:11:30'!
notifyModification

	observers do: [:anObserver | updateBlock value: anObserver value: proxee].! !


!ModificationObserverProxy methodsFor: 'accessing' stamp: 'fm 7/21/2021 13:42:42'!
modifyValueTo: aNewProxee

	proxee := aNewProxee.
	self notifyModification.! !

!ModificationObserverProxy methodsFor: 'accessing' stamp: 'fm 7/20/2021 18:48:48'!
value

	^proxee.! !


!ModificationObserverProxy methodsFor: 'observer' stamp: 'fm 7/20/2021 19:01:29'!
attachObserver: anObserver
	
	observers add: anObserver.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ModificationObserverProxy class' category: 'MarsRover-Solucion'!
ModificationObserverProxy class
	instanceVariableNames: ''!

!ModificationObserverProxy class methodsFor: 'as yet unclassified' stamp: 'fm 7/20/2021 19:18:23'!
forProxee: aProxee withUpdateBlock: anUpdateBlock

	^self new initilizeFor: aProxee with: anUpdateBlock.! !
