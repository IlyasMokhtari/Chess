Class {
	#name : 'MyKnight',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyKnight >> id [
	
	^ 'N'
]

{ #category : 'rendering' }
MyKnight >> renderPieceOn: aSquare [

	^ aSquare renderKnight: self
]

{ #category : 'rendering' }
MyKnight >> targetSquaresLegal: aBoolean [

	^ {
		  (square right isSquare ifTrue: [ :p | p right isSquare ifTrue: #up ]).
		  (square right isSquare ifTrue: [ :p | p right isSquare ifTrue: #down ]).
		  (square left isSquare ifTrue: [ :p | p left isSquare ifTrue: #up ]).
		  (square left isSquare ifTrue: [ :p | p left isSquare ifTrue: #down ]).
		  (square up isSquare ifTrue: [ :p | p up isSquare ifTrue: #left ]).
		  (square up isSquare ifTrue: [ :p | p up isSquare ifTrue: #right ]).
		  (square down isSquare ifTrue: [ :p | p down isSquare ifTrue: #left ]).
		  (square down isSquare ifTrue: [ :p | p down isSquare ifTrue: #right ]) }
		  select: [ :s |
			  s notNil and: [ s hasPiece not or: [ s contents color ~= color ] ] ]
]
