!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'fm 5/18/2021 17:04:09'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assertThatRunningTimeOf: [customerBook addCustomerNamed: 'John Lennon'] isLessThan: 50 * millisecond.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fm 5/18/2021 17:04:14'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self newCustomerBookWithClient: paulMcCartney.
	
	self assertThatRunningTimeOf:  [customerBook removeCustomerNamed: paulMcCartney] isLessThan: 100 * millisecond.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IAM 5/19/2021 19:29:49'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assertThatThisCodeFails: [customerBook addCustomerNamed: ''] withError: Error 
	andWhenItFailsRun: [ :anError |
		self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
		self assert: customerBook isEmpty. ]
			! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fm 5/18/2021 17:53:02'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self newCustomerBookWithClient: johnLennon .
	
	self assertThatThisCodeFails: [customerBook removeCustomerNamed: 'Paul McCartney'] 
	withError: NotFound 
	andWhenItFailsRun: [ :anError | 
		self assertThatOnlyClientInCustomerBook: customerBook is: johnLennon ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fm 5/18/2021 17:47:15'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self newCustomerBookWithSuspendedClient: paulMcCartney.
	
	self assertThatCustomerBook: customerBook hasNumberOfCustomers: 1 withNumberOfActive: 0 andNumberOfSuspended: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fm 5/18/2021 17:47:42'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|

	paulMcCartney := 'Paul McCartney'.
	customerBook := self newCustomerBookWithSuspendedClient: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertThatCustomerBook: customerBook hasNumberOfCustomers: 0 withNumberOfActive: 0 andNumberOfSuspended: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fm 5/18/2021 17:53:02'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |

	johnLennon := 'John Lennon'.
	customerBook := self newCustomerBookWithClient: johnLennon.
	
	self assertThatThisCodeFails: [customerBook suspendCustomerNamed: 'Ringo Starr'] 
	withError: CantSuspend 
	andWhenItFailsRun: [ :anError | 
		self assertThatOnlyClientInCustomerBook: customerBook is: johnLennon ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fm 5/18/2021 17:53:02'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
		
	johnLennon := 'John Lennon'.
	customerBook := self newCustomerBookWithSuspendedClient: johnLennon.
	
	self assertThatThisCodeFails: [customerBook suspendCustomerNamed: johnLennon] 
	withError: CantSuspend 
	andWhenItFailsRun: [ :anError | 
		self assertThatOnlyClientInCustomerBook: customerBook is: johnLennon]
! !


!CustomerBookTest methodsFor: 'helpers' stamp: 'IAM 5/19/2021 18:34:37'!
assertThatCustomerBook: customerBook hasNumberOfCustomers: amountOfcustomers withNumberOfActive: amountOfActive andNumberOfSuspended: amountOfSuspended

	self assert: amountOfActive equals: customerBook numberOfActiveCustomers.
	self assert: amountOfSuspended equals: customerBook numberOfSuspendedCustomers.
	self assert: amountOfcustomers equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'IAM 5/19/2021 18:34:55'!
assertThatOnlyClientInCustomerBook: customerBook is: client

	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: client)! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'IAM 5/19/2021 18:35:06'!
assertThatRunningTimeOf: codeToRun isLessThan: maxTime
	| time |
	
	time := codeToRun timeToRun.
	self assert: time < maxTime.
	
	
	
	! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'IAM 5/19/2021 18:35:13'!
assertThatThisCodeFails: codeToTest withError: error andWhenItFailsRun: codeToRun
	
	[ self failTestIfNoErrorIsThrownOn: codeToTest]
		on: error 
		do: codeToRun! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'IAM 5/19/2021 18:35:16'!
failTestIfNoErrorIsThrownOn: codeToRun
	
	codeToRun value.
	self fail.! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'IAM 5/19/2021 18:35:19'!
newCustomerBookWithClient: client
	| newCustomerBook |
	
	newCustomerBook := CustomerBook new.
	newCustomerBook addCustomerNamed: client.
	^newCustomerBook 
	
	! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'IAM 5/19/2021 18:35:26'!
newCustomerBookWithSuspendedClient: client
	| customerBook |
	
	customerBook := self newCustomerBookWithClient: client.
	customerBook suspendCustomerNamed: client.
	^customerBook 
	
	! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'IAM 5/19/2021 19:59:35'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName.! !

!CustomerBook methodsFor: 'customer management' stamp: 'IAM 5/19/2021 19:40:25'!
removeCustomerNamed: aName 
 	
	active remove: aName ifAbsent: [
		suspended remove: aName ifAbsent:[^ NotFound signal]].! !

!CustomerBook methodsFor: 'customer management' stamp: 'IAM 5/19/2021 19:53:24'!
suspendCustomerNamed: aName 
	
	(self includesActiveCustomerNamed: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName.
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'IAM 5/19/2021 20:00:32'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'IAM 5/19/2021 20:06:39'!
includesActiveCustomerNamed: aName

	^active includes: aName.! !

!CustomerBook methodsFor: 'testing' stamp: 'IAM 5/19/2021 20:08:37'!
includesCustomerNamed: aName

	^(self includesActiveCustomerNamed: aName) or:  [self includesSuspendedCustomerNamed: aName].! !

!CustomerBook methodsFor: 'testing' stamp: 'IAM 5/19/2021 20:06:33'!
includesSuspendedCustomerNamed: aName

	^suspended includes: aName.! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
