Feature: UpdateQuality
	In order to keep the system working the same
	As a developer preparing its secure belt
	I want to be reasonably ready to refactor

@Step2
Scenario: "Regular" items' "SellIn" & "Quality" lowers after an update.
	Given my system have those items
		| Name    | SellIn |
		| Item #1 | 1       |
	When I update quality
	Then items' SellIn is Reduced by 1

	Given my system have those items
		| Name    | Quality |
		| Item #1 | 1       |
	When I update quality
	Then items' Quality is Reduced by 1

@Step2
Scenario: "Regular" items' "Quality" lowers twice after an update, when "SellIn" is negative.
	Given my system have those items
		| Name    | SellIn | Quality |
		| Item #1 | 0      | 2       |
	When I update quality
	Then items' Quality is Reduced by 2

@Step2
Scenario: "Regular" items' "Quality" is never negative.
	Given my system have those items
		| Name    | SellIn | Quality |
		| Item #1 | 1       | 0       |
	When I update quality
	Then items' Quality is Reduced by 0

	Given my system have those items
		| Name    | SellIn | Quality |
		| Item #1 | -1      | 0       |
	When I update quality
	Then items' Quality is Reduced by 0

@Step2
Scenario: "AgedBrie" items' "Quality" increase after an update.
	Given my system have those items
		| Name      | SellIn |
		| Aged Brie | 1      |
	When I update quality
	Then items' Quality is Increased by 1

	Given my system have those items
		| Name      | SellIn |
		| Aged Brie | 0      |
	When I update quality
	Then items' Quality is Increased by 2

	Given my system have those items
		| Name      | SellIn |
		| Aged Brie | -1     |
	When I update quality
	Then items' Quality is Increased by 2

@Step2
Scenario: "Sulfuras" items' "SellIn" & "Quality" don't change after an update.
	Given my system have those items
		| Name                       | SellIn | Quality |
		| Sulfuras, Hand of Ragnaros | 1      | 1       |
	When I update quality
	Then items' Quality is Reduced by 0
	And items' SellIn is Reduced by 0

	Given my system have those items
		| Name                       | SellIn | Quality |
		| Sulfuras, Hand of Ragnaros | 0      | 0       |
	When I update quality
	Then items' Quality is Reduced by 0
	And items' SellIn is Reduced by 0

	Given my system have those items
		| Name                       | SellIn | Quality |
		| Sulfuras, Hand of Ragnaros | -1     | -1      |
	When I update quality
	Then items' Quality is Reduced by 0
	And items' SellIn is Reduced by 0

@Step2
Scenario: "Sulfuras" items' "Quality" is 80 and it never alters
	Given my system have those items
		| Name                       | SellIn | Quality |
		| Sulfuras, Hand of Ragnaros | 1      | 80      |
	When I update quality
	Then items' Quality is Equal to 80

	Given my system have those items
		| Name                       | SellIn | Quality |
		| Sulfuras, Hand of Ragnaros | 0      | 80      |
	When I update quality
	Then items' Quality is Equal to 80

	Given my system have those items
		| Name                       | SellIn | Quality |
		| Sulfuras, Hand of Ragnaros | -1     | 80      |
	Then items' Quality is Equal to 80

@Step2
Scenario: "BackstagePass" items' "Quality" increase after an update.
- Quality increases by 2 when there are 10 days or less
- Quality increases by 3 when there are 5 days or less
- Quality drops to 0 after the concert
	Given my system have those items
		| Name                                      | SellIn |
		| Backstage passes to a TAFKAL80ETC concert | 11     |
	When I update quality
	Then items' Quality is Increased by 1

	Given my system have those items
		| Name                                      | SellIn |
		| Backstage passes to a TAFKAL80ETC concert | 10     |
	When I update quality
	Then items' Quality is Increased by 2

	Given my system have those items
		| Name                                      | SellIn |
		| Backstage passes to a TAFKAL80ETC concert | 6      |
	When I update quality
	Then items' Quality is Increased by 2

	Given my system have those items
		| Name                                      | SellIn |
		| Backstage passes to a TAFKAL80ETC concert | 5      |
	When I update quality
	Then items' Quality is Increased by 3

	Given my system have those items
		| Name                                      | SellIn |
		| Backstage passes to a TAFKAL80ETC concert | 1      |
	When I update quality
	Then items' Quality is Increased by 3

	Given my system have those items
		| Name                                      | SellIn |
		| Backstage passes to a TAFKAL80ETC concert | 0      |
	When I update quality
	Then items' Quality is Equal to 0

	Given my system have those items
		| Name                                      | SellIn |
		| Backstage passes to a TAFKAL80ETC concert | -1     |
	When I update quality
	Then items' Quality is Equal to 0

@Step2
Scenario: Every items' "Quality" is never more than 50
	Given my system have those items
		| Name                                      | SellIn | Quality |
		| Item #1                                   | 1      | 50      |
		| Aged Brie                                 | 1      | 50      |
		| Sulfuras, Hand of Ragnaros                | 1      | 50      |
		| Backstage passes to a TAFKAL80ETC concert | 1      | 50      |
	When I update quality
	Then items' Quality is LowerOrEqual to 50

	Given my system have those items
		| Name                                      | SellIn | Quality |
		| Item #1                                   | 0      | 50      |
		| Aged Brie                                 | 0      | 50      |
		| Sulfuras, Hand of Ragnaros                | 0      | 50      |
		| Backstage passes to a TAFKAL80ETC concert | 0      | 50      |
	When I update quality
	Then items' Quality is LowerOrEqual to 50

	Given my system have those items
		| Name                                      | SellIn | Quality |
		| Item #1                                   | -1     | 50      |
		| Aged Brie                                 | -1     | 50      |
		| Sulfuras, Hand of Ragnaros                | -1     | 50      |
		| Backstage passes to a TAFKAL80ETC concert | -1     | 50      |
	When I update quality
	Then items' Quality is LowerOrEqual to 50
