using System.IO;
using System.Xml.Serialization;


namespace Zepheus.Zone
{
    public sealed class Settings : InterLib.Settings
    {
        public const int SettingsVersion = 2;

        public int? Version { get; set; }
        public string IP { get; set; }
        public bool Debug { get; set; }
        public int WorkInterval { get; set; }
        public int TransferTimeout { get; set; }

        public string WorldServiceURI { get; set; }
        public string InterPassword { get; set; }
        public string WorldServerIP { get; set; }
        public ushort WorldServerPort { get; set; }
        public ushort InterServerPort { get; set; }

        public string DataFolder { get; set; }
        public bool UseSHBD { get; set; }

        public static Settings Instance { get; set; }

        public static bool Load(string path)
        {
            Settings obj;
            if (!Load(path, out obj))
                return false;

            try
            {
                if (!obj.Version.HasValue || obj.Version.Value != SettingsVersion)
                {
                    if (!obj.Version.HasValue)
                    {
                        // V.1
                        obj.WorldServerIP = "127.0.0.1";
                        obj.WorldServerPort = 11000;
                    }

                    obj.Version = SettingsVersion;
                    obj.Save(path);
                }
                Settings.Instance = obj;
                return true;
            }
            catch
            {
                return false;
            }

        }
    }
}
