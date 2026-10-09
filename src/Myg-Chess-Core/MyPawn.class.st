Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#instVars : [
		'moveStrategy',
		'movedTwoSquare'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> attackSquare [
	self subclassResponsibility.
]

{ #category : 'as yet unclassified' }
MyPawn >> defaultMove [
	self subclassResponsibility.
]

{ #category : 'as yet unclassified' }
MyPawn >> enPassantSquare [
    | squareList |
    squareList := OrderedCollection new.
    squareList
        add: square left;
        add: square right.
    ^ squareList select: [ :s |
        s isSquare and: [
            s hasPiece and: [
                s contents color ~= color and: [
                    s contents movedTwoSquare
                ]
            ]
        ]
    ]
]

{ #category : 'accessing' }
MyPawn >> firstMove [
	self subclassResponsibility.
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'initialization' }
MyPawn >> initialize [ 
	super initialize.
	moveStrategy := [ self firstMove, self attackSquare ].
	
]

{ #category : 'accessing' }
MyPawn >> moveStrategy [
 ^ moveStrategy
]

{ #category : 'accessing' }
MyPawn >> moveTo: aSquare [
	super moveTo: aSquare.
	moveStrategy := [ self defaultMove , self attackSquare]
]

{ #category : 'as yet unclassified' }
MyPawn >> movedTwoSquare [
	^ movedTwoSquare
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [
	^ moveStrategy value
]
