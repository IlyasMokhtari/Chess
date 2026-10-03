Class {
	#name : 'MyWhitePawn',
	#superclass : 'MyPawn',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyWhitePawn >> defaultMove [
	|squareList|
	squareList := OrderedCollection new.
	squareList add: square up.
	^squareList reject: [:s | s contents hasPiece].
]

{ #category : 'as yet unclassified' }
MyWhitePawn >> firstMove [
	|squareList|
	squareList := OrderedCollection new.
	squareList add: square up;
	add: square up up.
	^squareList.
]

{ #category : 'initialization' }
MyWhitePawn >> initialize [ 
	super initialize.
	color:= Color white
]
