Class {
	#name : 'MyBlackPawnTest',
	#superclass : 'MyPawnTest',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyBlackPawnTest >> testAttackSquare [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyBlackPawn new).
	board at: 'd3' put: (MyWhitePawn new).

	squares := pawn attackSquare.
	self
		assertCollection: (squares collect: [ :s |s name ])
		equals: (#(d3) collect: [ :name |
				 board at: name ]; asOrderedCollection )
]

{ #category : 'tests' }
MyBlackPawnTest >> testCantAttackPawnOfSameColor [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyBlackPawn new).
	board at: 'd3' put: (MyBlackPawn new).

	squares := pawn attackSquare.
	self
		assertCollection: (squares collect: [ :s |s name ])
		equals: (#() collect: [ :name |
				 board at: name ]; asOrderedCollection )
]

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
MyBlackPawnTest >> testDefautlMoveBlockedByPawn [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyBlackPawn new).
	board at: 'e3' put: (MyBlackPawn new).

	squares := pawn defaultMove.
	self
		assertCollection: squares 
		equals: (#() asOrderedCollection)
]

{ #category : 'tests' }
MyBlackPawnTest >> testEnPassantByBlackPawn [
| whitePawn blackPawn board squares |
    board := MyChessBoard empty.
    board at: 'e5' put: (whitePawn := MyWhitePawn new).
    board at: 'd7' put: (blackPawn := MyBlackPawn new).
    blackPawn moveTo: (board at: 'd5').
    squares := whitePawn targetSquares.
    self assert: (squares includes: (board at: 'd6'))
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

{ #category : 'tests' }
MyBlackPawnTest >> testFirstMoveBlockedByPawn [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyBlackPawn new).
	board at: 'e3' put: (MyBlackPawn new).

	squares := pawn firstMove.
	self
		assertCollection: squares 
		equals: (#() asOrderedCollection)
]
