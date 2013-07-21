//
//  NHAlignmentFlowLayout.m
//  Hukkster
//
//  Created by Nils Hayat on 7/1/13.
//  Copyright (c) 2013 Hukkster. All rights reserved.
//

#import "NHAlignmentFlowLayout.h"

@implementation NHAlignmentFlowLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray* array = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes* attributes in array) {
        if (nil == attributes.representedElementKind) {
            NSIndexPath* indexPath = attributes.indexPath;
            attributes.frame = [self layoutAttributesForItemAtIndexPath:indexPath].frame;
        }
    }
    return array;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewLayoutAttributes *attributes;
	
	switch (self.alignment) {
		case NHAlignmentTopLeftAligned:
		{
			if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
				attributes = [self layoutAttributesForLeftAlignmentForItemAtIndexPath:indexPath];
			} else {
				attributes = [self layoutAttributesForTopAlignmentForItemAtIndexPath:indexPath];
			}
			break;
		}
		case NHAlignmentBottomRightAligned:
		{
			if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
				attributes = [self layoutAttributesForRightAlignmentForItemAtIndexPath:indexPath];
			} else {
				attributes = [self layoutAttributesForBottomAlignmentForItemAtIndexPath:indexPath];
			}
			break;
		}
		default:
			attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
			break;
	}
	
	return attributes;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForLeftAlignmentForItemAtIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
	CGRect frame = attributes.frame;
	
	if (attributes.frame.origin.x <= self.sectionInset.left) {
		return attributes;
	}
	
	if (indexPath.item == 0) {
		frame.origin.x = self.sectionInset.left;
	} else {
		NSIndexPath *previousIndexPath = [NSIndexPath indexPathForItem:indexPath.item - 1 inSection:indexPath.section];
		UICollectionViewLayoutAttributes *previousAttributes = [self layoutAttributesForItemAtIndexPath:previousIndexPath];
		
		if (attributes.frame.origin.y > previousAttributes.frame.origin.y) {
			frame.origin.x = self.sectionInset.left;
		} else {
			frame.origin.x = CGRectGetMaxX(previousAttributes.frame) + self.minimumInteritemSpacing;
		}
	}
	
	attributes.frame = frame;

	return attributes;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForTopAlignmentForItemAtIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
	CGRect frame = attributes.frame;
	
	if (attributes.frame.origin.y <= self.sectionInset.top) {
		return attributes;
	}
	
	if (indexPath.item == 0) {
		frame.origin.y = self.sectionInset.top;
	} else {
		NSIndexPath *previousIndexPath = [NSIndexPath indexPathForItem:indexPath.item - 1 inSection:indexPath.section];
		UICollectionViewLayoutAttributes *previousAttributes = [self layoutAttributesForItemAtIndexPath:previousIndexPath];
		
		if (attributes.frame.origin.x > previousAttributes.frame.origin.x) {
			frame.origin.y = self.sectionInset.top;
		} else {
			frame.origin.y = CGRectGetMaxY(previousAttributes.frame) + self.minimumInteritemSpacing;
		}
	}
	
	attributes.frame = frame;
	
	return attributes;
}


-(UICollectionViewLayoutAttributes *)layoutAttributesForRightAlignmentForItemAtIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
	CGRect frame = attributes.frame;
	
	if (CGRectGetMaxX(attributes.frame) >= self.collectionViewContentSize.width - self.sectionInset.right) {
		return attributes;
	}
	
	if (indexPath.item == [self.collectionView numberOfItemsInSection:indexPath.section] - 1) {
		frame.origin.x = self.collectionViewContentSize.width - self.sectionInset.right - frame.size.width;
	} else {
		
		NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:indexPath.item + 1 inSection:indexPath.section];
		UICollectionViewLayoutAttributes *nextAttributes = [self layoutAttributesForItemAtIndexPath:nextIndexPath];
		
		if (attributes.frame.origin.y < nextAttributes.frame.origin.y) {
			frame.origin.x = self.collectionViewContentSize.width - self.sectionInset.right - frame.size.width;
		} else {
			frame.origin.x = nextAttributes.frame.origin.x - self.minimumInteritemSpacing - attributes.frame.size.width;
		}
	}

	attributes.frame = frame;

	return attributes;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForBottomAlignmentForItemAtIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
	CGRect frame = attributes.frame;
	
	if (CGRectGetMaxY(attributes.frame) >= self.collectionViewContentSize.height - self.sectionInset.left) {
		return attributes;
	}
	
	if (indexPath.item == [self.collectionView numberOfItemsInSection:indexPath.section]) {
		frame.origin.y = self.collectionViewContentSize.height - self.sectionInset.bottom - frame.size.height;
	} else {
		NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:indexPath.item + 1 inSection:indexPath.section];
		UICollectionViewLayoutAttributes *nextAttributes = [self layoutAttributesForItemAtIndexPath:nextIndexPath];
		
		if (attributes.frame.origin.x < nextAttributes.frame.origin.x) {
			frame.origin.y = self.collectionViewContentSize.height - self.sectionInset.bottom - frame.size.height;
		} else {
			
			frame.origin.y = nextAttributes.frame.origin.y - self.minimumInteritemSpacing - attributes.frame.size.height;
		}
	}
	
	attributes.frame = frame;

	return attributes;
}

@end
