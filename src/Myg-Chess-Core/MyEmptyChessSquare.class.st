Class {
	#name : 'MyEmptyChessSquare',
	#superclass : 'BlElement',
	#instVars : [
		'color',
		'name',
		'label',
		'piece',
		'contents',
		'board',
		'target'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'testing' }
MyEmptyChessSquare >> hasPiece [
	^false
]

{ #category : 'testing' }
MyEmptyChessSquare >> isSquare [
	^false
]
