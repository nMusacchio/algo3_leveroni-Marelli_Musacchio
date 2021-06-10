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
	instanceVariableNames: 'sentenceStack sentenceFinder sentences findResult'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'fm 6/10/2021 13:07:01'!
assertThat: aFinderResult is: aCollection

	self assert: (aFinderResult hasEqualElements: aCollection).! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'fm 6/10/2021 12:19:17'!
assertThatFind: aPrefix raisesInvalidPrefixErrorWith: aSentenceFinder
	
	self should: [ aSentenceFinder find: aPrefix ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError |
		self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorMessage 
	].! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'fm 6/10/2021 13:25:31'!
assertThatStackRemainsUnchanged
	
	sentences reverseDo: [:sentence |
		self assert: sentence = sentenceStack top.
		sentenceStack pop.
	].! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'fm 6/10/2021 13:25:31'!
createSentenceFinderWithCurrentStack
	
	^SentenceFinderByPrefix with: sentenceStack.! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'fm 6/10/2021 13:10:12'!
createStackWithSentences: aCollection	
	
	| newStack |
	newStack := OOStack new.
	sentences := aCollection.
	
	aCollection do: [:sentence |
		newStack push: sentence.	
	].

	^newStack! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fm 6/10/2021 13:26:07'!
test01EmptyStackWithValidPrefix

	sentenceStack := self createStackWithSentences: #().
	sentenceFinder := self createSentenceFinderWithCurrentStack.
	
	findResult := sentenceFinder find: 'something'.
	
	self assert: findResult isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fm 6/10/2021 13:25:52'!
test02EmptyPrefixRaisesInvalidPrefix
	
	sentenceStack := self createStackWithSentences: #('Winter is coming' 'winning is everything' 'winter is calming').
	sentenceFinder := self createSentenceFinderWithCurrentStack.
	
	self assertThatFind: '' raisesInvalidPrefixErrorWith: sentenceFinder .
	self assertThatStackRemainsUnchanged.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fm 6/10/2021 13:25:51'!
test03PrefixWithSpacesRaisesInvalidPrefix

	sentenceStack := self createStackWithSentences: #('winter is coming' 'winning is everything' 'The winds of Winter' 'Winter is here').
	sentenceFinder := self createSentenceFinderWithCurrentStack.
	
	self assertThatFind: 'winter is' raisesInvalidPrefixErrorWith: sentenceFinder.
	self assertThatStackRemainsUnchanged.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fm 6/10/2021 13:26:07'!
test04ValidSearchMatchingNone

	sentenceStack := self createStackWithSentences: #('Winter is coming' 'Winning is great' 'The winds of Winter' 'Winter is here').
	sentenceFinder := self createSentenceFinderWithCurrentStack.
	
	findResult := 	sentenceFinder find: 'win'.
	
	self assert: findResult isEmpty.
	self assertThatStackRemainsUnchanged.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fm 6/10/2021 13:26:07'!
test05ValidSearchMatchingSome

	sentenceStack := self createStackWithSentences: #('winter is coming' 'winning is everything' 'Winds of Winter' 'Winter is here').
	sentenceFinder := self createSentenceFinderWithCurrentStack.
	
	findResult := 	sentenceFinder find: 'Win'.
	
	self assertThat: findResult is: #('Winter is here' 'Winds of Winter').
	self assertThatStackRemainsUnchanged.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fm 6/10/2021 13:26:07'!
test06ValidSearchMatchingAll

	sentenceStack := self createStackWithSentences: #('hello world 1' 'hello world 2' 'hello world 3' 'hello world 4' ).
	sentenceFinder := self createSentenceFinderWithCurrentStack.
	
	findResult := 	sentenceFinder find: 'hello'.
	
	self assertThat: findResult is: #('hello world 4' 'hello world 3' 'hello world 2' 'hello world 1').
	self assertThatStackRemainsUnchanged.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fm 6/10/2021 13:25:51'!
test07SearchIsCaseSensitive

	|  resultLowerCasePrefix resultUpperCasePrefix |
	sentenceStack := self createStackWithSentences: #('Winter is coming' 'Winning is everything' 'Winter is here' 'hello world' 'hello mom' 'hello dad').
	sentenceFinder := self createSentenceFinderWithCurrentStack.
	
	resultLowerCasePrefix := 	sentenceFinder find: 'win'.
	resultUpperCasePrefix := 	sentenceFinder find: 'Hello'.
	
	self assert: resultLowerCasePrefix isEmpty.
	self assert: resultUpperCasePrefix isEmpty.
	self assertThatStackRemainsUnchanged.
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topNode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'operations' stamp: 'fm 6/10/2021 11:21:52'!
pop

	| topNodeValue | 
	
	topNodeValue := self top.
	topNode := topNode nextNode.
	
	^topNodeValue.! !

