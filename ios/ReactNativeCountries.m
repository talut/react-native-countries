//
//  ReactNativeCountries.m
//  ReactNativeCountries
//
//  Created by Talut TASGIRAN on 24.12.2018.
//

#import "ReactNativeCountries.h"

@implementation ReactNativeCountries
- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
+(BOOL)requiresMainQueueSetup {
    return YES;
}

RCT_EXPORT_MODULE();
-(NSArray *)countryCodes {
  return [NSLocale ISOCountryCodes];
}

-(NSArray *)countryNames {
  NSArray *countryCodesArray = [self countryCodes];

  NSMutableArray *countryNamesArray = [NSMutableArray new];

  for (NSString *code in countryCodesArray) {
    NSString *name = [[NSLocale currentLocale] localizedStringForCountryCode:code];
    [countryNamesArray addObject:name];
  }

  return [NSArray arrayWithArray:countryNamesArray];
}

-(NSArray *)countryNamesWithCodes {
  NSArray *countryCodesArray = [self countryCodes];

  NSMutableArray *dictArray = [NSMutableArray new];

  for (NSString *code in countryCodesArray) {
    NSString *name = [[NSLocale currentLocale] localizedStringForCountryCode:code];
    [dictArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:code, @"code", name, @"name", nil]];
  }

  return [NSArray arrayWithArray:dictArray];
}
- (NSDictionary *)constantsToExport
{
    NSArray *countryNamesWithCodes = [self countryNamesWithCodes];
    NSArray *countryCodes = [self countryCodes];
    NSArray *countryNames = [self countryNames];
    
    return @{ @"getCountryNamesWithCodes" :countryNamesWithCodes,
              @"getCountryNames" : countryNames,
              @"getCountryCodes" : countryCodes };
}

@end
  
