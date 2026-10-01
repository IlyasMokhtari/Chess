Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testBlackPawnMoveBlockedByPawn [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn black).
	board at: 'e3' put: (MyPawn white).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		hasSameElements:
			(#() collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTest >> testDefaultBlackPawnMove [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn black).
	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#(e3) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTest >> testDefaultWhitePawnMove [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#(e5) collect: [ :name |
				 board at: name ])
]
