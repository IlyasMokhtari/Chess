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

{ #category : 'instance creation' }
MyEmptyChessSquare >> down [
	^self
]

{ #category : 'testing' }
MyEmptyChessSquare >> hasPiece [
	^false
]

{ #category : 'highlighting' }
MyEmptyChessSquare >> highlightTarget [
	^self.
]

{ #category : 'testing' }
MyEmptyChessSquare >> isSquare [
	^false
]

{ #category : 'instance creation' }
MyEmptyChessSquare >> left [
	^self
]

{ #category : 'instance creation' }
MyEmptyChessSquare >> right [
	^self
]

{ #category : 'highlighting' }
MyEmptyChessSquare >> unhighlightTarget [
	^self.
]

{ #category : 'instance creation' }
MyEmptyChessSquare >> up [ 
	^self
]
