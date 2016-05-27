Feature: UpdateQuality
	In order to keep the system working the same
	As a developer preparing its secure belt
	I want to be reasonably ready to refactor

@naive
Scenario: At the end of each day our system lowers both values for every item
	Given my system have those items
		| Name    | Sell In | Quality |
		| Item #1 | 1       | 1       |
		| Item #2 | 1       | 1       |
	When the day ends
	Then my system should have those items
		| Name    | Sell In | Quality |
		| Item #1 | 0       | 0       |
		| Item #2 | 0       | 0       |

@naive
Scenario: Once the sell by date has passed, Quality degrades twice as fast
	Given my system have those items
		| Name    | Sell In | Quality |
		| Item #1 | 1       | 10      |
	When the day ends
	Then my system should have those items
		| Name    | Sell In | Quality |
		| Item #1 | 0       | 9       |
	When the day ends
	Then my system should have those items
		| Name    | Sell In | Quality |
		| Item #1 | -1      | 7       |

@naive
Scenario: The Quality of an item is never negative
	Given my system have those items
		| Name    | Sell In | Quality |
		| Item #1 | 1       | 0       |
	When the day ends
	Then my system should have those items
		| Name    | Sell In | Quality |
		| Item #1 | 0       | 0       |
	When the day ends
	Then my system should have those items
		| Name    | Sell In | Quality |
		| Item #1 | -1      | 0       |

@naive
Scenario: "Aged Brie" actually increases in Quality the older it gets
	Given my system have those items
		| Name      | Sell In | Quality |
		| Aged Brie | 1       | 0       |
	When the day ends
	Then my system should have those items
		| Name      | Sell In | Quality |
		| Aged Brie | 0       | 1       |

@naive
Scenario: The Quality of an item is never more than 50
	Given my system have those items
		| Name      | Sell In | Quality |
		| Item #1   | 1       | 50      |
		| Aged Brie | 1       | 50      |
	When the day ends
	Then my system should have those items
		| Name      | Sell In | Quality |
		| Item #1   | 0       | 49      |
		| Aged Brie | 0       | 50      |

@naive
Scenario: "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
	Given my system have those items
		| Name                       | Sell In | Quality |
		| Item #1                    | 1       | 50      |
		| Sulfuras, Hand of Ragnaros | 1       | 50      |
	When the day ends
	Then my system should have those items
		| Name                       | Sell In | Quality |
		| Item #1                    | 0       | 49      |
		| Sulfuras, Hand of Ragnaros | 1       | 50      |
	When the day ends
	Then my system should have those items
		| Name                       | Sell In | Quality |
		| Item #1                    | -1      | 47      |
		| Sulfuras, Hand of Ragnaros | 1       | 50      |

@naive
Scenario: "Backstage passes", like aged brie, increases in Quality as it's SellIn 
value approaches; Quality increases by 2 when there are 10 days or less 
and by 3 when there are 5 days or less but Quality drops to 0 after the 
concert
	Given my system have those items
		| Name                                      | Sell In | Quality |
		| Item #1                                   | 11      | 11      |
		| Backstage passes to a TAFKAL80ETC concert | 11      | 11      |
	When the day ends
	Then my system should have those items
		| Name                                      | Sell In | Quality |
		| Item #1                                   | 10      | 10      |
		| Backstage passes to a TAFKAL80ETC concert | 10      | 12      |
	When the day ends
	Then my system should have those items
		| Name                                      | Sell In | Quality |
		| Item #1                                   | 9       | 9       |
		| Backstage passes to a TAFKAL80ETC concert | 9       | 14      |
	When the day ends
	And the day ends
	And the day ends
	Then my system should have those items
		| Name                                      | Sell In | Quality |
		| Item #1                                   | 6       | 6       |
		| Backstage passes to a TAFKAL80ETC concert | 6       | 20      |
	When the day ends
	Then my system should have those items
		| Name                                      | Sell In | Quality |
		| Item #1                                   | 5       | 5       |
		| Backstage passes to a TAFKAL80ETC concert | 5       | 22      |
	When the day ends
	Then my system should have those items
		| Name                                      | Sell In | Quality |
		| Item #1                                   | 4       | 4       |
		| Backstage passes to a TAFKAL80ETC concert | 4       | 25      |
	When the day ends
	And the day ends
	And the day ends
	Then my system should have those items
		| Name                                      | Sell In | Quality |
		| Item #1                                   | 1       | 1       |
		| Backstage passes to a TAFKAL80ETC concert | 1       | 34      |
	When the day ends
	Then my system should have those items
		| Name                                      | Sell In | Quality |
		| Item #1                                   | 0       | 0       |
		| Backstage passes to a TAFKAL80ETC concert | 0       | 37      |
	When the day ends
	Then my system should have those items
		| Name                                      | Sell In | Quality |
		| Item #1                                   | -1      | 0       |
		| Backstage passes to a TAFKAL80ETC concert | -1      | 0       |

@naive
Scenario: An item can never have its Quality increase 
above 50, however "Sulfuras" is a legendary item and as such its 
Quality is 80 and it never alters.
	Given my system have those items
		| Name                       | Sell In | Quality |
		| Sulfuras, Hand of Ragnaros | 1       | 80      |
	When the day ends
	Then my system should have those items
		| Name                       | Sell In | Quality |
		| Sulfuras, Hand of Ragnaros | 1       | 80      |
	When the day ends
	Then my system should have those items
		| Name                       | Sell In | Quality |
		| Sulfuras, Hand of Ragnaros | 1       | 80      |
