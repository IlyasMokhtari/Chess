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
MyPawn >> attackMove [
	|squaresList|
	squaresList := OrderedCollection new.
	(self isWhite
		   ifTrue: [ squaresList add: square up right. squaresList add: square up left ]
		   ifFalse: [ squaresList add: square down right. squaresList add:  square down left ]
	).
	^ (squaresList  select:  [ :s | s notNil and: [s hasPiece and: [ s contents color ~= color ]]]).
]

{ #category : 'accessing' }
MyPawn >> defaultMove [
	|squaresList|
	squaresList := OrderedCollection new.
	(self isWhite
		   ifTrue: [ squaresList add: square up ]
		   ifFalse: [ squaresList add: square down ]
	).
	^ (squaresList  select:  [ :s | s notNil and: s hasPiece not]).
]

{ #category : 'accessing' }
MyPawn >> firstMove [
	|squaresList|
	squaresList := OrderedCollection new.
	(self isWhite
		   ifTrue: [ squaresList add: square up. squaresList add: square up up ]
		   ifFalse: [ squaresList add: square down. squaresList add:  square down down ]
	).
	^ square up hasPiece not and:(squaresList select: [ :s | s notNil and: [ s hasPiece not ] ]).
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> initialize [ 
 super initialize.
 moveStrategy := [ self firstMove ]
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [
	|legalSquares temp|
	legalSquares := OrderedCollection new.
	
	temp := moveStrategy value.
	legalSquares addAll: (moveStrategy value).
	legalSquares addAll: self attackMove.
	
	^legalSquares 
]
