!classDefinition: #Caja category: 'EjercicioFactorio'!
DenotativeObject subclass: #Caja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Caja class' category: 'EjercicioFactorio'!
Caja class
	instanceVariableNames: 'contenido'!

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:07:37'!
agregar: unaMena
	contenido add: unaMena.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:42:38'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'IAM 5/3/2021 20:25:40'!
cantidadDeContenido
	
	^contenido size.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:08:26'!
cantidadDeMenas
	^contenido size.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 19:29:48'!
cantidadDeMenasDeCarbon
	^contenido count: [:unaMena | unaMena = 'una mena de carbon'].! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 19:27:14'!
cantidadDeMenasDeHierro
	^contenido count: [:unaMena | unaMena = 'una mena de hierro'].! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 15:09:25'!
contenido

	^contenido! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'IAM 5/7/2021 12:12:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: 'una mena de carbon'; yourself).! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:09:06'!
vaciar
	contenido := OrderedCollection new.! !


!classDefinition: #CintaA category: 'EjercicioFactorio'!
DenotativeObject subclass: #CintaA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaA class' category: 'EjercicioFactorio'!
CintaA class
	instanceVariableNames: 'contenido destinoCinta destino'!

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IAM 5/3/2021 21:23:31'!
agregarMenas: aCollectionOfMenas

	^contenido addAll: aCollectionOfMenas.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IAM 5/3/2021 21:48:34'!
cantidadDeMenas

	^ contenido size.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IAM 5/3/2021 21:18:12'!
destino: unDestino 
	
	destinoCinta := unDestino! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IAM 5/7/2021 12:12:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new)).
	destinoCinta := Caja.
	destino := nil.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 19:24:21'!
transportar
	
	destinoCinta agregarMenas: contenido.
	self vaciar.
	
	^contenido.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IAM 5/3/2021 21:51:25'!
vaciar

	contenido := OrderedCollection new.! !


!classDefinition: #CintaB category: 'EjercicioFactorio'!
DenotativeObject subclass: #CintaB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaB class' category: 'EjercicioFactorio'!
CintaB class
	instanceVariableNames: 'contenido destinoCinta destino'!

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:11'!
agregarMenas: aCollectionOfMenas

	^contenido addAll: aCollectionOfMenas.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:11'!
cantidadDeMenas

	^ contenido size.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:11'!
destino: unDestino 
	
	destinoCinta := unDestino! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IAM 5/7/2021 12:12:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new)).
	destinoCinta := Caja.
	destino := nil.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 19:25:50'!
transportar
	
	destinoCinta agregarMenas: contenido.
	self vaciar.
	
	^contenido.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:11'!
vaciar

	contenido := OrderedCollection new.! !


!classDefinition: #ExtractorDeCarbon category: 'EjercicioFactorio'!
DenotativeObject subclass: #ExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeCarbon class' category: 'EjercicioFactorio'!
ExtractorDeCarbon class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:23:04'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:44:58'!
conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de carbon'! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:49'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:29:41'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:21:02'!
energiaActual

	^energiaActual.
! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:29'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:34:57'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas).! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IAM 5/7/2021 12:12:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := Caja.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:27'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:36:12'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:57'!
sacarEnergia: energiaASacar
	energiaActual := energiaActual - energiaASacar! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IAM 4/18/2021 15:40:43'!
setearCosteDeExtraccion: coste
	costeDeExtraccion := coste.
	^coste! !


!classDefinition: #ExtractorDeHierro category: 'EjercicioFactorio'!
DenotativeObject subclass: #ExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeHierro class' category: 'EjercicioFactorio'!
ExtractorDeHierro class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:21'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:40'!
conjuntoDeMenasDeHierroCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de hierro'! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:21'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:21'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:21'!
energiaActual

	^energiaActual.
! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:21'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:59'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeHierroCantidad: cantidadDeMenas).! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/7/2021 12:12:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := CintaB.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:21'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:21'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:21'!
sacarEnergia: energiaASacar
	energiaActual := energiaActual - energiaASacar! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:21'!
setearCosteDeExtraccion: coste
	costeDeExtraccion := coste.
	^coste! !


!classDefinition: #PruebasDeExtractorDeCarbon category: 'EjercicioFactorio'!
DenotativeObject subclass: #PruebasDeExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeExtractorDeCarbon class' category: 'EjercicioFactorio'!
PruebasDeExtractorDeCarbon class
	instanceVariableNames: ''!

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:37:39'!
setUp
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:41:43'!
test01UnExtractorSinEnergiaNoExtraeMenas
	"Cuando no cargue energia en el extractor, no saco menas"
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:46:54'!
test02UnExtractorConInsuficienteEnergiaNoExtraeMenas
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 1 * joule.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:47:56'!
test03UnExtractorConSuficienteEnergiaExtrae1Mena
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:49:57'!
test04UnExtractorConservaLaEnergiaNoUtilizada
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 7 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 2 * joule.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:50:53'!
test05UnExtractorPuedeExtraerMultiplesMenasConMuchaEnergia
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 50 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 10.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 0 * joule.
! !


!classDefinition: #PruebasDeFactorio category: 'EjercicioFactorio'!
DenotativeObject subclass: #PruebasDeFactorio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeFactorio class' category: 'EjercicioFactorio'!
PruebasDeFactorio class
	instanceVariableNames: ''!

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 19:28:48'!
testEscenarioExtractorCaja
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.
	ExtractorDeCarbon extraer.
	Assert that: Caja cantidadDeMenas isEqualTo: 1.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 19:24:44'!
testEscenarioExtractorCintaCaja
	
	| cantidadDeMenasDeCarbon |
	
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: CintaA.
	CintaA vaciar.
	CintaA destino: Caja.
	Caja vaciar.
	ExtractorDeCarbon extraer.
	"Se pasa el carbon a la cinta, por lo que debería haber una mena en la cinta"
	Assert that: CintaA cantidadDeMenas isEqualTo: 1.
	
	CintaA transportar.
	
	"La cinta deja de tener una mena, y esta pasa a la caja"
	cantidadDeMenasDeCarbon := Caja contenido count: [:unaMena | unaMena = 'una mena de carbon'].
	Assert that: CintaA cantidadDeMenas isEqualTo: 0.
	Assert that: Caja cantidadDeMenas isEqualTo: 1.
	Assert that: cantidadDeMenasDeCarbon isEqualTo: 1.! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 19:27:57'!
testEscenarioExtractorExtractorCintaCintaCaja

	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeHierro agregarEnergia: 5 * joule.
	
	ExtractorDeCarbon destino: CintaA.
	ExtractorDeHierro destino: CintaB.
	
	CintaA vaciar.
	CintaB vaciar.
	
	CintaA destino: Caja.
	CintaB destino: Caja.
	
	Caja vaciar.
	
	ExtractorDeCarbon extraer.
	ExtractorDeHierro extraer.
	"Las cintas tienen 1 mena cada una"
	Assert that: CintaA cantidadDeMenas isEqualTo: 1.
	Assert that: CintaB cantidadDeMenas isEqualTo: 1.
	
	CintaA transportar.
	CintaB transportar.
	
	"Las cintas depositaron su mena en la caja"
	Assert that: CintaA cantidadDeMenas isEqualTo: 0.
	Assert that: CintaB cantidadDeMenas isEqualTo: 0.
	Assert that: Caja cantidadDeMenas isEqualTo: 2.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.
	Assert that: Caja cantidadDeMenasDeHierro isEqualTo: 1.! !

Caja initializeAfterFileIn!
CintaA initializeAfterFileIn!
CintaB initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!
ExtractorDeHierro initializeAfterFileIn!