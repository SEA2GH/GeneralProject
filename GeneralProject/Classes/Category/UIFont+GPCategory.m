//
//  UIFont+GPCategory.m
//  GeneralProject
//
//  Created by guo haiyang on 18/09/13.
//
//

#import "UIFont+GPCategory.h"
#import <CoreText/CoreText.h>


@implementation UIFont (GPCategory)


+ (BOOL)fontIsDownloaded:(NSString *)fontName
{
    UIFont * aFont = [UIFont fontWithName:fontName size:12.0];
    if (aFont && ([aFont.fontName compare:fontName] == NSOrderedSame || [aFont.familyName compare:fontName] == NSOrderedSame)) {
        return YES;
    }
    
    return NO;
}


+ (void)asynchronouslyDownloadFontName:(NSString *)fontName
                                 begin:(void(^)())begin
                      beginDownloading:(void(^)())beginDownloading
                           downloading:(void(^)(double progressValue))downloading
                     finishDownloading:(void(^)())finishDownloading
                                finish:(void(^)(BOOL errorDuringDownload))finish
                                  fail:(void(^)(NSString *errorMessage))fail
{
    // Create a dictionary with the font's PostScript name.
	NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithObjectsAndKeys:fontName, kCTFontNameAttribute, nil];
    
    // Create a new font descriptor reference from the attributes dictionary.
	CTFontDescriptorRef desc = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)attributes);
    
    NSMutableArray *descriptors = [NSMutableArray arrayWithCapacity:0];
    [descriptors addObject:(__bridge id)desc];
    CFRelease(desc);
    
	__block BOOL errorDuringDownload = NO;
	
	// Start processing the font descriptor..
    // This function returns immediately, but can potentially take long time to process.
    // The progress is notified via the callback block of CTFontDescriptorProgressHandler type.
    // See CTFontDescriptor.h for the list of progress states and keys for progressParameter dictionary.
    CTFontDescriptorMatchFontDescriptorsWithProgressHandler( (__bridge CFArrayRef)descriptors, NULL,  ^(CTFontDescriptorMatchingState state, CFDictionaryRef progressParameter)
    {
		double progressValue = [[(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingPercentage] doubleValue];
		
		if (state == kCTFontDescriptorMatchingDidBegin)
        {
			dispatch_async( dispatch_get_main_queue(), ^
            {
                begin();
                NSLog(@"Begin Matching");
            });
		}
        else if (state == kCTFontDescriptorMatchingDidFinish)
        {
			dispatch_async( dispatch_get_main_queue(), ^
            {
                finish(errorDuringDownload);
                
                if (!errorDuringDownload)
                {
                    NSLog(@"%@ downloaded", fontName);
                }
            });
		}
        else if (state == kCTFontDescriptorMatchingWillBeginDownloading)
        {
			dispatch_async( dispatch_get_main_queue(), ^
            {
                beginDownloading();
                NSLog(@"Begin Downloading");
            });
		}
        else if (state == kCTFontDescriptorMatchingDidFinishDownloading)
        {
			dispatch_async( dispatch_get_main_queue(), ^
            {
                finishDownloading();
                NSLog(@"Finish downloading");
            });
		}
        else if (state == kCTFontDescriptorMatchingDownloading)
        {
			dispatch_async( dispatch_get_main_queue(), ^
            {
                downloading(progressValue);
                NSLog(@"Downloading %.0f%% complete", progressValue);
            });
		}
        else if (state == kCTFontDescriptorMatchingDidFailWithError)
        {
            // An error has occurred. Get the error message
            NSString *_errorMessage = nil;
            
            NSError *error = [(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingError];
            if (error != nil)
            {
                _errorMessage = [error description];
            }
            else
            {
                _errorMessage = @"ERROR MESSAGE IS NOT AVAILABLE!";
            }
            
            // Set our flag
            errorDuringDownload = YES;
            
            dispatch_async( dispatch_get_main_queue(), ^
            {
                fail(_errorMessage);
                NSLog(@"Download error: %@", _errorMessage);
            });
		}
        
		return (bool)YES;
	});
}


@end
