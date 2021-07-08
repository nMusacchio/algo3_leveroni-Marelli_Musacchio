!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'IAM 7/8/2021 02:00:18'!
test01
	"se prueba hacer el balance de un portfolio vacio"
	| portfolio |
	portfolio := Portfolio new.
	
	self assert: (portfolio balance) equals: 0 * peso.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'IAM 7/8/2021 01:59:58'!
test02
	"Se prueba agregar una cuenta"
	| portfolio account |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 20*peso on: account.
	portfolio addReceptiveAccount: account.
	
	self assert: (portfolio balance) equals: 20 * peso.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'IAM 7/8/2021 01:59:48'!
test03
	"Pruebo remover una cuenta"
	| portfolio account |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 20*peso on: account.
	portfolio addReceptiveAccount: account.
	portfolio removeReceptiveAccount: account.
	
	
	self assert: (portfolio balance) equals: 0 * peso.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'IAM 7/8/2021 02:00:30'!
test04
	"Portfolio has registered en un portfolio sin cuentas"
	| portfolio account deposit |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 20*peso on: account.
	
	
	self deny: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'IAM 7/8/2021 02:01:06'!
test05
	"Portfolio has registered en un portfolio con la cuenta correspondiente"
	| portfolio account deposit |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 20*peso on: account.
	portfolio addReceptiveAccount: account.
	
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'IAM 7/8/2021 02:02:23'!
test06
	"Portfolio has registered en un portfolio con varias cuentas entre ellas la cuenta correspondiente"
	| portfolio account deposit |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 20*peso on: account.
	portfolio addReceptiveAccount: account.
	portfolio addReceptiveAccount: ReceptiveAccount new.
	portfolio addReceptiveAccount: ReceptiveAccount new.
	
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'IAM 7/8/2021 02:36:05'!
test07
	"Portfolio transactions se fija si tiene bien una unica transaccion y es el deposito"
	| portfolio account deposit |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 20*peso on: account.
	portfolio addReceptiveAccount: account.
	
	self assert: 1 equals: portfolio transactions size.
	self assert: (portfolio transactions includes: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'IAM 7/8/2021 02:41:06'!
test08
	"Portfolio transactions con varias transacciones"
	| portfolio deposit accountA accountB transference withdraw |
	portfolio := Portfolio new.
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	
	deposit := Deposit register: 80*peso on: accountA.
	transference := AccountTransference from: accountA to: accountB for: (10 * peso).
	withdraw := Withdraw register: 20*peso on: accountA.
	portfolio addReceptiveAccount: accountA.
	portfolio addReceptiveAccount: ReceptiveAccount new.
	
	
	self assert: 3 equals: portfolio transactions size.
	self assert: (portfolio transactions includes: deposit).
	self assert: (portfolio transactions includes: transference withdrawPart).
	self assert: (portfolio transactions includes: withdraw).! !


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

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 12:41:56'!
test01TransferenceAffectsInvolvedAccountsBalanceCorrectly
	
	| senderAccount recipientAccount |
	senderAccount := ReceptiveAccount new.
	recipientAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	Deposit register: 100 * peso on: recipientAccount .
	
	AccountTransference from: senderAccount to: recipientAccount for: 40 * peso. 
	
	self assert: senderAccount balance equals: (60 * peso).
	self assert: recipientAccount balance equals: (140 * peso).! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 12:42:36'!
test02TransferenceIsForCorrectValue
	
	| senderAccount recipientAccount transference |
	senderAccount := ReceptiveAccount new.
	recipientAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	
	transference := AccountTransference from: senderAccount to: recipientAccount for: 70 * peso. 
	
	self assert: transference value equals: 70 * peso.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 13:37:04'!
test03DepositPartIsRegisteredOnRecipientAccount
	
	| senderAccount recipientAccount transference depositPart |
	senderAccount := ReceptiveAccount new.
	recipientAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.

	transference := AccountTransference from: senderAccount to: recipientAccount for: 80 * peso.
	depositPart := transference depositPart.
	
	self assert: (recipientAccount hasRegistered: depositPart).! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 14:01:28'!
test04WithdrawPartIsRegisteredOnSenderAccount
	
	| senderAccount recipientAccount transference withdrawPart |
	senderAccount := ReceptiveAccount new.
	recipientAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.

	transference := AccountTransference from: senderAccount to: recipientAccount for: 80 * peso.
	withdrawPart := transference withdrawPart .
	
	self assert: (senderAccount hasRegistered: withdrawPart).! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 14:02:56'!
test05WithdrawPartsCounterpartIsDepositPart
	
	| senderAccount recipientAccount transference depositPart withdrawPart |
	senderAccount := ReceptiveAccount new.
	recipientAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.

	transference := AccountTransference from: senderAccount to: recipientAccount for: 80 * peso.
	withdrawPart := transference withdrawPart.
	depositPart := transference depositPart.
	
	self assert: withdrawPart counterpart equals: depositPart.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 14:03:52'!
test06DepositPartsCounterpartIsWithdrawPart
	
	| senderAccount recipientAccount transference depositPart withdrawPart |
	senderAccount := ReceptiveAccount new.
	recipientAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.

	transference := AccountTransference from: senderAccount to: recipientAccount for: 80 * peso.
	withdrawPart := transference withdrawPart.
	depositPart := transference depositPart.
	
	self assert: depositPart counterpart equals: withdrawPart.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 14:08:09'!
test07MultipleTransferences
	
	| senderAccount recipientAccount |
	senderAccount := ReceptiveAccount new.
	recipientAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	Deposit register: 20 * peso on: recipientAccount.
	
	AccountTransference from: senderAccount to: recipientAccount for: 40 * peso. 
	AccountTransference from: senderAccount to: recipientAccount for: 60 * peso.
		
	self assert: senderAccount balance equals: 0 * peso.
	self assert: recipientAccount balance equals: 120 * peso.	
	! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 14:11:39'!
test08TransferenceWithZeroPesos
	
	| senderAccount recipientAccount |
	senderAccount := ReceptiveAccount new.
	recipientAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	
	self should: [ AccountTransference from: senderAccount to: recipientAccount for: 0 * peso ]
	raise: Error
	withExceptionDo: [ :anError |
		self assert: anError messageText = AccountTransference invalidTransferenceErrorMessage.	
	].! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'initialization' stamp: 'fm 7/7/2021 11:50:26'!
initializeFor: aValue

	value := aValue! !


!AccountTransaction methodsFor: 'testing' stamp: 'fm 7/7/2021 13:50:58'!
effectOnBalance: anAccountBalance
	
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'testing' stamp: 'fm 7/7/2021 11:48:00'!
value 

	^value! !

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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'account' stamp: 'fm 7/7/2021 11:48:59'!
effectOnBalance: anAccountBalance

	^anAccountBalance + self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'value' stamp: 'fm 7/7/2021 11:49:38'!
effectOnBalance: anAccountBalance

	^anAccountBalance - self value.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #AccountTransference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransference
	instanceVariableNames: 'depositPart withdrawPart value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransference methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 23:23:03'!
depositPart

 	^depositPart ! !

!AccountTransference methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 20:18:28'!
initializeFrom: senderAccount to: recipientAccount for: anAmount

	value := anAmount.
	depositPart := TransferenceDepositPart associatedWith: self.
	withdrawPart := TransferenceWithdrawPart associatedWith: self.
	
	recipientAccount register: depositPart.
	senderAccount register: withdrawPart.
	! !

!AccountTransference methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 20:14:28'!
value

	^value.! !

!AccountTransference methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 23:23:18'!
withdrawPart

 	^withdrawPart ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransference class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransference class
	instanceVariableNames: ''!

!AccountTransference class methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 20:06:28'!
from: senderAccount to: recipientAccount for: anAmount

	(anAmount isZero) ifTrue: [self error: AccountTransference invalidTransferenceErrorMessage].
	^self new initializeFrom: senderAccount to: recipientAccount for: anAmount.
	! !

!AccountTransference class methodsFor: 'as yet unclassified' stamp: 'IAM 7/7/2021 02:24:37'!
invalidTransferenceErrorMessage

	^'No es posible realizar esta transferencia.'! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 20:29:12'!
addReceptiveAccount: anAccount

	accounts add: anAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 20:29:16'!
balance

	^accounts inject: 0 * peso into: [:totalBalance :anAccount | totalBalance + anAccount balance]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'IAM 7/8/2021 01:55:41'!
hasRegistered: aTransaction

	accounts do: [ :anAccount |
		(anAccount hasRegistered: aTransaction) ifTrue: [^true]
	].
	^false.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 20:30:53'!
initialize
	
	accounts := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'IAM 7/8/2021 00:11:31'!
removeReceptiveAccount: anAccount

	accounts remove: anAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'IAM 7/8/2021 02:35:27'!
transactions

	| allTransactions |
	allTransactions := OrderedCollection new.
	accounts do: [ :anAccount |
		anAccount transactions do: [ :aTransaction |
			allTransactions add: aTransaction
		]
	].

	^allTransactions.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'fm 7/7/2021 11:56:50'!
balance

	^transactions inject: 0 * peso into: [:runningBalance :aTransaction | aTransaction effectOnBalance: runningBalance ]! !

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



!classDefinition: #TransferencePart category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferencePart
	instanceVariableNames: 'associatedTransference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferencePart methodsFor: 'as yet unclassified' stamp: 'IAM 7/6/2021 23:20:44'!
counterpart

	self subclassResponsibility.! !

!TransferencePart methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 13:48:23'!
effectOnBalance: anAccountBalance

	self subclassResponsibility.! !

!TransferencePart methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 20:17:14'!
initializeWith: aTransference

	associatedTransference := aTransference.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferencePart class' category: 'ServiciosFinancieros-Ejercicio'!
TransferencePart class
	instanceVariableNames: ''!

!TransferencePart class methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 20:17:14'!
associatedWith: aTransference

	^self new initializeWith: aTransference.
! !


!classDefinition: #TransferenceDepositPart category: 'ServiciosFinancieros-Ejercicio'!
TransferencePart subclass: #TransferenceDepositPart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceDepositPart methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 13:47:11'!
counterpart

	^associatedTransference withdrawPart.! !

!TransferenceDepositPart methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 20:19:31'!
effectOnBalance: anAccountBalance

	^anAccountBalance + associatedTransference value.! !


!classDefinition: #TransferenceWithdrawPart category: 'ServiciosFinancieros-Ejercicio'!
TransferencePart subclass: #TransferenceWithdrawPart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceWithdrawPart methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 13:47:11'!
counterpart

	^associatedTransference depositPart.! !

!TransferenceWithdrawPart methodsFor: 'as yet unclassified' stamp: 'fm 7/7/2021 20:19:39'!
effectOnBalance: anAccountBalance

	^anAccountBalance - associatedTransference value.! !
