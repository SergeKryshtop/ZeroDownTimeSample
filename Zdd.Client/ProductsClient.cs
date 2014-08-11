using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using RestSharp;
using Zdd.Client.Models;


namespace Zdd.Client
{
    public class ProductsClient
    {
        public const string ApiUrl = "http://localhost/zddapi/api";
        private readonly RestClient _client = new RestClient(ApiUrl);


        public void Start()
        {
            Read();
        }


        private void Post()
        {
            
        }

        private void Read()
        {
            
            // client.Authenticator = new HttpBasicAuthenticator(username, password);

            int skip = 0;

            var startDateTime = DateTime.UtcNow;
            var requesStopwatch = new Stopwatch();
            
            TimeSpan timeSpent = TimeSpan.Zero;
            
            while (true)
            {
                var request = new RestRequest("products", Method.GET);

                request.AddParameter("skip", skip);
                requesStopwatch.Restart(); 
                
                // async with deserialization
                var asyncHandle = _client.ExecuteAsync<List<ProductViewModel>>(request, response =>
                {
                    var status = response.StatusCode;
                    timeSpent = DateTime.UtcNow - startDateTime;

                    if (response.Data != null && response.Data.Any())
                    {
                        foreach (var product in response.Data)
                        {
                            PrintConsoleMessage(
                                string.Format("{4} GET {0} {3}ms Product ID: {1} NAME: {2}", status, product.Id, product.Name, requesStopwatch.ElapsedMilliseconds, timeSpent),
                                ConsoleColor.Green);
                        }
                    }
                    else
                    {
                        PrintConsoleMessage(string.Format("{1} GET {0} ", status, timeSpent), ConsoleColor.Red);
                    }
                });


                timeSpent = DateTime.UtcNow - startDateTime;
                if (timeSpent.TotalMinutes >= 2)
                    break;
               
                skip += 10;
                Thread.Sleep(50);
            }
        }

        private void PrintConsoleMessage(string message, ConsoleColor color)
        {
            var previousColor = Console.ForegroundColor;
            Console.ForegroundColor = color;
            Console.WriteLine(message);
            Console.ForegroundColor = previousColor;
        }
    }
}
