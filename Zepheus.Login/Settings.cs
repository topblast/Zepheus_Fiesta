using System.IO;

using Zepheus.Util;

namespace Zepheus.Login
{
    public sealed class Settings : InterLib.Settings
    {
        public const int SettingsVersion = 2;

        public int? Version { get; set; }
        public ushort Port { get; set; }
        public bool Debug { get; set; }
        public int WorkInterval { get; set; }

        public string LoginServiceURI { get; set; }
        public string InterPassword { get; set; }
        public ushort InterServerPort { get; set; }

        public string DataFolder { get; set; }

        public EntitySetting Entity { get; set; }

        public static Settings Instance { get; set; }

        public static bool Load(string path)
        {
            Settings obj;
            if (!Load(path, out obj))
                return false;
            
            try
            {
                if (obj.DataFolder == null)
                {
                    obj.DataFolder = "Data";
                    obj.Save(path);
                }
                if (!obj.Version.HasValue || obj.Version.Value != SettingsVersion)
                {
                    if (!obj.Version.HasValue)
                    {
                        // V.1
                        obj.InterServerPort = 10000;
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
