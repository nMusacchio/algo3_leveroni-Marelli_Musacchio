!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'aPortfolio firstAccount secondAccount childPortfolio parentPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'IAM 7/8/2021 15:40:30'!
setUp

	aPortfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	childPortfolio := Portfolio new.
	parentPortfolio := Portfolio new.! !

!PortfolioTest methodsFor: 'tests' stamp: 'IAM 7/8/2021 15:20:58'!
test01EmptyPortfolioHasZeroBalance
	self assert: aPortfolio balance equals: 0 * peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'IAM 7/8/2021 15:21:16'!
test02EmptyPortfolioHasNoTransactions

	self assert: aPortfolio transactions isEmpty.! !

!PortfolioTest methodsFor: 'tests' stamp: 'IAM 7/8/2021 15:21:46'!
test03EmptyPortfolioDoesntRegisterTransaction

	| account deposit |
	account := ReceptiveAccount new.
	deposit := Deposit register: 20*peso on: account.
	
	self deny: (aPortfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:11:45'!
test04BalanceIsCorrectWithOneAccount

	| account |
	account := ReceptiveAccount new.
	Deposit register: 20*peso on: account.

	aPortfolio addAccount: account.	
	self assert: (aPortfolio balance) equals: 20 * peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:11:52'!
test05PortfolioWithAccountRegistersTransaction
	| account deposit |
	account := ReceptiveAccount new.
	deposit := Deposit register: 20*peso on: account.	
	aPortfolio addAccount: account.	
	
	self assert: (aPortfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:12:05'!
test06PortfolioWithOneAccountAndMultipleTransactionsGivesCorrectTransactionsList

	| account firstDeposit secondDeposit |
	account := ReceptiveAccount new.	
	firstDeposit := Deposit register: 40*peso on: account.
	secondDeposit := Deposit register: 70*peso on: account.
	aPortfolio addAccount: account.
	self assert: 2 equals: aPortfolio transactions size.
	self assert: (aPortfolio transactions includes: firstDeposit).
	self assert: (aPortfolio transactions includes: secondDeposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:12:15'!
test07BalanceIsCorrectWithMultipleAccounts
	Deposit register: 100*peso on: firstAccount .
	Withdraw register: 20*peso on: firstAccount .
	Deposit register: 40*peso on: secondAccount .	
	aPortfolio addAccount: firstAccount.
	aPortfolio addAccount: secondAccount.
	
	self assert: (aPortfolio balance) equals: 120 * peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:12:35'!
test08PortfolioWithMultipleAccountsAndMultipleTransactionsGivesCorrectTransactionsList
	| deposit transference withdraw |
	deposit := Deposit register: 80*peso on: firstAccount .
	transference := AccountTransference from: firstAccount to: secondAccount for: (10 * peso).
	withdraw := Withdraw register: 20*peso on: firstAccount.
	
	aPortfolio addAccount: firstAccount.
	aPortfolio addAccount: secondAccount.	
	self assert: 4 equals: aPortfolio transactions size.
	self assert: (aPortfolio transactions includes: deposit).
	self assert: (aPortfolio transactions includes: transference withdrawPart).
	self assert: (aPortfolio transactions includes: transference depositPart).
	self assert: (aPortfolio transactions includes: withdraw).! !

!PortfolioTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:12:45'!
test09PortfolioWithMultipleAccountsAndMultipleTransactionsHasRegisteredTransaction
	| deposit |
	deposit := Deposit register: 80*peso on: firstAccount .
	AccountTransference from: firstAccount to: secondAccount for: (10 * peso).
	aPortfolio addAccount: firstAccount.
	aPortfolio addAccount: secondAccount .	
	self assert: (aPortfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'IAM 7/8/2021 15:40:30'!
test10PortfolioWithEmptyPortfolioHasZeroBalance
	parentPortfolio := Portfolio new.
	childPortfolio := Portfolio new.
	parentPortfolio addAccount: childPortfolio.
	
	self assert: parentPortfolio balance equals: 0 * peso.
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'IAM 7/8/2021 15:40:30'!
test11PortfolioWithEmptyPortfolioHasZeroTransactions
	parentPortfolio addAccount: childPortfolio.
	
	self assert: parentPortfolio transactions isEmpty.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:12:59'!
test12PortfolioWithPortfolioWithOneAccountHasCorrectBalance
	Deposit register: 70 * peso on: firstAccount .

	childPortfolio addAccount: firstAccount.
	parentPortfolio addAccount: childPortfolio.	
	self assert: parentPortfolio balance equals: 70* peso.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:13:18'!
test13PortfolioWithPortfolioWithOneAccountGivesCorrectTransactionList

	| deposit withdraw |
	deposit := Deposit register: 70 * peso on: firstAccount.
	withdraw := Withdraw register: 10 * peso on: firstAccount.	
	childPortfolio addAccount: firstAccount .
	parentPortfolio addAccount: childPortfolio.
	
	self assert: parentPortfolio transactions size equals: 2.
	self assert: parentPortfolio transactions includes: deposit.
	self assert: parentPortfolio transactions includes: withdraw.	! !

!PortfolioTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:13:27'!
test14PortfolioWithPortfolioWithOneAccountHasRegisteredTransaction

	| deposit |
	deposit := Deposit register: 70 * peso on: firstAccount .
	Withdraw register: 10 * peso on: firstAccount.	
	childPortfolio addAccount: firstAccount.
	parentPortfolio addAccount: childPortfolio.	
	self assert: (parentPortfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:13:41'!
test15PortfolioWithMultipleAccountsGivesCorrectBalance
	Deposit register: 70 * peso on: firstAccount .
	AccountTransference from: firstAccount to: secondAccount for: 50*peso.
	
	parentPortfolio addAccount: firstAccount.
	childPortfolio addAccount: secondAccount.
	parentPortfolio addAccount: childPortfolio.	
	self assert: parentPortfolio balance equals: 70 * peso.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'fm 7/8/2021 17:58:09'!
setUp

	account := ReceptiveAccount new.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'fm 7/8/2021 17:58:09'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	account := ReceptiveAccount new.
	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'fm 7/8/2021 17:58:09'!
test02DepositIncreasesBalanceOnTransactionValue 
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'fm 7/8/2021 17:58:09'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:13:53'!
test04WithdrawValueMustBePositive 

	| withdrawValue |
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:14:01'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	|  deposit withdraw |
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:14:06'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw |
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:14:11'!
test07AccountKnowsItsTransactions 

	| deposit |
	account := ReceptiveAccount new.
	deposit := Deposit register: 50 * peso on: account.
	
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: 'senderAccount recipientAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:01:20'!
setUp
	
	senderAccount := ReceptiveAccount new.
	recipientAccount := ReceptiveAccount new.! !

!TransferenceTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:14:32'!
test01TransferenceAffectsInvolvedAccountsBalanceCorrectly
	senderAccount := ReceptiveAccount new.
	recipientAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	Deposit register: 100 * peso on: recipientAccount .
	AccountTransference from: senderAccount to: recipientAccount for: 40 * peso. 	
	self assert: senderAccount balance equals: (60 * peso).
	self assert: recipientAccount balance equals: (140 * peso).! !

!TransferenceTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:14:38'!
test02TransferenceIsForCorrectValue
	| transference |
	Deposit register: 100 * peso on: senderAccount.
	transference := AccountTransference from: senderAccount to: recipientAccount for: 70 * peso. 	
	self assert: transference value equals: 70 * peso.! !

!TransferenceTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:14:43'!
test03DepositPartIsRegisteredOnRecipientAccount
	
	| transference depositPart |
	Deposit register: 100 * peso on: senderAccount.
	transference := AccountTransference from: senderAccount to: recipientAccount for: 80 * peso.
	depositPart := transference depositPart.

	self assert: (recipientAccount hasRegistered: depositPart).! !

!TransferenceTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:14:48'!
test04WithdrawPartIsRegisteredOnSenderAccount
	
	| transference withdrawPart |
	Deposit register: 100 * peso on: senderAccount.
	transference := AccountTransference from: senderAccount to: recipientAccount for: 80 * peso.
	withdrawPart := transference withdrawPart .	
	self assert: (senderAccount hasRegistered: withdrawPart).! !

!TransferenceTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:14:55'!
test05WithdrawPartsCounterpartIsDepositPart
	
	| transference depositPart withdrawPart |
	Deposit register: 100 * peso on: senderAccount.
	transference := AccountTransference from: senderAccount to: recipientAccount for: 80 * peso.
	withdrawPart := transference withdrawPart.
	depositPart := transference depositPart.
	
	self assert: withdrawPart counterpart equals: depositPart.! !

!TransferenceTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:15:02'!
test06DepositPartsCounterpartIsWithdrawPart
	
	| transference depositPart withdrawPart |
	Deposit register: 100 * peso on: senderAccount.
	transference := AccountTransference from: senderAccount to: recipientAccount for: 80 * peso.
	withdrawPart := transference withdrawPart.
	depositPart := transference depositPart.	
	self assert: depositPart counterpart equals: withdrawPart.! !

!TransferenceTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:15:08'!
test07MultipleTransferences
	Deposit register: 100 * peso on: senderAccount.
	Deposit register: 20 * peso on: recipientAccount .
	AccountTransference from: senderAccount to: recipientAccount for: 40 * peso. 
	AccountTransference from: senderAccount to: recipientAccount for: 60 * peso.		
	self assert: senderAccount balance equals: 0 * peso.
	self assert: recipientAccount balance equals: 120 * peso.	
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'fm 7/8/2021 18:15:18'!
test08TransferenceWithZeroPesos
	senderAccount := ReceptiveAccount new.
	recipientAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	self should: [ AccountTransference from: senderAccount to: recipientAccount for: 0 * peso ]
	raise: Error
	withExceptionDo: [ :anError |
		self assert: anError messageText = AccountTransference invalidTransferenceErrorMessage.	
	].! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'transactions' stamp: 'fm 7/8/2021 13:36:36'!
hasRegistered: aTransaction
	
	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'fm 7/8/2021 13:35:57'!
transactions

	self subclassResponsibility.! !


!Account methodsFor: 'balance' stamp: 'fm 7/8/2021 13:36:05'!
balance

	self subclassResponsibility.! !


!Account methodsFor: 'composite accounts' stamp: 'fm 7/8/2021 13:43:02'!
addAccount: anAccount

	! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'transactions' stamp: 'fm 7/8/2021 13:28:53'!
hasRegistered: aTransaction

	accounts do: [ :anAccount |
		(anAccount hasRegistered: aTransaction) ifTrue: [^true]
	].
	^false.! !

!Portfolio methodsFor: 'transactions' stamp: 'fm 7/8/2021 18:11:00'!
transactions

	| allTransactions |
	allTransactions := OrderedCollection new.
	accounts do: [ :anAccount | allTransactions addAll: anAccount transactions].
	^allTransactions.! !


!Portfolio methodsFor: 'composite accounts' stamp: 'fm 7/8/2021 12:38:48'!
addAccount: anAccount

	accounts add: anAccount.! !


!Portfolio methodsFor: 'balance' stamp: 'fm 7/8/2021 18:06:33'!
balance
	^accounts inject: 0 * peso into: [:runningBalance :anAccount | runningBalance + anAccount balance]! !


!Portfolio methodsFor: 'initialization' stamp: 'fm 7/8/2021 12:39:09'!
initialize

	accounts := OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'fm 7/8/2021 13:45:12'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'fm 7/8/2021 13:35:07'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'fm 7/8/2021 13:40:21'!
register: aTransaction

	transactions add: aTransaction ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'fm 7/8/2021 12:57:10'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'fm 7/7/2021 11:56:50'!
balance

	^transactions inject: 0 * peso into: [:runningBalance :aTransaction | aTransaction effectOnBalance: runningBalance ]! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'initialization' stamp: 'fm 7/7/2021 11:50:26'!
initializeFor: aValue

	value := aValue! !


!AccountTransaction methodsFor: 'value' stamp: 'fm 7/7/2021 13:50:58'!
effectOnBalance: anAccountBalance
	
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'value' stamp: 'fm 7/7/2021 11:48:00'!
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

!Deposit methodsFor: 'balance' stamp: 'fm 7/7/2021 11:48:59'!
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

!Withdraw methodsFor: 'balance' stamp: 'fm 7/7/2021 11:49:38'!
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

!AccountTransference methodsFor: 'initialization' stamp: 'fm 7/8/2021 18:11:26'!
initializeFrom: senderAccount to: recipientAccount for: anAmount
	value := anAmount.
	depositPart := TransferenceDepositPart associatedWith: self.
	withdrawPart := TransferenceWithdrawPart associatedWith: self.	
	recipientAccount register: depositPart.
	senderAccount register: withdrawPart.
	! !


!AccountTransference methodsFor: 'value' stamp: 'fm 7/7/2021 20:14:28'!
value

	^value.! !


!AccountTransference methodsFor: 'parts' stamp: 'IAM 7/6/2021 23:23:03'!
depositPart

 	^depositPart ! !

!AccountTransference methodsFor: 'parts' stamp: 'IAM 7/6/2021 23:23:18'!
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


!classDefinition: #TransferencePart category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferencePart
	instanceVariableNames: 'associatedTransference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferencePart methodsFor: 'initialization' stamp: 'fm 7/7/2021 20:17:14'!
initializeWith: aTransference

	associatedTransference := aTransference.! !


!TransferencePart methodsFor: 'balance' stamp: 'fm 7/7/2021 13:48:23'!
effectOnBalance: anAccountBalance

	self subclassResponsibility.! !


!TransferencePart methodsFor: 'part' stamp: 'IAM 7/6/2021 23:20:44'!
counterpart

	self subclassResponsibility.! !

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

!TransferenceDepositPart methodsFor: 'part' stamp: 'fm 7/7/2021 13:47:11'!
counterpart

	^associatedTransference withdrawPart.! !


!TransferenceDepositPart methodsFor: 'balance' stamp: 'fm 7/7/2021 20:19:31'!
effectOnBalance: anAccountBalance

	^anAccountBalance + associatedTransference value.! !


!classDefinition: #TransferenceWithdrawPart category: 'ServiciosFinancieros-Ejercicio'!
TransferencePart subclass: #TransferenceWithdrawPart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceWithdrawPart methodsFor: 'balance' stamp: 'fm 7/7/2021 20:19:39'!
effectOnBalance: anAccountBalance

	^anAccountBalance - associatedTransference value.! !


!TransferenceWithdrawPart methodsFor: 'part' stamp: 'fm 7/7/2021 13:47:11'!
counterpart

	^associatedTransference depositPart.! !
