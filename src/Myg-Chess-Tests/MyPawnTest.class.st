Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testBlackPawnCanEatWhitePawnDiagonally [
	|whitePawn squares board blackPawn|
	board := MyChessBoard empty.
	board at: 'e5' put: (whitePawn := MyPawn black).
	board at: 'd4' put: (blackPawn := MyPawn white).
	board at: 'e4' put: (blackPawn := MyPawn white).

	squares := whitePawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#('d4') collect: [ :name |
				 board at: name ])
]

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
		hasSameElements:
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

{ #category : 'tests' }
MyPawnTest >> testWhitePawnCanEatBlackPawnDiagonally [
	|whitePawn squares board blackPawn|
	board := MyChessBoard empty.
	board at: 'e4' put: (whitePawn := MyPawn white).
	board at: 'd5' put: (blackPawn := MyPawn black).
	board at: 'e5' put: (blackPawn := MyPawn black).

	squares := whitePawn targetSquares.
	self
		assertCollection: squares asArray
		hasSameElements:
			(#('d5') collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnMoveBlockedByPawn [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e3' put: (pawn := MyPawn white).
	board at: 'e4' put: (MyPawn black).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		hasSameElements:
			(#() collect: [ :name |
				 board at: name ])
]
