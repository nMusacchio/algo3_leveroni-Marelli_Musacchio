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

!TestMarsRoverTracing methodsFor: 'asserts' stamp: 'fm 7/22/2021 12:51:14'!
assertMarsRoverAt: aPosition heading: aCardinalPoint withHeadingLogHasEntries: aLogEntryList afterProcessing: commands 

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	aMarsRoverLog := MarsRoverLog new.
	
	marsRover attachHeadingTracer: aMarsRoverLog.
	marsRover processCommands: commands.
	
	self assert: aLogEntryList = (aMarsRoverLog entries asArray).! !

!TestMarsRoverTracing methodsFor: 'asserts' stamp: 'fm 7/22/2021 12:51:14'!
assertMarsRoverAt: aPosition heading: aCardinalPoint withHeadingStatusWindowHasTextField: aTextField afterProcessing: commands

	| marsRover aMarsRoverStatusWindow |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	aMarsRoverStatusWindow := MarsRoverStatusWindow new.
	
	marsRover attachHeadingTracer: aMarsRoverStatusWindow.
	marsRover processCommands: commands.
	
	self assert: aTextField equals: aMarsRoverStatusWindow headingTextField.! !

!TestMarsRoverTracing methodsFor: 'asserts' stamp: 'fm 7/22/2021 12:51:40'!
assertMarsRoverAt: aPosition heading: aCardinalPoint withPositionLogHasEntries: aLogEntryList afterProcessing: commands 

	| marsRover aMarsRoverLog |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	aMarsRoverLog := MarsRoverLog new.
	
	marsRover attachPositionTracer: aMarsRoverLog.
	marsRover processCommands: commands.
	
	self assert: aLogEntryList = (aMarsRoverLog entries asArray).! !

!TestMarsRoverTracing methodsFor: 'asserts' stamp: 'fm 7/22/2021 12:51:40'!
assertMarsRoverAt: aPosition heading: aCardinalPoint withPositionStatusWindowHasTextField: aTextField afterProcessing: commands

	| marsRover aMarsRoverStatusWindow |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	aMarsRoverStatusWindow := MarsRoverStatusWindow new.
	
	marsRover attachPositionTracer: aMarsRoverStatusWindow.
	marsRover processCommands: commands.
	
	self assert: aTextField equals: aMarsRoverStatusWindow positionTextField.! !


!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/22/2021 11:53:55'!
test00LogIsEmptyWhenRoverIsCreated

	self assertMarsRoverAt: 0@0 heading: #North withPositionLogHasEntries: #() afterProcessing: ''.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/22/2021 11:54:27'!
test01LogsPositionWhenMovingUp

	self assertMarsRoverAt: 0@0 heading: #North withPositionLogHasEntries: #('0@1') afterProcessing: 'f'.
	! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/22/2021 11:55:23'!
test02LogsPositionWhenMovingRight

	self assertMarsRoverAt: 0@0 heading: #East withPositionLogHasEntries: #('1@0') afterProcessing: 'f'.
	! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/22/2021 11:59:11'!
test03LogsHeadingWhenRotatingEast

	self assertMarsRoverAt: 0@0 heading: #North withHeadingLogHasEntries: #('Este') afterProcessing: 'r'.
	! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/22/2021 12:04:49'!
test04LogsHeadingWhenRotatingWest

	self assertMarsRoverAt: 0@0 heading: #South withHeadingLogHasEntries: #('Oeste') afterProcessing: 'r'.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/22/2021 12:05:38'!
test05LogsHeadingWhenRotatingSouth

	self assertMarsRoverAt: 0@0 heading: #East withHeadingLogHasEntries: #('Sur') afterProcessing: 'r'.
	! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/22/2021 12:06:19'!
test06LogsHeadingWhenRotatingNorth

	self assertMarsRoverAt: 0@0 heading: #West withHeadingLogHasEntries: #('Norte') afterProcessing: 'r'.
	! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/22/2021 12:14:14'!
test07StatusWIndowPositionWhenMovingUp

	self assertMarsRoverAt: 0@0 heading: #North withPositionStatusWindowHasTextField: '0@1' afterProcessing: 'f'! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/22/2021 12:14:39'!
test08StatusWIndowPositionWhenMovingRight

	self assertMarsRoverAt: 0@0 heading: #East withPositionStatusWindowHasTextField: '1@0' afterProcessing: 'f'.
	! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/22/2021 12:15:51'!
test09StatusWindowHeadingWhenRotatingNorth

	self assertMarsRoverAt: 0@0 heading: #West withHeadingStatusWindowHasTextField: 'Norte' afterProcessing: 'r'.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/22/2021 12:16:58'!
