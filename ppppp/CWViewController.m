//
//  CWViewController.m
//  ppppp
//
//  Created by Зоя Прибыткова on 14.01.14.
//  Copyright (c) 2014 Зоя Прибыткова. All rights reserved.
//

#import "CWViewController.h"
#import "CWDetailViewController.h"
#import "CWRequestController.h"
#import "CWEntity.h"
#import "CWCell.h"

@interface CWViewController ()
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation CWViewController

@synthesize tableView = _tableView;
@synthesize jResult = _jResult;

double timerInterval = 60.0f;

- (NSTimer *) timer {
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:timerInterval target:self selector:@selector(onTick:) userInfo:nil repeats:YES];
    }
    return _timer;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)onTick:(NSTimer*)timer {
    NSLog(@"Tic....");
    [self getData];
}

- (void)getData
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul), ^{
        id result = [CWRequestController getCollectonWithURL:[NSURL URLWithString:@"http://crazy-dev.wheely.com/"]];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if ([result isKindOfClass:[NSError class]]) {
                
            }
            else
            {
                _jResult = [CWEntity createEntityCollectionWithArray:result];
                [self.tableView reloadData];
            }
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (CGFloat)getTextHeight:(NSString *)text
{
    UITextView *tv = [[UITextView alloc] initWithFrame:CGRectMake(15, 20, 272, 28)];
    [tv setText:text];
    CGSize size = [tv sizeThatFits:CGSizeMake(272, FLT_MAX)];
    return size.height+30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self getTextHeight:[(CWEntity *)[_jResult objectAtIndex:indexPath.row] text]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_jResult count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"Cell";
    
    CWCell *cell = (CWCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell.title.text = [(CWEntity *)[_jResult objectAtIndex:indexPath.row] title];
    cell.text.text = [(CWEntity *)[_jResult objectAtIndex:indexPath.row] text];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CWDetailViewController *destViewController = segue.destinationViewController;
        destViewController.selectedEntity = [_jResult objectAtIndex:indexPath.row];
    }
}


- (IBAction)refreshButton:(id)sender {
    [self getData];
}
@end
