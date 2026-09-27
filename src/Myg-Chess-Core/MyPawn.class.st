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
	|listSquare|
	listSquare :=OrderedCollection new.
	self isWhite ifTrue: [  listSquare add: square up  ]
		   ifFalse: [  listSquare add: square down  ].
	^ listSquare do: [ :s|
			  s hasPiece not or: [ s contents color ~= color ] ]
	
]
