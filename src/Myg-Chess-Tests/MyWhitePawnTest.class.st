Class {
	#name : 'MyWhitePawnTest',
	#superclass : 'MyPawnTest',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyWhitePawnTest >> testAttackSquare [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyWhitePawn new).
	board at: 'd5' put: (MyBlackPawn new).

	squares := pawn attackSquare.
	self
		assertCollection: (squares collect: [ :s |s name ])
		equals: (#(d5) collect: [ :name |
				 board at: name ]; asOrderedCollection )
]

{ #category : 'tests' }
MyWhitePawnTest >> testCantAttackPawnOfSameColor [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyWhitePawn new).
	board at: 'd5' put: (MyWhitePawn new).

	squares := pawn attackSquare.
	self
		assertCollection: (squares collect: [ :s |s name ])
		equals: (#() collect: [ :name |
				 board at: name ]; asOrderedCollection )
]

{ #category : 'tests' }
MyWhitePawnTest >> testDefaultMove [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyWhitePawn new).

	squares := pawn defaultMove .
	self
		assertCollection: (squares collect: [ :s |s name ])
		equals:
			(#(e5) collect: [ :name |
				 board at: name ]; asOrderedCollection)
]

{ #category : 'tests' }
MyWhitePawnTest >> testDefaultMoveBlockedByPawn [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyWhitePawn new).
	board at: 'e5' put: (MyBlackPawn new).

	squares := pawn defaultMove.
	self
		assertCollection: squares 
		equals: (#() asOrderedCollection)
]

{ #category : 'tests' }
MyWhitePawnTest >> testEnPassantBlack [
    | whitePawn blackPawn board squares |
    board := MyChessBoard empty.
    board at: 'e4' put: (blackPawn := MyBlackPawn new).
    board at: 'd2' put: (whitePawn := MyWhitePawn new).
    whitePawn moveTo: (board at: 'd4').
    squares := blackPawn targetSquares.
    self assert: (squares includes: (board at: 'd3'))
]

{ #category : 'tests' }
MyWhitePawnTest >> testFirstMove [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyWhitePawn new).

	squares := pawn targetSquares.
	self
		assertCollection: (squares collect: [ :s |s name ])
		equals:
			(#(e5 e6) collect: [ :name |
				 board at: name ]; asOrderedCollection )
]

{ #category : 'tests' }
MyWhitePawnTest >> testFirstMoveBlockedByPawn [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyWhitePawn new).
	board at: 'e5' put: (MyBlackPawn new).

	squares := pawn firstMove.
	self
		assertCollection: squares 
		equals: (#() asOrderedCollection)
]
