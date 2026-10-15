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
	^squareList reject: [:s | s hasPiece].
]

{ #category : 'as yet unclassified' }
MyWhitePawn >> enPassant [
	enPassantSquare :=self enPassantSquare collect: [ :s | s up].
	^enPassantSquare.
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
	|result  temp|
    movedTwoSquare := square up up == aSquare.
	temp:= enPassantSquare.
    result :=super moveTo: aSquare.
	 temp size ==0 ifFalse:[(self square = temp first) ifTrue: [self square down emptyContents ]].
	^result.
]

{ #category : 'initialization' }
MyWhitePawn >> possibleAttackSquare [ 
	|squareList|
	squareList := OrderedCollection new.
	squareList add: square up left;
	add: square up right.
	^squareList
]
