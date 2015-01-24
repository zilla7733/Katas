using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace _2048Kata
{
    public class NumberGrid
    {
        private Cell[,] _cells = new Cell[4, 4];

        public NumberGrid(int x1, int y1, int x2, int y2)
        {
            for (int x = 0; x <= 3; x++)
            {
                for (int y = 0; y <= 3; y++)
                {
                    if ((!(x == x1 && y == y1)) && (!(x == x2 && y == y2)))
                    {
                        _cells[x,y] = new Cell(0);
                    }
                    else
                    {
                        _cells[x,y] = new Cell(2);
                    }
                }
            }
        }
        
        public Cell Cells(int x, int y)
        {
            return _cells[x, y];
        }
    }
}
