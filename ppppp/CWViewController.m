//
//  CWViewController.m
//  ppppp
//
//  Created by Зоя Прибыткова on 14.01.14.
//  Copyright (c) 2014 Зоя Прибыткова. All rights reserved.
//

#import "CWViewController.h"
#import "CWDetailViewController.h"



@interface CWViewController ()
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation CWViewController {
    NSArray *jResult;
    NSDictionary *tweet;
    NSString *str;
}

@synthesize tableView = _tableView;

double timerInterval = 10.0f;

- (NSTimer *) timer {
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:timerInterval target:self selector:@selector(onTick:) userInfo:nil repeats:YES];
    }
    return _timer;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    jResult = [[CWViewController alloc] result];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)onTick:(NSTimer*)timer {
    NSLog(@"Tic....");
    jResult = [[CWViewController alloc] result];

    [self.tableView reloadData];
}

- (NSArray *) result
{
    NSArray *resultArray;
    NSError *error = nil;
    NSURL *url = [NSURL URLWithString:@"http://crazy-dev.wheely.com"];
    NSData *jData = [NSData dataWithContentsOfURL:url];
    if (jData != nil) {
        error = nil;
        
        resultArray = [NSJSONSerialization JSONObjectWithData:jData options:NSJSONReadingMutableContainers error:&error];
    }
    return resultArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [jResult count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    tweet = [jResult objectAtIndex:indexPath.row];
    str = [tweet objectForKey:@"title"];
    cell.textLabel.text = str;
    str = [tweet objectForKey:@"text"];
    cell.detailTextLabel.text = str;
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CWDetailViewController *destViewController = segue.destinationViewController;
        tweet = [jResult objectAtIndex:indexPath.row];
        str = [tweet objectForKey:@"title"];
        destViewController.titleDetail = str;
        str = [tweet objectForKey:@"text"];
        destViewController.textDetail = str;
    }
}


- (IBAction)refreshButton:(id)sender {
    jResult = [[CWViewController alloc] result];
    
    [self.tableView reloadData];
}
@end
