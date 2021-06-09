!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'fm 6/7/2021 13:30:37'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty.! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topNode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:09:34'!
initialize

	topNode := BaseNode new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:09:40'!
isEmpty
	
	^topNode isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:10:49'!
pop
	| topNodeValue | 
	topNodeValue := self top.
	
	topNode := topNode nextNode.
	
	^topNodeValue.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:13:49'!
push: anElement
	| newTopNode |	
	
	newTopNode := Node withValue: anElement beforeNode: topNode .
	
	topNode := newTopNode.
	
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:13:27'!
size 
	
	^topNode size! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:13:20'!
top
	
	^topNode top.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackNode category: 'Stack-Exercise'!
Object subclass: #OOStackNode
	instanceVariableNames: 'nextNode value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNode methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:08:27'!
isEmpty

	self subclassResponsibility ! !

!OOStackNode methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:08:33'!
nextNode

	self subclassResponsibility ! !

!OOStackNode methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:08:51'!
size

	self subclassResponsibility ! !

!OOStackNode methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:08:21'!
top

	self subclassResponsibility ! !


!classDefinition: #BaseNode category: 'Stack-Exercise'!
OOStackNode subclass: #BaseNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!BaseNode methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 19:12:04'!
isEmpty

	^true.! !

!BaseNode methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:07:34'!
nextNode

	OOStack error: OOStack stackEmptyErrorDescription.! !

!BaseNode methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 19:30:01'!
size

	^0.! !

!BaseNode methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 19:09:58'!
top

	OOStack error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #Node category: 'Stack-Exercise'!
OOStackNode subclass: #Node
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:06:17'!
initializeWithValue: nodeValue beforeNode: aNode

	nextNode := aNode.
	value := nodeValue.! !

!Node methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 19:12:16'!
isEmpty

	^false.! !

!Node methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:06:09'!
nextNode

	^nextNode.! !

!Node methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:06:09'!
size 

	^1 + (nextNode size).! !

!Node methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:06:17'!
top 

	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Node class' category: 'Stack-Exercise'!
Node class
	instanceVariableNames: ''!

!Node class methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:05:51'!
withValue: nodeValue beforeNode: aNode

	^self new initializeWithValue: nodeValue beforeNode: aNode.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentenceStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'fm 6/9/2021 16:27:49'!
find: aPrefix
	| matchingSentences | 
	
	self validatePrefix: aPrefix.
	matchingSentences := OrderedCollection new.
	self findRecursivePrefix: aPrefix andStoreIn: matchingSentences.
	
	^matchingSentences.

	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:44:18'!
findRecursivePrefix: aPrefix andStoreIn: aCollection
	| currentNodeValue |
	
	sentenceStack isEmpty ifTrue: [ ^self ].
	currentNodeValue := sentenceStack pop.
	((currentNodeValue findString: aPrefix) = 1) ifTrue: [ aCollection add: currentNodeValue ].
	self findRecursivePrefix: aPrefix andStoreIn: aCollection.
	sentenceStack push: currentNodeValue.
	
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:24:42'!
initializeWithStack: aStack

	sentenceStack := aStack.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'fm 6/9/2021 16:38:31'!
validatePrefix: aPrefix
	| containsSpace |
	containsSpace := aPrefix findString: ' ' > 0.
	(aPrefix isEmpty or: [containsSpace ]) ifTrue: [
		SentenceFinderByPrefix error: 'Invalid Prefix'.
	]
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:24:10'!
with: aStack

	^self new initializeWithStack: aStack.! !
