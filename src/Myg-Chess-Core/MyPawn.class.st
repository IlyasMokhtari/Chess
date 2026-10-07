Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#instVars : [
		'moveStrategy'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> attackSquare [
	self subclassResponsibility.
]

{ #category : 'as yet unclassified' }
MyPawn >> defaultMove [
	self subclassResponsibility.
]

{ #category : 'accessing' }
MyPawn >> firstMove [
	self subclassResponsibility.
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'initialization' }
MyPawn >> initialize [ 
	super initialize.
	moveStrategy := [ self firstMove ].
	
]

{ #category : 'accessing' }
MyPawn >> moveStrategy [
 ^ moveStrategy
]

{ #category : 'accessing' }
MyPawn >> moveTo: aSquare [
	super moveTo: aSquare.
	moveStrategy := [ self defaultMove , self attackSquare ]
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [
	^ moveStrategy value
]
