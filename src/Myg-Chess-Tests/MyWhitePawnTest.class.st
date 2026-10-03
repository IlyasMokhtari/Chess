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
