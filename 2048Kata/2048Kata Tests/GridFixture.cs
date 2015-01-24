using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using _2048Kata;


namespace _2048Kata_Tests.Grid_Tests
{
    [TestFixture]
    public class GridFixture
    {
        [Test]
        public void GridCanBeInstantiatedWithInitialCoordinates()
        {
            NumberGrid grid = new NumberGrid(1,1,2,2);
            Assert.IsNotNull(grid);
        }

        [Test]
        public void NewlyInstatiatedGridPlacesNotEmptyCellsAtStartingCoordinates()
        {
            NumberGrid grid = new NumberGrid(0, 0, 1, 2);
            Assert.IsTrue(2 == grid.Cells(0, 0).Value, "First cell is not set.");
            Assert.IsTrue(2 == grid.Cells(1, 2).Value, "Second cell is not set.");

            for (int x = 0; x <= 3; x++)
            {
                for (int y = 0; y <= 3; y++)
                {
                    if ((!(x==0 && y==0)) && (!(x==1 && y==2)))
                    {
                        Assert.IsTrue(grid.Cells(x, y).IsEmpty(), String.Format("Cell {0}, {1} is not empty.",x,y));
                    }
                }
            }
        }

        //[Test]
        //public void GridCanSlideDown()
        //{
        //    NumberGrid grid = new NumberGrid(1, 1, 2, 3);
        //    grid.Slide(slideDirection.down);
        //    Assert.IsTrue(grid.Cells(4, 1).IsEmpty);
        //    Assert.IsTrue(grid.Cells(4, 2).IsEmpty);
        //}
    }
}
