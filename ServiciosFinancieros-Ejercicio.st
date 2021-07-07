!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'IAM 7/7/2021 02:12:32'!
test01DoATransference
	
	| accountA accountB |
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountA.
	
	accountA transferTo: accountB for: (80 * peso).
	
	self assert: (80 * peso) equals: accountB balance.
	self assert: (20 * peso) equals: accountA balance.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'IAM 7/7/2021 02:12:47'!
test02DoMultipleTransferences
	
	| accountA accountB |
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountA.
	
	accountA transferTo: accountB for: (80 * peso).
	accountA transferTo: accountB for: (20 * peso).
	accountB transferTo: accountA for: (15 * peso).
	
	self assert: (85 * peso) equals: accountB balance.
	self assert: (15 * peso) equals: accountA balance.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'IAM 7/7/2021 02:13:21'!
test03TransferenceValueIsCorrect
	
	| accountA accountB transfer |
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	
	Deposit register: (200 * peso) on: accountA. 
	transfer := Transference from: accountA to: accountB for: (80 * peso).
	
	self assert: (80*peso) equals: transfer value.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'IAM 7/7/2021 02:14:41'!
test04WithdrawCounterpartIsCorrect
	
	| accountA accountB transference aWithdrawPart |
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	
	Deposit register: (200 * peso) on: accountA. 
	transference := Transference from: accountA to: accountB for: (80 * peso).
	aWithdrawPart := transference withdrawPart.
	
	self assert: transference depositPart equals: aWithdrawPart counterpart.
	self assert: (80 * peso) equals: transference value.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'IAM 7/7/2021 02:15:51'!
test05DepositCounterpartIsCorrect
	
	| accountA accountB transference aDepositPart |
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	
	Deposit register: (200 * peso) on: accountA. 
	transference := Transference from: accountA to: accountB for: (80 * peso).
	aDepositPart := transference depositPart .
	
	self assert: transference withdrawPart equals: aDepositPart counterpart.
	self assert: (80 * peso) equals: transference value.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'IAM 7/7/2021 02:14:49'!
testxx
	
	| accountA accountB transfer |
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	
	Deposit register: (200 * peso) on: accountA. 
	transfer := Transference from: accountA to: accountB for: (80 * peso).
	
	self assert: transfer value = (80 * peso).
	self assert: accountA balance equals: (120 * peso).
	self assert: accountB balance equals: (80 * peso).! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'IAM 7/7/2021 02:07:47'!
balance

	^transactions inject: 0 * peso into: [:subBalance :aBalance | 
		subBalance + (((aBalance isKindOf: Deposit) or: [aBalance isKindOf: TransferenceDeposit]) ifTrue: aBalance value ifFalse: (aBalance value) negated) .
	].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'IAM 7/5/2021 21:04:09'!
transferTo: anAccount for: anAmount

	Withdraw register: anAmount on: self.
	Deposit register: anAmount on: anAccount.
	
	! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'depositPart withdrawPart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 23:23:03'!
depositPart

 	^depositPart ! !

!Transference methodsFor: 'as yet unclassified' stamp: 'IAM 7/7/2021 01:12:30'!
initializeFrom: senderAccount to: recipientAccount for: anAmount

	depositPart := TransferenceDeposit register: anAmount on: recipientAccount associateWith: self.
	withdrawPart := TransferenceWithdraw register: anAmount on: senderAccount associateWith: self.! !

!Transference methodsFor: 'as yet unclassified' stamp: 'IAM 7/5/2021 21:19:17'!
value

	^80 * peso.! !

!Transference methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 23:23:18'!
withdrawPart

 	^withdrawPart ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 20:33:14'!
from: senderAccount to: recipientAccount for: anAmount

	^self new initializeFrom: senderAccount to: recipientAccount for: anAmount.
	! !


!classDefinition: #TransferenceTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferenceTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTransaction methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 23:20:44'!
counterpart

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceTransaction class
	instanceVariableNames: ''!

!TransferenceTransaction class methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 21:23:21'!
register: aValue on: anAccount associateWith: aTransfer

	| transaction |
	
	transaction := self for: aValue associateWith: aTransfer.
	anAccount register: transaction.
		
	^ transaction! !


!classDefinition: #TransferenceDeposit category: 'ServiciosFinancieros-Ejercicio'!
TransferenceTransaction subclass: #TransferenceDeposit
	instanceVariableNames: 'value transferAssociated'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceDeposit methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 23:20:26'!
counterpart

	^transferAssociated withdrawPart.! !

!TransferenceDeposit methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 20:52:11'!
initializeFor: anAmount associateWith: aTransfer

	value := anAmount.
	transferAssociated := aTransfer.! !

!TransferenceDeposit methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 20:37:55'!
value

	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceDeposit class
	instanceVariableNames: ''!

!TransferenceDeposit class methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 20:50:25'!
for: anAmount associateWith: aTransfer

	^ self new initializeFor: anAmount associateWith: aTransfer.! !


!classDefinition: #TransferenceWithdraw category: 'ServiciosFinancieros-Ejercicio'!
TransferenceTransaction subclass: #TransferenceWithdraw
	instanceVariableNames: 'value transferAssociated'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceWithdraw methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 23:19:50'!
counterpart

	^transferAssociated depositPart.! !

!TransferenceWithdraw methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 20:51:56'!
initializeFor: anAmount associateWith: aTransfer

	value := anAmount.
	transferAssociated := aTransfer.! !

!TransferenceWithdraw methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 20:38:07'!
value

	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceWithdraw class
	instanceVariableNames: ''!

!TransferenceWithdraw class methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 21:16:52'!
for: anAmount associateWith: aTransfer

	^ self new initializeFor: anAmount associateWith: aTransfer.! !
