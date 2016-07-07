using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using Newtonsoft.Json;


namespace Zepheus.InterLib
{
    public abstract class Settings
    {
        public void Save(string path)
        {
            JsonSerializer jser = new JsonSerializer()
            {
                Formatting = Formatting.Indented
            };
            using (var file = File.Create(path))
            using (var writer = new StreamWriter(file))
            using (var jwriter = new JsonTextWriter(writer))
            {
                jser.Serialize(jwriter, this, GetType());
            }
        }

        public static bool Load<T>(string path, out T settings) where T : Settings
        {
            settings = null;

            if (!File.Exists(path))
                return false;

            try
            {
                JsonSerializer jser = new JsonSerializer();
                using (var file = File.Open(path, FileMode.Open))
                using (var reader = new StreamReader(file))
                using (var jreader = new JsonTextReader(reader))
                {
                    settings = jser.Deserialize<T>(jreader);
                }

                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
