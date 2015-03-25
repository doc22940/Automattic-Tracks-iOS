#import "TracksServiceRemote.h"

@implementation TracksServiceRemote


- (void)sendSingleTracksEvent:(TracksEvent *)tracksEvent completionHandler:(void (^)(void))completion
{
    NSDictionary *dataToSend = @{@"events" : @[tracksEvent.dictionaryRepresentation],
                                 @"commonProps" : @{}};
    NSError *error = nil;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://public-api.wordpress.com/rest/v1.1/tracks/record"]];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:dataToSend options:0 error:&error];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task;
    task = [sharedSession dataTaskWithRequest:request
                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Response: %@ \n\nData: %@:", response, dataString);
        
        if (completion) {
            completion();
        }
    }];
    
    [task resume];
}


- (void)sendBatchOfEvents:(NSArray *)events withSharedProperties:(NSDictionary *)properties completionHandler:(void (^)(void))completion
{
    NSDictionary *dataToSend = @{@"events" : events,
                                 @"commonProps" : properties};
    NSError *error = nil;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://public-api.wordpress.com/rest/v1.1/tracks/record"]];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:dataToSend options:0 error:&error];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task;
    task = [sharedSession dataTaskWithRequest:request
                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
            {
                NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"Response: %@ \n\nData: %@:", response, dataString);
                
                if (completion) {
                    completion();
                }
            }];
    
    [task resume];
}

@end