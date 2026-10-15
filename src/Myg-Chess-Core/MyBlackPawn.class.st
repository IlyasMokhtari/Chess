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
MyBlackPawn >> enPassant [
	enPassantSquare :=self enPassantSquare collect: [ :s | s down ].
	^enPassantSquare.
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

{ #category : 'accessing' }
MyBlackPawn >> moveTo: aSquare [
	|result  temp|
    movedTwoSquare := square down down == aSquare.
	temp:= enPassantSquare.
    result :=super moveTo: aSquare.
	 temp ifNotEmpty: [(self square = temp first) ifTrue: [self square up emptyContents ]].
	^result
]

{ #category : 'accessing' }
MyBlackPawn >> possibleAttackSquare [ 
	|squareList|
	squareList := OrderedCollection new.
	squareList add: square down left;
	add: square down right.
	^squareList 
]
