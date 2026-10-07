Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testMoveStrategySetToFirstMoveAtInitialization [
	|pawn board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyBlackPawn new).
	
	self
		assert: pawn moveStrategy asString = [ self firstMove ] asString
]

{ #category : 'tests' }
MyPawnTest >> testMovedPawnSetTheMoveStrategyToDefault [
	|pawn squares board|
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyBlackPawn new).
	pawn moveTo: 'e3'.
	
	self
		assert: pawn moveStrategy asString = [ self defaultMove , self attackSquare ] asString
]
