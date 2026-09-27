Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testFirstMove [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyWhitePawn new).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#(e5 e6) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTest >> testMoves [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyWhitePawn new).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#(e5) collect: [ :name |
				 board at: name ])
]
