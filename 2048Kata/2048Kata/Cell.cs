using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace _2048Kata
{
    public class Cell
    {
        private int _value;

        public Cell(int value)
        {
            this._value = value;
        }

        public int Value { get { return _value; }   }

        public bool IsEmpty()
        {
             return this._value == 0;
        }
    }
}
