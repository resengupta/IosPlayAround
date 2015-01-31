//
//  ProductTableViewCell.h
//  GreetingStoreDemo
//
//  Created by Sengupta, Reeya (US - Mumbai) on 1/14/15.
//  Copyright (c) 2015 ddstudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadImageAsynchronously.h"

@interface ProductTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet LoadImageAsynchronously *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productNameLb;
@property (weak, nonatomic) IBOutlet UILabel *productBrandLb;
@property (weak, nonatomic) IBOutlet UILabel *productPriceLb;
@property (weak, nonatomic) IBOutlet UILabel *productDescLb;

@end
