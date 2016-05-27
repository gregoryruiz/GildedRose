using GildedRose.Console;
using System;
using System.Collections.Generic;
using System.Linq;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace GildedRose.Tests.Naive
{
    [Binding]
    public class UpdateQualitySteps
    {
        private Program _Program;

        [Given(@"my system have those items")]
        public void GivenMySystemHaveThoseItems(Table table)
        {
            _Program = new Program { Items = table.CreateSet<Item>().ToList() };
        }

        [When(@"the day ends")]
        public void WhenTheDayEnds()
        {
            _Program.UpdateQuality();
        }

        [Then(@"my system should have those items")]
        public void MySystemShouldHaveThoseItems(Table table)
        {
            table.CompareToSet(_Program.Items);
        }
    }
}
