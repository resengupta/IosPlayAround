//
//  LoadImageAsynchronously.h
//  TechOfferings
//
//  Created by Chordia, Amisha (US - Mumbai) on 7/3/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface LoadImageAsynchronously : UIImageView{
    NSURLConnection *connection;
    NSMutableData *data;
}

- (void)loadImageAsyncFromURL:(NSString *)url placeholderImage:(UIImage *)placeholderImg;

@end
