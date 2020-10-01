public class metadataSchemaWrapper {
    public class typeVsId
    {
        @auraEnabled
        public string cmptype;
        @auraEnabled
        public String Id;
        @auraEnabled 
        public string objName;
        @auraEnabled
        public String value;
        @auraEnabled 
        public String NamespacePrefix='';
        @auraEnabled 
        public Boolean IsQueryable;
        @auraEnabled
        public string  label;
        public typeVsId(string cmptype,string Id,string value,string label){
            this.cmptype = cmptype;
            this.Id = Id;
            this.value= value;
            this.label = label;
        }
    }
    
}