Class {
	#name : 'MyBlackPawn',
	#superclass : 'MyPawn',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyBlackPawn >> defaultMove [ 
	|squareList|
	squareList := OrderedCollection new.
	squareList add: square down.
	^squareList reject: [:s | s hasPiece].

	
]

{ #category : 'as yet unclassified' }
MyBlackPawn >> firstMove [ 
	|squareList firstSquare |
	squareList := OrderedCollection new.
	firstSquare:= square down.
	firstSquare hasPiece ifTrue: [ ^ squareList].
	squareList add: firstSquare.
	
	firstSquare down hasPiece ifFalse: [ squareList add: firstSquare down ].
	^squareList.


	
]

{ #category : 'initialization' }
MyBlackPawn >> initialize [ 
	super initialize.
	color:= Color black
]
