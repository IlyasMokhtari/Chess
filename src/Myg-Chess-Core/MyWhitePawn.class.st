Class {
	#name : 'MyWhitePawn',
	#superclass : 'MyPawn',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'initialization' }
MyWhitePawn >> attackSquare [ 
	|squareList|
	squareList := OrderedCollection new.
	squareList add: square up left;
	add: square up right.
	
   squareList:= squareList select: [ :s | s notNil and: [  s hasPiece and: [ s contents color ~= color] ]].
   squareList addAll: self enPassant .
	^squareList
]

{ #category : 'as yet unclassified' }
MyWhitePawn >> defaultMove [
	|squareList|
	squareList := OrderedCollection new.
	squareList add: square up.
	^squareList reject: [:s | s hasPiece].
]

{ #category : 'as yet unclassified' }
MyWhitePawn >> enPassant [
	^self enPassantSquare collect: [ :s | s up ]
]

{ #category : 'as yet unclassified' }
MyWhitePawn >> firstMove [ 
	|squareList firstSquare |
	squareList := OrderedCollection new.
	firstSquare:= square up.
	firstSquare hasPiece ifTrue: [ ^ squareList].
	squareList add: firstSquare.
	
	firstSquare up hasPiece ifFalse: [ squareList add: firstSquare up ].
	^squareList.
]

{ #category : 'initialization' }
MyWhitePawn >> initialize [ 
	super initialize.
	color:= Color white
]

{ #category : 'accessing' }
MyWhitePawn >> moveTo: aSquare [
    movedTwoSquare := square up up == aSquare.
    super moveTo: aSquare
]
