Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [
	|attackSquares moveSquares legalSquares|
	legalSquares := OrderedCollection new.
	moveSquares := OrderedCollection new.
	attackSquares := OrderedCollection new.
	(self isWhite
		   ifTrue: [ moveSquares add: square up . attackSquares add:  square up right; add: square up left  ]
		   ifFalse: [ moveSquares add:  square down . attackSquares add: square down right; add: square down left  ]
	).
	
	legalSquares addAll: (moveSquares select: [ :s | s notNil and: [ s hasPiece not ] ]).
	legalSquares addAll: (attackSquares  select:  [ :s | s notNil and: [s hasPiece and: [ s contents color ~= color ] ]]).
	
	^legalSquares 
]
