using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zdd.Client
{
    class Program
    {
        static void Main(string[] args)
        {
            bool exit = false;
            while (!exit)
            {
                Console.WriteLine("Press [P] to start test products....");
                Console.WriteLine("Press [X] to exit....");
                var key = Console.ReadKey().KeyChar;
                switch (key)
                {
                    case 'p':
                    case 'P':
                        new ProductsClient().Start();
                        break;
                    case 'x':
                    case 'X':
                        exit = true;
                        break;
                        
                }
            }
        }
    }
}
