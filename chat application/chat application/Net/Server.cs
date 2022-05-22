using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Sockets;
using chat_application.Net.IO;

namespace chat_application.Net
{
    class Server
    {
        TcpClient _client;
        public PacketReader PacketReader;

        public event Action connectedEvent;
        public event Action msgRecievedEvent;
        public event Action userDisconnectedEvent;
       
        public Server()
        {
            _client = new TcpClient();
        }

        public void ConnectToServer(string username, string address)
        {
            string ip = address.Split(":")[0];
            string pt = address.Split(":")[1];
            int port = Int32.Parse(pt);
            if (!_client.Connected)
            {
                try
                {
                    _client.Connect(ip, port);
                    Console.WriteLine("Succesfully connected @ " + ip + ":"+port);
                }
                catch (Exception)
                {
                    throw;
                }

                try
                {
                    PacketReader = new PacketReader(_client.GetStream());

                }
                catch (Exception)
                {
                    throw;
                }
                

                if (!string.IsNullOrEmpty(username))
                {
                    var connectPacket = new PacketBuilder();
                    connectPacket.WriteOpCode(0);
                    connectPacket.WriteMessage(username);
                    _client.Client.Send(connectPacket.GetPacketBytes());
                }
                ReadPackets();
            }
        }

        private void ReadPackets()
        {
            Task.Run(() =>
            {
                while (true)
                {
                    var opcode = PacketReader.ReadByte();
                    switch (opcode)
                    {
                        case 1: connectedEvent?.Invoke(); 
                            break;
                        case 5:
                            msgRecievedEvent?.Invoke();
                            break;
                        case 10:
                            userDisconnectedEvent?.Invoke();
                            break;
                        default:
                            Console.WriteLine("Error...");
                            break;
                    }
                }
            });
        }

        public void SendMessageToServer(string message)
        {
            var messagePacket = new PacketBuilder();
            messagePacket.WriteOpCode(5);
            messagePacket.WriteMessage(message);
            _client.Client.Send(messagePacket.GetPacketBytes());
        } 
    }
}
