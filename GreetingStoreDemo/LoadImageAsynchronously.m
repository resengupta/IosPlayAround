//
//  LoadImageAsynchronously.m
//  TechOfferings
//
//  Created by Chordia, Amisha (US - Mumbai) on 7/3/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//


#import "LoadImageAsynchronously.h"

@implementation LoadImageAsynchronously

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - LoadImageAsyncFromURL Method
- (void)loadImageAsyncFromURL:(NSString *)url placeholderImage:(UIImage *)placeholderImg{
    if(placeholderImg)
    {
        self.image=placeholderImg;
    }
    
    NSURLRequest *request=[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:90.0];

    if(connection)
    {
        [connection cancel];
        connection=nil;
        data=nil;
    }
    connection=[[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

#pragma mark - NSURLConnection Methods
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[data setLength:0];
}

- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData 
{
    if (data == nil)
        data = [[NSMutableData alloc] init];
    [data appendData:incrementalData];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)theConnection
{
    UIImage *image=[UIImage imageWithData:data];
    if(image)
        self.image=image;
    data=nil;
    connection=nil;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	NSLog(@"Connection failed: %@", [error description]);
}


@end
