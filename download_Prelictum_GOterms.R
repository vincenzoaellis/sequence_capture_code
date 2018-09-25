#### Download GO terms for P. relictum from PlasmoDB website
#### Vincenzo A. Ellis
#### 25 September 2018

prel_go <- function(){
  require(data.table)
  gaf.colnames <- c("DB", "DB Object ID", "DB Object Symbol", "Qualifier", "GO_ID",
                    "DB_Reference", "Evidence_Code", "With_or_From", "Aspect", "DB_Object_Name",
                    "DB_Object_Synonym", "DB_Object_Type", "Taxon", "Date", "Assigned_By",
                    "Annotation_Extension", "Gene_Product_Form_ID")
  x <- read.delim("http://plasmodb.org/common/downloads/Current_Release/PrelictumSGS1-like/gaf/PlasmoDB-39_PrelictumSGS1-like_GO.gaf", 
             skip = 1,
             col.names = gaf.colnames)
  return(x)
}
