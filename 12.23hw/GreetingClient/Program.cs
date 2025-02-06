using Grpc.Net.Client;

using var channel = GrpcChannel.ForAddress("https://localhost:5001");

Console.WriteLine("Enter your name:");
var name = Console.ReadLine();
var client = new Greeter

var request = new HelloRequest { Name = name };
var reply = await client.SayHelloAsync(request);

Console.WriteLine($"Server Response: {reply.Message}");