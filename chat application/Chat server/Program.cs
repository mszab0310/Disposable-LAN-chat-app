using Chat_server.Net.IO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;

namespace Chat_server
{
    class Program
    {

        static TcpListener _listener;
        static List<Client> _users;
        static void Main(string[] args)
        {
            _users = new List<Client>();
            Startup:
            Console.WriteLine("Please enter the ip adress you wish to host on:");
            string ip = Console.ReadLine(); 
            Console.WriteLine("Please enter the port you wish to host on:");
            int port = Convert.ToInt32(Console.ReadLine());
            
            try
            {
                _listener = new TcpListener(IPAddress.Parse(ip), port);
            }
            catch (Exception)
            {   
                Console.WriteLine("-------!!!!ERROR!!!!-------");
                Console.WriteLine("Invalid address or port(out of range)");
                Console.WriteLine("----------------------------------");
                goto Startup;
            }
            try
            {
                _listener.Start();
                Console.WriteLine("----------------------------------");
                Console.WriteLine("Chat Server running at " + ip + ":" + port);
                Console.WriteLine("----------------------------------");
            }
            catch (Exception)
            {
                Console.WriteLine("-------!!!!ERROR!!!!-------");
                Console.WriteLine("Invalid ip adress for the context");
                Console.WriteLine("----------------------------------");    
                goto Startup;
            }
            
            while (true)
            {
                var client = new Client(_listener.AcceptTcpClient());
                _users.Add(client);
                BroadcastConnection();
            }            
        }

        static void BroadcastConnection()
        {
            foreach( var user in _users)
            {
                foreach(var usr in _users)
                {
                    var broadcastPacket = new PacketBuilder();
                    broadcastPacket.WriteOpCode(1);
                    broadcastPacket.WriteMessage(usr.UserName);
                    broadcastPacket.WriteMessage(usr.UID.ToString());
                    user.ClientSocket.Client.Send(broadcastPacket.GetPacketBytes());
                }
            }
        }

        public static void BroadcastMessage(string message)
        {
            foreach(var user in _users)
            {
                var msgPacket = new PacketBuilder();
                msgPacket.WriteOpCode(5);
                msgPacket.WriteMessage(message);
                user.ClientSocket.Client.Send(msgPacket.GetPacketBytes());
            }
        }

        public static void BroadcastDisconnect(string uid)
        {
            var disconnectedUser = _users.Where(x => x.UID.ToString() == uid).FirstOrDefault();
            _users.Remove(disconnectedUser);
            foreach (var user in _users)
            {
                var broadcastPacket = new PacketBuilder();
                broadcastPacket.WriteOpCode(10);
                broadcastPacket.WriteMessage(uid);
                user.ClientSocket.Client.Send(broadcastPacket.GetPacketBytes());
            }
            BroadcastMessage($"[{disconnectedUser.UserName}] Disconnected");
        }
    }
}