!OOStack methodsFor: 'operations' stamp: 'fm 6/10/2021 11:22:12'!
push: anElement

	| newTopNode |	
	
	newTopNode := Node withValue: anElement beforeNode: topNode .
	
	topNode := newTopNode.
	
	! !

!OOStack methodsFor: 'operations' stamp: 'fm 6/8/2021 20:13:27'!
size 
	
	^topNode size! !

!OOStack methodsFor: 'operations' stamp: 'fm 6/10/2021 11:22:26'!
top
	
	^topNode top! !


!OOStack methodsFor: 'testing' stamp: 'fm 6/8/2021 20:09:40'!
isEmpty
	
	^topNode isEmpty.! !


!OOStack methodsFor: 'initialization' stamp: 'iam 6/10/2021 18:47:52'!
initialize

	topNode := OOStackBaseNode new.! !

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

!OOStackNode methodsFor: 'testing' stamp: 'fm 6/8/2021 20:08:27'!
isEmpty

	self subclassResponsibility ! !


!OOStackNode methodsFor: 'accessing' stamp: 'fm 6/8/2021 20:08:33'!
nextNode

	self subclassResponsibility ! !


!OOStackNode methodsFor: 'operations' stamp: 'fm 6/8/2021 20:08:51'!
size

	self subclassResponsibility ! !

!OOStackNode methodsFor: 'operations' stamp: 'fm 6/8/2021 20:08:21'!
top

	self subclassResponsibility ! !


!classDefinition: #Node category: 'Stack-Exercise'!
OOStackNode subclass: #Node
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'testing' stamp: 'fm 6/8/2021 19:12:16'!
isEmpty

	^false.! !


!Node methodsFor: 'operations' stamp: 'fm 6/8/2021 20:06:09'!
size 

	^1 + (nextNode size).! !

!Node methodsFor: 'operations' stamp: 'fm 6/8/2021 20:06:17'!
top 

	^value.! !


!Node methodsFor: 'accessing' stamp: 'fm 6/8/2021 20:06:09'!
nextNode

	^nextNode.! !


!Node methodsFor: 'initialization' stamp: 'fm 6/8/2021 20:06:17'!
initializeWithValue: nodeValue beforeNode: aNode

	nextNode := aNode.
	value := nodeValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Node class' category: 'Stack-Exercise'!
Node class
	instanceVariableNames: ''!

!Node class methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:05:51'!
withValue: nodeValue beforeNode: aNode

	^self new initializeWithValue: nodeValue beforeNode: aNode.! !


!classDefinition: #OOStackBaseNode category: 'Stack-Exercise'!
OOStackNode subclass: #OOStackBaseNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackBaseNode methodsFor: 'testing' stamp: 'fm 6/8/2021 19:12:04'!
isEmpty

	^true.! !


!OOStackBaseNode methodsFor: 'operations' stamp: 'fm 6/8/2021 20:07:34'!
nextNode

	OOStack error: OOStack stackEmptyErrorDescription.! !

!OOStackBaseNode methodsFor: 'operations' stamp: 'fm 6/8/2021 19:30:01'!
size

	^0.! !

!OOStackBaseNode methodsFor: 'operations' stamp: 'fm 6/8/2021 19:09:58'!
top

	OOStack error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentenceStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'fm 6/8/2021 20:24:42'!
initializeWithStack: aStack

	sentenceStack := aStack.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'fm 6/8/2021 20:44:18'!
findRecursivePrefix: aPrefix andStoreIn: aCollection
	| currentNodeValue |
	
	sentenceStack isEmpty ifTrue: [ ^self ].
	currentNodeValue := sentenceStack pop.
	((currentNodeValue findString: aPrefix) = 1) ifTrue: [ aCollection add: currentNodeValue ].
	self findRecursivePrefix: aPrefix andStoreIn: aCollection.
	sentenceStack push: currentNodeValue.
	
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'IAM 6/9/2021 19:38:21'!
validatePrefix: aPrefix
	| containsSpace |
	containsSpace := (aPrefix findString: ' ') > 0.
	(aPrefix isEmpty or: [containsSpace ]) ifTrue: [
		SentenceFinderByPrefix error: SentenceFinderByPrefix invalidPrefixErrorMessage .
	]
	! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'IAM 6/9/2021 19:26:36'!
find: aPrefix
	| matchingSentences |
	
	self validatePrefix: aPrefix.
	matchingSentences := OrderedCollection new.
	
	self findRecursivePrefix: aPrefix andStoreIn: matchingSentences.

	^matchingSentences.

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'IAM 6/9/2021 19:36:57'!
invalidPrefixErrorMessage

	^'Invalid prefix'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'fm 6/8/2021 20:24:10'!
with: aStack

	^self new initializeWithStack: aStack.! !
