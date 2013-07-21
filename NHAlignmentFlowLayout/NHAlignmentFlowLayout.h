//
//  NHAlignmentFlowLayout.h
//  Hukkster
//
//  Created by Nils Hayat on 7/1/13.
//  Copyright (c) 2013 Hukkster. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NHAlignment) {
	NHAlignmentJustified = 0,
	NHAlignmentTopLeftAligned, // Top if scrollDirection is horizontal, Left if vertical
	NHAlignmentBottomRightAligned, // Bottom if scrollDirection is horizontal, right if vertical
};

@interface NHAlignmentFlowLayout : UICollectionViewFlowLayout

@property (nonatomic) NHAlignment alignment;

@end
