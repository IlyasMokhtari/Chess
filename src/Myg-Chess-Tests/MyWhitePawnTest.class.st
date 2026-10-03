Class {
	#name : 'MyWhitePawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

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
