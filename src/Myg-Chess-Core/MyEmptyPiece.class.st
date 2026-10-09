Class {
	#name : 'MyEmptyPiece',
	#superclass : 'Object',
	#instVars : [
		'color'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyEmptyPiece >> color [
	^color
]

{ #category : 'testing' }
MyEmptyPiece >> isPiece [
	
	^ false
]

{ #category : 'rendering' }
MyEmptyPiece >> renderPieceOn: aSquare [
	^ aSquare color isBlack
				        ifFalse: [ 'z' ]
				        ifTrue: [ 'x' ] 
]
