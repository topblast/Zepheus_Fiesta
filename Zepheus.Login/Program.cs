using System;
using System.Linq;
using Zepheus.Database;
using Zepheus.Util;
#if DEBUG
using System.IO;
#endif

namespace Zepheus.Login
{
    class Program
    {
        public static AccountEntity Entity { get; set; }


        static void Main(string[] args)
        {
            //if debug we always start with default settings :)
#if DEBUG
            if (File.Exists("Login.xml"))
                File.Delete("Login.xml");
#endif
            Console.Title = "Zepheus.Login";
            if (Load())
            {
                Log.IsDebug = Settings.Instance.Debug;
                Log.WriteLine(LogLevel.Info, "Ready...");
                while (true)
                    Console.ReadLine();
            }
            else
            {
                Log.WriteLine(LogLevel.Error, "Could not start server. Press RETURN to exit.");
                Console.ReadLine();
            }
        }

        public static bool Load()
        {
            if (!Settings.Load("Login.json"))
            {
                CreateDefaultSettings();
                Settings.Instance.Save("Login.json");
            }

            Log.SetLogToFile(string.Format(@"Logs\Login\{0}.log", DateTime.Now.ToString("d_M_yyyy HH_mm_ss")));

            if (Reflector.GetInitializerMethods().Any(method => !method.Invoke()))
            {
                Log.WriteLine(LogLevel.Error, "Server could not be started. Errors occured.");
                return false;
            }
            else return true;
        }

        private static void CreateDefaultSettings()
        {
            Settings.Instance = new Settings()
            {
                Port = 9010,
                Debug = true,
                WorkInterval = 1,
                LoginServiceURI = "net.pipe://localhost/LoginService",
                InterPassword = "buttsecks",
                DataFolder = "Data",
            };

            Settings.Instance.Entity = new EntitySetting()
            {
                DataCatalog = "Zepheus_Account",
                DataSource = @"SQLSERVER\FIESTA",
                Metadata = @"res://*/Account.csdl|res://*/Account.ssdl|res://*/Account.msl",
            };
        }
    }
}
