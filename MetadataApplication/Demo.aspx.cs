using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MetadataApplication
{
    public partial class Demo : System.Web.UI.Page
    {
        public static object Utility { get; private set; }

        public static string Path { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Path = Server.MapPath("~/Metadata/");
            GridView1.DataSource = Getdata(Path);
            GridView1.DataBind();
        }
        private static List<Category> Getdata(string path)
        {
            string text = System.IO.File.ReadAllText(path + "test.json");
            var serializer = new JavaScriptSerializer();
            var Data = serializer.Deserialize<List<Category>>(text);
            return Data;
        }

        public class Field
        {
            public string Id { get; set; }
            public string CrmEntityName { get; set; }
            public string CrmFieldName { get; set; }
            public bool IsRequired { get; set; }
            public string RequiredFieldValidationErrorMessage { get; set; }
            public string LabelText { get; set; }
            public string Description { get; set; }
            public string Type { get; set; }
            public bool AllowOnlyHalfPoints { get; set; }
            public bool AllowDecimal { get; set; }
            public bool Visible { get; set; }
            public bool Enabled { get; set; }
            public int? Order { get; set; }//to be handled
            public int MaxLength { get; set; }
            public int MinLength { get; set; }
            public string DefaultValue { get; set; }
            public string DisplayFormat { get; set; }
            public string DisplayCondition { get; set; }
            public string Picklist { get; set; }
            public string PartsPicklist { get; set; }
            public string CalculateFunction { get; set; }
            public string AssociatedCategory { get; set; }
            public string DVR { get; set; }
            public string Parent { get; set; }
            public string DependentField { get; set; }
            public string dependentpicklist { get; set; }
            public bool initialLoad { get; set; }
            public bool PrimaryDisplayForCollection { get; set; }
            public bool IsCrmOptionSet { get; set; }
            public bool DoNotSendToBackend { get; set; }
            public bool SaveValueInsteadOfKey { get; set; }
            public bool AllowNegative { get; set; }
            public string ReportSubCategoryId { get; set; }
            public string ReportColumnName { get; set; }
            public string CrmEntityReferenceResponseField { get; set; }
        }

        public class Category
        {
            public string Id { get; set; }
            public string displayname { get; set; }
            public string image { get; set; }
            public bool visible { get; set; }
            public bool enabled { get; set; }
            public int order { get; set; }
            public bool AbilityToAdd { get; set; }
            public bool IsRequired { get; set; }
            public string dependentcategoryoncreation { get; set; }
            public string displaycondition { get; set; }
            public bool IgnoreValidation { get; set; }
            public List<Category> SubCategories { get; set; }
            public List<Field> Fields { get; set; }
        }

        public class Metadata
        {
            public string programid { get; set; }
            public string incidenttype { get; set; }
            public string ConfigVersion { get; set; }
            public List<Category> Categories { get; set; }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //skipping header row
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Category currentCategory = (Category)e.Row.DataItem;
                List<Category> subCatItems = currentCategory.SubCategories;

                GridView grdview = e.Row.FindControl("gridSubCategory") as GridView;
                grdview.DataSource = subCatItems;
                grdview.DataBind();
            }
        }

        protected void gridSubCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //skipping header row
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Category currentSubCategory = (Category)e.Row.DataItem;
                List<Category> subSubCatItems = currentSubCategory.SubCategories;

                GridView grdview = e.Row.FindControl("gridSubSubCategory") as GridView;
                grdview.DataSource = subSubCatItems;
                grdview.DataBind();
            }
        }
        protected void gridSubSubCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //skipping header row
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Category currentSubSubCategory = (Category)e.Row.DataItem;
                List<Field> fields = currentSubSubCategory.Fields;

                GridView grdview = e.Row.FindControl("gridFields") as GridView;
                grdview.DataSource = fields;
                grdview.DataBind();
            }
        }

        protected void gridFields_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static Category GetCatDetails(String ID)
        {
            List<Category> obj = Getdata(Path);
            Category category = obj.Where(cat => cat.Id == ID).FirstOrDefault();
            return category;
        }

        [System.Web.Services.WebMethod]
        public static Category GetSubCatDetails(String ID)
        {
            List<Category> obj = Getdata(Path);
            Category subCategory = obj.SelectMany(cat => cat.SubCategories).Where(subCat => subCat.Id == ID).FirstOrDefault();
            return subCategory;
        }

        [System.Web.Services.WebMethod]
        public static Category GetSubSubCatDetails(String ID)
        {
            List<Category> obj = Getdata(Path);
            Category subSubCategory = obj.SelectMany(cat => cat.SubCategories.SelectMany(subCat => subCat.SubCategories)).Where(subSubCat => subSubCat.Id == ID).FirstOrDefault();
            return subSubCategory;
        }

        [System.Web.Services.WebMethod]
        public static Field GetFieldDetails(String ID)
        {
            List<Category> obj= Getdata(Path);

            Field field = obj.SelectMany(s => s.SubCategories.SelectMany(x => x.SubCategories.SelectMany(f => f.Fields))).Where(i => i.Id == ID).FirstOrDefault();

            return field;
        }

        [System.Web.Services.WebMethod]
        public static bool ModifyFieldDetails(Field field)
        {
            bool isSuccess = false;
            List<Category> obj = Getdata(Path);

            Field newObj=obj.SelectMany(s => s.SubCategories.SelectMany(x => x.SubCategories.SelectMany(f => f.Fields))).Where(i => i.Id == field.Id).FirstOrDefault();
            newObj = field;

            // Pass the "list" object for conversion object to JSON string  
            //string jsondata = new JavaScriptSerializer().Serialize(obj);
            string jsondata = JsonConvert.SerializeObject(obj, Formatting.Indented);
            // Write that JSON to txt file,  
            System.IO.File.WriteAllText(Path + "output.json", jsondata);
            //= "Json file Generated! check this in your Metadata folder";
            return isSuccess;
        }
    }
}