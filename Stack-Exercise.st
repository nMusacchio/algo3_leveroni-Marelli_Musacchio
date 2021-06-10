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
	instanceVariableNames: 'stack sentencesCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'IAM 6/9/2021 21:21:00'!
assertThatStackIsConsistent
	
	sentencesCollection reverseDo: [:sentence |
		self assert: sentence = stack top.
		stack pop.
	].! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'IAM 6/9/2021 21:11:59'!
pushSentencesInStack: aCollection

	sentencesCollection := aCollection.
	self pushElementsOfCollectionInStack: sentencesCollection.! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'IAM 6/9/2021 21:04:00'!
setUp

	stack := OOStack new.! !


!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'IAM 6/9/2021 20:37:33'!
pushElementsOfCollectionInStack: aCollection	

	aCollection do: [:sentence |
		stack push: sentence.	
	].! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IAM 6/9/2021 21:22:05'!
test01EmptyStackWithValidPrefix

	| sentenceFinder result |
	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	result := sentenceFinder find: 'wint'.
	
	self assert: result isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IAM 6/9/2021 21:21:22'!
test02EmptyPrefixFails

	
	| sentenceFinder |
	self pushSentencesInStack: #('Winter is coming').
	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	self
		should: [ sentenceFinder find: '' ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorMessage ].
		
	self assertThatStackIsConsistent.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IAM 6/9/2021 21:21:16'!
test03PrefixWithSpacesFails

	| sentenceFinder |
	
	self pushSentencesInStack: #('winter is coming' 'winning is everything' 'The winds of Winter' 'Winter is here').
	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	self
		should: [ sentenceFinder find: 'winter is' ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorMessage ].
		
	self assertThatStackIsConsistent.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IAM 6/9/2021 21:21:12'!
test04ValidSearchMatchingNone

	| sentenceFinder  resultLowerCasePrefix resultUpperCasePrefix |
	
	self pushSentencesInStack: #('Winter is coming' 'Winning is everything' 'The winds of Winter' 'Winter is here').
	sentenceFinder := SentenceFinderByPrefix with: stack.
	resultLowerCasePrefix := 	sentenceFinder find: 'wint'.
	resultUpperCasePrefix := 	sentenceFinder find: 'WINT'.
	
	self assert: resultLowerCasePrefix size = 0.
	self assert: resultUpperCasePrefix size = 0.
	
	self assertThatStackIsConsistent.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IAM 6/9/2021 21:21:08'!
test05ValidSearchMatchingSome

	| sentenceFinder result |
	
	self pushSentencesInStack: #('winter is coming' 'winning is everything' 'The winds of Winter' 'Winter is here').
	sentenceFinder := SentenceFinderByPrefix with: stack.
	result := 	sentenceFinder find: 'Wint'.
	
	self assert: result size = 1.
	self assert: ((result at: 1) = 'Winter is here').
	
	self assertThatStackIsConsistent.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IAM 6/9/2021 21:19:49'!
test06StackRemainsUnchangedAfterValidSearch

	| sentenceFinder |
	sentencesCollection := #('winter is coming' 'winning is everything' 'The winds of Winter' 'Winter is here').
	self pushElementsOfCollectionInStack: sentencesCollection.

	sentenceFinder := SentenceFinderByPrefix with: stack.
	sentenceFinder find: 'win'.
	
	self assertThatStackIsConsistent.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IAM 6/9/2021 21:24:49'!
test07ValidSearchMatchingAll

	| sentenceFinder result |
	
	self pushSentencesInStack: #('winter is coming' 'winter is coming 2' 'winter is coming 1' 'winter is coming 4').
	sentenceFinder := SentenceFinderByPrefix with: stack.
	result := 	sentenceFinder find: 'wint'.
	
	self assert: result size = 4.
	self assert: ((result at: 1) = 'winter is coming 4').
	
	self assertThatStackIsConsistent.! !


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


!SentenceFinderByPrefix methodsFor: 'util' stamp: 'IAM 6/9/2021 19:26:36'!
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
