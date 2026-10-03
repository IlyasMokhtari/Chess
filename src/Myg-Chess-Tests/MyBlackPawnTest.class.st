Class {
	#name : 'MyBlackPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyBlackPawnTest >> testDefaultMove [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyBlackPawn new).

	squares := pawn defaultMove .
	self
		assertCollection: (squares collect: [ :s |s name ])
		equals:
			(#(e3) collect: [ :name |
				 board at: name ]; asOrderedCollection)
]

{ #category : 'tests' }
MyBlackPawnTest >> testFirstMove [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyBlackPawn new).

	squares := pawn targetSquares.
	self
		assertCollection: (squares collect: [ :s |s name ])
		equals:
			(#(e3 e2) collect: [ :name |
				 board at: name ]; asOrderedCollection )
]
