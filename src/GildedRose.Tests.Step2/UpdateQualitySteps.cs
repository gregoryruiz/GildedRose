using GildedRose.Console;
using NFluent;
using System;
using System.Collections.Generic;
using System.Linq;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace GildedRose.Tests.Step2
{
    [Binding]
    public class UpdateQualitySteps
    {
        private static void CheckItemValueOperation(OperationWay operationWay, int operand, int currentItemValue, int originalItemValue)
        {
            switch (operationWay)
            {
                case OperationWay.Reduced:
                    Check.That(currentItemValue).IsEqualTo(originalItemValue - operand);
                    break;
                case OperationWay.Increased:
                    Check.That(currentItemValue).IsEqualTo(originalItemValue + operand);
                    break;
                case OperationWay.Equal:
                    Check.That(currentItemValue).IsEqualTo(operand);
                    break;
                case OperationWay.LowerOrEqual:
                    Check.That(currentItemValue <= operand).IsTrue();
                    break;
                case OperationWay.Unknown:
                default:
                    throw new ArgumentOutOfRangeException("stepWay");
            }
        }

        private Program _program;
        private IEnumerable<Item> _originalItems;

        [Given(@"my system have those items")]
        public void GivenMySystemHaveThoseItems(Table table)
        {
            _originalItems = table.CreateSet<Item>();
            _program = new Program { Items = table.CreateSet<Item>().ToList() };
        }

        [When(@"I update quality")]
        public void WhenIUpdateQuality()
        {
            _program.UpdateQuality();
        }

        [Then(@"my system should have those items")]
        public void MySystemShouldHaveThoseItems(Table table)
        {
            table.CompareToSet(_program.Items);
        }

        [Then(@"items' (SellIn|Quality) is (Reduced|Increased|Equal|LowerOrEqual) (?:by|to) (.*)")]
        public void ThenItemsXPropertyIsYModifiedBy(CheckedProperty checkedProperty, OperationWay operationWay, int operand)
        {
            foreach (var currentItem in _program.Items)
            {
                var originalItem = _originalItems.Single(o => o.Name == currentItem.Name);

                switch (checkedProperty)
                {
                    case CheckedProperty.SellIn:
                        CheckItemValueOperation(operationWay, operand, currentItem.SellIn, originalItem.SellIn);
                        break;
                    case CheckedProperty.Quality:
                        CheckItemValueOperation(operationWay, operand, currentItem.Quality, originalItem.Quality);
                        break;
                    case CheckedProperty.Unknown:
                    default:
                        throw new ArgumentOutOfRangeException("checkedProperty");
                }
            }
        }
    }
}
