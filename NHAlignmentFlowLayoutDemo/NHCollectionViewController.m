//
//  NHCollectionViewController.m
//  NHAlignedFlowLayout
//
//  Created by Nils Hayat on 7/19/13.
//  Copyright (c) 2013 Nils Hayat. All rights reserved.
//

#import "NHCollectionViewController.h"
#import "NHAlignmentFlowLayout.h"

@interface NHCollectionViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation NHCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NHAlignmentFlowLayout *layout = [[NHAlignmentFlowLayout alloc] init];
	layout.scrollDirection = UICollectionViewScrollDirectionVertical;
	layout.sectionInset = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
	layout.alignment = NHAlignmentTopLeftAligned;
	layout.itemSize = CGSizeMake(90.0, 90.0);
	layout.minimumInteritemSpacing = 5.0;
	layout.minimumLineSpacing = 5.0;
	
	self.collectionView.collectionViewLayout = layout;
	
	[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

#pragma mark - UIColelctionViewController

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return 29;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
	
	CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
	CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
	CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
	UIColor *randomColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
	
	cell.backgroundColor = randomColor;

	return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	CGFloat width = 40.0 + arc4random_uniform(80.0);
	return CGSizeMake(width, 30.0);
}

#pragma mark - User Interactions

- (IBAction)changeLayoutButtonTapped:(id)sender {
	NHAlignmentFlowLayout *layout = (NHAlignmentFlowLayout *)self.collectionView.collectionViewLayout;
	layout.alignment = (layout.alignment + 1) % 3;

	[layout invalidateLayout];
}


@end
