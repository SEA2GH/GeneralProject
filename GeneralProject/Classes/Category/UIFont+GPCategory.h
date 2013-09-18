//
//  UIFont+GPCategory.h
//  GeneralProject
//
//  Created by guo haiyang on 18/09/13.
//
//

#import <UIKit/UIKit.h>

@interface UIFont (GPCategory)

+ (BOOL)fontIsDownloaded:(NSString *)fontName;

// download font
+ (void)asynchronouslyDownloadFontName:(NSString *)fontName
                                 begin:(void(^)())begin
                      beginDownloading:(void(^)())beginDownloading
                           downloading:(void(^)(double progressValue))downloading
                     finishDownloading:(void(^)())finishDownloading
                                finish:(void(^)(BOOL errorDuringDownload))finish
                                  fail:(void(^)(NSString *errorMessage))fail;

@end
