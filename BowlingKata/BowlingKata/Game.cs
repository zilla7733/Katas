using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;

namespace BowlingKata
{
    public class Frame
    {
        public int FirstThrow { get; set; }
        public int SecondThrow { get; set; }
    }

    public class Game
    {
        private List<Frame> _frames = new List<Frame>();
        private int? _firstThrow = null;

        public void Throw(int pinsKnockedDown)
        {
            if (_firstThrow.HasValue)
            {
                if(_firstThrow < 10)
                {
                    _frames.Add(new Frame() {FirstThrow=_firstThrow.Value,SecondThrow=pinsKnockedDown});
                    _firstThrow = null;
                }
                else
                {
                    _frames.Add(new Frame() {FirstThrow = _firstThrow.Value});
                    _firstThrow = pinsKnockedDown;
                }
            }
            else
            {_firstThrow = pinsKnockedDown;}
        }

        public int Score()
        {
            var score = 0;

            for (var i = 0; i <= _frames.Count - 1; i++)
            {
                if (i > 0)
                {
                    if (_frames[i-1].FirstThrow + _frames[i-1].SecondThrow == 10)
                    {
                        score += _frames[i].FirstThrow;
                        
                    }
                    if (_frames[i - 1].FirstThrow == 10 && _frames[i].FirstThrow != 10)
                        score += _frames[i].SecondThrow;
                    
                }
                if (i > 1)
                {
                    if (_frames[i - 2].FirstThrow == 10 && _frames[i - 1].FirstThrow == 10)
                        score += _frames[i].FirstThrow;
                }

                if (i < 10)
                {
                    score += _frames[i].FirstThrow + _frames[i].SecondThrow;
                }
            }

            return score;
        }

    }

    [TestFixture]
    public class GameTests
    {
        [Test]
        public void GameOfAllZerosReturnsAScoreOfZero()
        {
            var game = new Game();
            for (int i = 0; i < 20; i++)
            {
                game.Throw(0);
            }
            Assert.AreEqual(0, game.Score());
        }

        [Test]
        public void GameOfAllOnesReturnsAScoreOfTwenty()
        {
            var game = new Game();
            for (int i = 0; i < 20; i++)
            {
                game.Throw(1);
            }
            Assert.AreEqual(20, game.Score());
        }

        [Test]
        public void ASpareCountsTheNextBallAsABonus()
        {
            var game = new Game();
            game.Throw(5);
            game.Throw(5);
            game.Throw(5);
            for (int i = 0; i < 17; i++)
            {
                game.Throw(0);
            }
            Assert.AreEqual(20, game.Score());
        }

        [Test]
        public void TwoSeparateNonSpareFramesDoNotCountAsASpare()
        {
            var game = new Game();
            game.Throw(0);
            game.Throw(5);
            game.Throw(5);
            game.Throw(1);

            for (var i = 0; i < 16; i++)
            {
                game.Throw(0);
            }
            Assert.AreEqual(11, game.Score());
        }

        [Test]
        public void AStrikeCountsTheNextTwoBallsAsABonus()
        {
            var game = new Game();
            game.Throw(10);
            game.Throw(4);
            game.Throw(6);
            for (int i = 0; i < 16; i++)
            {
                game.Throw(0);
            }
            Assert.AreEqual(30, game.Score());
        }

        [Test]
        public void APerfectGamesIs300()
        {
            var game = new Game();
            for (int i = 0; i < 12; i++)
            {
                game.Throw(10);
            }
            Assert.AreEqual(300, game.Score());
        }

        [Test]
        public void RandomTest1()
        {
            var game = new Game();
            for (int i = 0; i < 10; i++)
            {
                game.Throw(5);
                game.Throw(3);
            }
            Assert.AreEqual(80, game.Score());
        }

        [Test]
        public void RandomTest2()
        {
            var game = new Game();
            for (int i = 0; i < 10; i++)
            {
                game.Throw(7);
                game.Throw(3);
            }
            game.Throw(7);
            game.Throw(0);
            Assert.AreEqual(170, game.Score());
        }

    }
}
