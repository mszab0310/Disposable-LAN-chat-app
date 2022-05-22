using Chat_server.Net.IO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace Chat_server
{
    class Client
    {
        public string UserName { get; set; }
        public Guid UID { get; set; }
        public TcpClient ClientSocket { get; set; }

        PacketReader _packetReader;
        public Client(TcpClient client)
        {
            ClientSocket = client;
            UID = Guid.NewGuid();
            _packetReader = new PacketReader(ClientSocket.GetStream());

            var opcode = _packetReader.ReadByte();
            UserName = _packetReader.ReadMessage();

            Console.WriteLine($"[{DateTime.Now}]: Client has connected with the username: {UserName}");

            Task.Run(() => Process());
        }

        void Process()
        {
            while (true)
            {
                try
                {
                    var opcode = _packetReader.ReadByte();
                    switch (opcode)
                    {
                        case 5: var msg = _packetReader.ReadMessage();
                            Console.WriteLine($"[{DateTime.Now}]: Message Received! {msg}");
                            Program.BroadcastMessage($"[{DateTime.Now.ToString("HH:mm:ss")}] : [{UserName}]: {msg}");
                            break;

                        default:
                            break;
                    }
                }
                catch (Exception)
                {
                    Console.WriteLine($"[{UID.ToString()}]: Disconnected!");
                    Program.BroadcastDisconnect(UID.ToString());
                    ClientSocket.Close();
                    break;
                }
            }
        }
    }
}
