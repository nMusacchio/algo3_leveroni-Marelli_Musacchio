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

!Caja class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:13:00'!
agregar: unaMena
	
	^contenido add: unaMena.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:13:10'!
agregarMenas: aCollectionOfMenas
	
	^contenido addAll: aCollectionOfMenas.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:16:33'!
cantidadDeContenido
	
	^contenido size.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'IAM 5/9/2021 20:23:27'!
cantidadDeMenasDeTipo: tipo
	
	^contenido count: [:unaMena | unaMena = tipo].! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 15:09:25'!
contenido

	^contenido! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'IAM 5/9/2021 20:23:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: 'una mena de carbon'; yourself).! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:17:32'!
vaciar
	
	^contenido := OrderedCollection new.! !


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

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:16:33'!
cantidadDeContenido

	^ contenido size.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:12:41'!
destino: nuevoDestino 
	
	^destinoCinta := nuevoDestino.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IAM 5/9/2021 20:23:57'!
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

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:12:35'!
vaciar

	^contenido := OrderedCollection new.! !


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

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:16:33'!
cantidadDeContenido

	^ contenido size.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:12:06'!
destino: nuevoDestino 
	
	^destinoCinta := nuevoDestino.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IAM 5/9/2021 20:23:57'!
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

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:12:18'!
vaciar

	^contenido := OrderedCollection new.! !


!classDefinition: #ExtractorDeCarbon category: 'EjercicioFactorio'!
DenotativeObject subclass: #ExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeCarbon class' category: 'EjercicioFactorio'!
ExtractorDeCarbon class
	instanceVariableNames: 'destino energiaActual costoPorMena'!

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:23:04'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 16:51:51'!
conjuntoDeMenas: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de carbon'! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:08:57'!
costoDeExtraccionPorMena
	
	^ costoPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:11:10'!
destino: nuevoDestino 
	
	^destino := nuevoDestino.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:21:02'!
energiaActual

	^energiaActual.
! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:09:48'!
energiaParaExtraerTodasLasMenasPosibles
	
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:09:56'!
extraer
	| cantidadDeMenas energiaConsumida |
	
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenas: cantidadDeMenas).! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IAM 5/9/2021 20:23:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := Caja.
	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	costoPorMena := (SimpleMeasure basicNew instVarAt: 1 put: 5; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:10:00'!
menasAExtraerSegunEnergiaActual
	
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 16:56:24'!
nuevoCostoDeExtraccion: costo

	^costoPorMena := costo ! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:10:31'!
ponerEnCeroLaEnergia
	
	^energiaActual := 0 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:10:36'!
sacarEnergia: energiaASacar
	
	^energiaActual := energiaActual - energiaASacar! !


!classDefinition: #ExtractorDeHierro category: 'EjercicioFactorio'!
DenotativeObject subclass: #ExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeHierro class' category: 'EjercicioFactorio'!
ExtractorDeHierro class
	instanceVariableNames: 'destino energiaActual costoPorMena'!

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:21'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 16:51:28'!
conjuntoDeMenas: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de hierro'! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:10:48'!
costoDeExtraccionPorMena
	
	^costoPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:11:05'!
destino: nuevoDestino 
	
	^destino := nuevoDestino.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/6/2021 14:08:21'!
energiaActual

	^energiaActual.
! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:11:16'!
energiaParaExtraerTodasLasMenasPosibles
	
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:11:21'!
extraer
	| cantidadDeMenas energiaConsumida |
	
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenas: cantidadDeMenas).! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/9/2021 20:23:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := CintaB.
	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 4; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	costoPorMena := (SimpleMeasure basicNew instVarAt: 1 put: 5; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:11:25'!
menasAExtraerSegunEnergiaActual
	
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 16:59:14'!
nuevoCostoDeExtraccion: costo
	
	^costoPorMena := costo.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:11:31'!
ponerEnCeroLaEnergia
	
	^energiaActual := 0 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IAM 5/8/2021 17:11:35'!
sacarEnergia: energiaASacar
	
	^energiaActual := energiaActual - energiaASacar! !


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

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'IAM 5/9/2021 20:23:27'!
testEscenarioExtractorCaja

	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon nuevoCostoDeExtraccion: 5 * joule.
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.
	
	ExtractorDeCarbon extraer.
	
	Assert that: Caja cantidadDeContenido isEqualTo: 1.
	Assert that: (Caja cantidadDeMenasDeTipo: 'una mena de carbon') isEqualTo: 1.! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'IAM 5/9/2021 20:23:27'!
testEscenarioExtractorCintaCaja
	
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 64 * joule.
	ExtractorDeCarbon nuevoCostoDeExtraccion: 5 * joule.
	ExtractorDeCarbon destino: CintaA.
	CintaA vaciar.
	CintaA destino: Caja.
	Caja vaciar.
	
	ExtractorDeCarbon extraer.
	CintaA transportar.
	
	Assert that: CintaA cantidadDeContenido isEqualTo: 0.
	Assert that: Caja cantidadDeContenido isEqualTo: 12.
	Assert that: (Caja cantidadDeMenasDeTipo: 'una mena de carbon') isEqualTo: 12.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 4 * joule.! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'IAM 5/9/2021 20:23:27'!
testEscenarioExtractorExtractorCintaCintaCaja

	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 12 * joule.
	ExtractorDeCarbon nuevoCostoDeExtraccion: 5 * joule.
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeHierro agregarEnergia: 19 * joule.
	ExtractorDeHierro nuevoCostoDeExtraccion: 5 * joule.
	ExtractorDeCarbon destino: CintaA.
	ExtractorDeHierro destino: CintaB.	
	CintaA vaciar.
	CintaB vaciar.
	CintaA destino: Caja.
	CintaB destino: Caja.
	Caja vaciar.
	
	ExtractorDeCarbon extraer.
	ExtractorDeHierro extraer.
	CintaA transportar.
	CintaB transportar.
	
	Assert that: CintaA cantidadDeContenido isEqualTo: 0.
	Assert that: CintaB cantidadDeContenido isEqualTo: 0.
	Assert that: Caja cantidadDeContenido isEqualTo: 5.
	Assert that: (Caja cantidadDeMenasDeTipo: 'una mena de hierro') isEqualTo: 3.
	Assert that: (Caja cantidadDeMenasDeTipo: 'una mena de carbon') isEqualTo: 2.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 2 * joule.
	Assert that: ExtractorDeHierro energiaActual isEqualTo: 4 * joule.! !

Caja initializeAfterFileIn!
CintaA initializeAfterFileIn!
CintaB initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!
ExtractorDeHierro initializeAfterFileIn!