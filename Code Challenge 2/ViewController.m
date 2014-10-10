//
//  ViewController.m
//  Code Challenge 2
//
//  Created by Taylor Wright-Sanson on 10/10/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "DetailViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, CityDelegte>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *citys;
@property UIBarButtonItem *rightBarButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    City *lausanne = [[City alloc] initWithName:@"Laussane"];
    lausanne.provence = @"Vaud";
    lausanne.wikiUrlString = @"http://en.wikipedia.org/wiki/Lausanne";
    lausanne.image = [UIImage imageNamed:@"lion_1"];
    lausanne.delegate = self;

    City *saratoga = [[City alloc] initWithName:@"Saratoga Springs"];
    saratoga.state = @"New York";
    saratoga.wikiUrlString = @"http://en.wikipedia.org/wiki/Saratoga_Springs,_New_York";
    saratoga.image = [UIImage imageNamed:@"lion_2"];
    saratoga.delegate = self;

    City *lakePlacid = [[City alloc] initWithName:@"Lake Placid"];
    lakePlacid.state = @"New York";
    lakePlacid.wikiUrlString = @"http://en.wikipedia.org/wiki/Lake_Placid,_New_York";
    lakePlacid.image = [UIImage imageNamed:@"lion_3"];
    lakePlacid.delegate = self;

    City *antwerp = [[City alloc] initWithName:@"Antwerp"];
    antwerp.provence = @"Belgium";
    antwerp.wikiUrlString =  @"http://en.wikipedia.org/wiki/Antwerp";
    antwerp.image = [UIImage imageNamed:@"tiger_1"];
    antwerp.delegate = self;

    self.citys = [[NSMutableArray alloc] initWithObjects:lausanne, saratoga, lakePlacid, antwerp, nil];

    // Set up my bar button programatically because I haven't been able to figure out how to get the
    // title to change when it's pressed if I set it up in IB.
    self.rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
                                                           style:UIBarButtonItemStyleDone
                                                          target:self action:@selector(onEditButtonPressed:)];
    self.navigationItem.rightBarButtonItem = self.rightBarButton;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

-(void)getCityURL
{
    /// noooo more time!! 🐼🐼🐼🐼🐼
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.citys.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    City *city = [self.citys objectAtIndex:indexPath.row];
    if (city.name) {
        cell.textLabel.text = city.name;
    }
    else
    {
        cell.textLabel.text = city.provence;
    }
    // bad naming I know... didn't have time... hah
    cell.image.image = city.image;
    return cell;
}

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)rightBarButton
{
    if ([rightBarButton.title isEqualToString:@"Edit"])
    {
        self.navigationItem.rightBarButtonItem.title = @"Done";
        [self.tableView setEditing:YES];
    }
    else
    {
        rightBarButton.title = @"Edit";
        [self.tableView setEditing:NO];
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    [self.citys removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

    if ([segue.identifier isEqualToString:@"DetailViewSegue"])
    {
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.city = [self.citys objectAtIndex:indexPath.row];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
