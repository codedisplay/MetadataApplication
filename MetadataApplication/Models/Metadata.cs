using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MetadataApplication.Models
{
    public class Field
    {
        public string Id { get; set; }
        public string CrmEntityName { get; set; }
        public string CrmFieldName { get; set; }
        public bool IsRequired { get; set; }
        public object RequiredFieldValidationErrorMessage { get; set; }
        public string LabelText { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public bool AllowOnlyHalfPoints { get; set; }
        public bool AllowDecimal { get; set; }
        public bool Visible { get; set; }
        public bool Enabled { get; set; }
        public int Order { get; set; }
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
        public bool? AllowNegative { get; set; }
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
}