test10StatusWindowHeadingWhenRotatingEast

	self assertMarsRoverAt: 0@0 heading: #North withHeadingStatusWindowHasTextField: 'Este' afterProcessing: 'r'.! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/22/2021 12:17:14'!
test11StatusWindowHeadingWhenRotatingSouth

	self assertMarsRoverAt: 0@0 heading: #East withHeadingStatusWindowHasTextField: 'Sur' afterProcessing: 'r'! !

!TestMarsRoverTracing methodsFor: 'tdd tests' stamp: 'fm 7/22/2021 12:17:31'!
test12StatusWindowHeadingWhenRotatingWest

	self assertMarsRoverAt: 0@0 heading: #South withHeadingStatusWindowHasTextField: 'Oeste' afterProcessing: 'r'.! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!
!MarsRover commentStamp: '<historical>' prior: 0!
objetos no completos log y window, error cuando se pide log sin agregar al rover
testear log para ambos position y heading nottdd!


!MarsRover methodsFor: 'initialization' stamp: 'fm 7/22/2021 12:44:56'!
initializeStartingAt: aPosition heading: aCardinalPoint 

	| initialHead |
	initialHead := MarsRoverHead of: self facing: aCardinalPoint.
	
	position := ModificationNotifierProxy for: aPosition withNotificationBlock: [:aSubscriber :aNewPosition | aSubscriber updatePositionTo: aNewPosition].
	
	head := ModificationNotifierProxy for: initialHead withNotificationBlock: [:aSubscriber :aNewHead | aSubscriber updateHeadingTo: aNewHead].! !


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


!MarsRover methodsFor: 'tracing' stamp: 'fm 7/22/2021 12:51:14'!
attachHeadingTracer: aHeadingTracer

	head subscribe: aHeadingTracer.! !

!MarsRover methodsFor: 'tracing' stamp: 'fm 7/22/2021 12:51:40'!
attachPositionTracer: aPositionTracer

	position subscribe: aPositionTracer.! !

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

!MarsRoverHead methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !


!MarsRoverHead methodsFor: 'movement' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'movement' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !


!MarsRoverHead methodsFor: 'initialization' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !


!MarsRoverHead methodsFor: 'rotate' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'rotate' stamp: 'LL 6/30/2021 16:36:43'!
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

!MarsRoverHeadFacingEast methodsFor: 'rotate' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'rotate' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !


!MarsRoverHeadFacingEast methodsFor: 'movement' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'movement' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

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

!MarsRoverHeadFacingNorth methodsFor: 'rotate' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'rotate' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !


!MarsRoverHeadFacingNorth methodsFor: 'movement' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'movement' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

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

!MarsRoverHeadFacingSouth methodsFor: 'movement' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'movement' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !


!MarsRoverHeadFacingSouth methodsFor: 'rotate' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'rotate' stamp: 'LL 6/30/2021 17:12:30'!
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

!MarsRoverHeadFacingWest methodsFor: 'rotate' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'rotate' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !


!MarsRoverHeadFacingWest methodsFor: 'movement' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'movement' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

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


!classDefinition: #ModificationNotifierProxy category: 'MarsRover-Solucion'!
Object subclass: #ModificationNotifierProxy
	instanceVariableNames: 'proxee subscribers notificationBlock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!ModificationNotifierProxy methodsFor: 'initialization' stamp: 'fm 7/22/2021 12:38:56'!
initilizeFor: aProxee with: aNotificationBlock

	notificationBlock := aNotificationBlock.
	proxee := aProxee.
	
	subscribers := OrderedCollection new.! !


!ModificationNotifierProxy methodsFor: 'private' stamp: 'fm 7/22/2021 12:41:03'!
notifyModification

	subscribers do: [:aSubscriber | notificationBlock value: aSubscriber value: proxee].! !


!ModificationNotifierProxy methodsFor: 'accessing' stamp: 'fm 7/21/2021 13:42:42'!
modifyValueTo: aNewProxee

	proxee := aNewProxee.
	self notifyModification.! !

!ModificationNotifierProxy methodsFor: 'accessing' stamp: 'fm 7/20/2021 18:48:48'!
value

	^proxee.! !


!ModificationNotifierProxy methodsFor: 'observer' stamp: 'fm 7/22/2021 12:41:29'!
subscribe: aSubscriptor
	
	subscribers add: aSubscriptor.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ModificationNotifierProxy class' category: 'MarsRover-Solucion'!
ModificationNotifierProxy class
	instanceVariableNames: ''!

!ModificationNotifierProxy class methodsFor: 'as yet unclassified' stamp: 'fm 7/22/2021 12:40:26'!
for: aProxee withNotificationBlock: aNotificationBlock

	^self new initilizeFor: aProxee with: aNotificationBlock.! !
