using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using _2048Kata;

namespace _2048Kata_Tests
{
    [TestFixture]
    public class CellFixture
    {
        [Test]
        public void CellCanBeInstantitedWithAValue()
        {
            Cell testCell = new Cell(3);
            Assert.IsNotNull(testCell);
        }

        [Test]
        public void IsEmptyReturnsTrueWhenValueIsZero()
        {
            Cell testCell = new Cell(0);
            Assert.IsTrue(testCell.IsEmpty());
        }
    }
}
