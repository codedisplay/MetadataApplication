using MetadataApplication.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MetadataApplication
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string path = Server.MapPath("~/Metadata/");
                string text = System.IO.File.ReadAllText(path + "output.json");
                var serializer = new JavaScriptSerializer();
                //var result = serializer.DeserializeObject(text);
                var Data = serializer.Deserialize<List<Field>>(text);

            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Field f = new Field();
            f.CrmEntityName = CrmEntityNameId.Text;
            f.CrmFieldName = CrmFieldNameId.Text;
            f.LabelText = LabelTextId.Text;

            // Pass the "list" object for conversion object to JSON string  
            string jsondata = new JavaScriptSerializer().Serialize(f);
            string path = Server.MapPath("~/Metadata/");
            // Write that JSON to txt file,  
            System.IO.File.WriteAllText(path + "output.json", jsondata);
            //= "Json file Generated! check this in your Metadata folder";
            //return RedirectToAction("Index"); ;
        }

        public DataTable ToDataTable<T>(IList<T> data)
        {
            PropertyDescriptorCollection props = TypeDescriptor.GetProperties(typeof(T));
            DataTable table = new DataTable();
            for (int i = 0; i < props.Count; i++)
            {
                PropertyDescriptor prop = props[i];
                table.Columns.Add(prop.Name, prop.PropertyType);
            }
            object[] values = new object[props.Count];
            foreach (T item in data)
            {
                for (int i = 0; i < values.Length; i++)
                {
                    values[i] = props[i].GetValue(item);
                }
                table.Rows.Add(values);
            }
            return table;
        }
    }
}