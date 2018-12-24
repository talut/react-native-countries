//
//  ReactNativeCountries.m
//  ReactNativeCountries
//
//  Created by Talut TAŞGIRAN on 24.12.2018.
//

#import "ReactNativeCountries.h"

@implementation ReactNativeCountries

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()
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

RCT_REMAP_METHOD(getCountryNamesWithCodes,
                 getCountryNamesWithCodesWithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  @try {
    NSArray *countryNamesWithCodes = [self countryNamesWithCodes];
    resolve(countryNamesWithCodes);
  }
  @catch(NSError *exception){
    reject(@"no_countries", @"There is no countries", exception);
  }
}


RCT_REMAP_METHOD(getCountryNames,
                 getCountryNamesWithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  @try {
    NSArray *countryNames = [self countryNames];
    resolve(countryNames);
  }
  @catch(NSError *exception){
    reject(@"no_countries", @"There is no countries", exception);
  }
}

RCT_REMAP_METHOD(getCountryCodes,
                 getCountryCodesWithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  @try {
    NSArray *countryCodes = [self countryCodes];
    resolve(countryCodes);
  }
  @catch(NSError *exception){
    reject(@"no_countries", @"There is no countries", exception);
  }
}
@end
  