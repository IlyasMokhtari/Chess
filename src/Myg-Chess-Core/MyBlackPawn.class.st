Class {
	#name : 'MyBlackPawn',
	#superclass : 'MyPawn',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyBlackPawn >> FirstMove [ 
	|squareList|
	squareList := OrderedCollection new.
	squareList add: square down;
	add: square down down.
	^squareList.

	
]

{ #category : 'as yet unclassified' }
MyBlackPawn >> defaultMove [ 
	|squareList|
	squareList := OrderedCollection new.
	squareList add: square down.
	^squareList.

	
]

{ #category : 'initialization' }
MyBlackPawn >> initialize [ 
	super initialize.
	color:= Color black
]
