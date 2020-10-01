/*
@created by : Shashank Singla
@created on : 22-09-2020
@Used by : MetadataFetcherAdvanced(LWC Component)
@purpose: To Fetch Metadata Components Based on Specific Metadata Item.
*/
public class MetadataFetcherAdvanced {
    /*
getComponents(): Each Org has their Specific set of Metadata Items Configured so to fetch the same for Individual Org. We Need to fetch the same.
provided a legit Medatadata Name(cmptype ex. CustomObject) Should be Provided to fetch its components
*/
    @auraEnabled 
    public static response getComponents(){
        response res = new response();
        res.components = MetadataRetrieveController.init();
        return res;
    }
    
    /*
SearchObjects(): this method is solely responsible for getting all the metadata Components 
provided a legit Medatadata Name(cmptype ex. CustomObject) Should be Provided to fetch its components
*/
    @auraEnabled
    public static response SearchObjects(String cmptype)
    {
        response res = new response();
        List<metadataSchemaWrapper.typeVsId> WrapperList = new List<metadataSchemaWrapper.typeVsId>();
        Switch on cmptype {
            when 'Report'{
                for( Report obj : [SELECT Id,Name,developername,FolderName,NamespacePrefix FROM report])
                {
                    String folderName = obj.FolderName!='Public Reports'?obj.FolderName:'unfiled$public';
                    String NamespacePrefix = obj.NamespacePrefix!=null ?obj.NamespacePrefix+'__':'';
                    WrapperList.add(new metadataSchemaWrapper.typeVsId('Report','/'+obj.Id,folderName+'/'+NamespacePrefix+obj.developername,folderName+'/'+NamespacePrefix+obj.developername));
                }
            }
            when 'Document'{
                for( Document obj : [  SELECT Id, Folder.developername, DeveloperName, NamespacePrefix, Type FROM Document])
                {
                    String folderName = obj.Folder.developername!='Public Reports'?obj.Folder.developername:'unfiled$public';
                    
                    String NamespacePrefix = obj.NamespacePrefix!=null ?obj.NamespacePrefix+'__':'';
                    
                    WrapperList.add(new metadataSchemaWrapper.typeVsId('Document','/'+obj.Id,folderName+'/'+NamespacePrefix+obj.developername+'.'+obj.Type,folderName+'/'+NamespacePrefix+obj.developername+'.'+obj.Type));
                }
            }
            when 'EmailTemplate'{
                for( EmailTemplate obj : [SELECT Id, Name, DeveloperName, NamespacePrefix, FolderName,folder.developername  FROM EmailTemplate WHERE folderid!=: Userinfo.getUserId()])
                {
                    String folderName = obj.FolderName!='Unfiled Public Classic Email Templates' && obj.FolderName!='Public Email Templates'?obj.FolderName:'unfiled$public';
                    String NamespacePrefix = obj.NamespacePrefix!=null ?obj.NamespacePrefix+'__':'';
                    WrapperList.add(new metadataSchemaWrapper.typeVsId('EmailTemplate','/'+obj.Id,folderName+'/'+NamespacePrefix+obj.developername,folderName+'/'+NamespacePrefix+obj.developername));
                }
            }
            when 'CustomObject' {
                for(EntityDefinition entity: [SELECT Id,QualifiedApiName,masterlabel,newUrl,namespacePrefix  FROM EntityDefinition
                                              WHERE isqueryable=true and istriggerable =true and  IsCustomizable = true])
                {
                    String NamespacePrefix = entity.NamespacePrefix!=null ?entity.NamespacePrefix+'__':'';
                    WrapperList.add(new metadataSchemaWrapper.typeVsId('CustomObject',entity.newUrl.substring(1),NamespacePrefix+entity.QualifiedApiName,NamespacePrefix+entity.masterlabel));
                }
            }
            when 'AuraDefinitionBundle' {
                for( AuraDefinitionBundle Cmp : [SELECT Id,developername,MasterLabel,namespacePrefix FROM AuraDefinitionBundle])
                {
                    String NamespacePrefix = Cmp.NamespacePrefix!=null ?Cmp.NamespacePrefix+'__':'';
                    WrapperList.add(new metadataSchemaWrapper.typeVsId('AuraDefinitionBundle','/'+Cmp.Id,NamespacePrefix+Cmp.developername,NamespacePrefix+Cmp.MasterLabel));
                }
            }
            when 'StaticResource'{
                for( StaticResource resource : [SELECT Id, Name,NamespacePrefix  FROM StaticResource])
                {
                    String NamespacePrefix = resource.NamespacePrefix!=null ?resource.NamespacePrefix+'__':'';
                    WrapperList.add(new metadataSchemaWrapper.typeVsId('StaticResource','/'+resource.Id,NamespacePrefix+resource.name,NamespacePrefix+resource.name));
                }
            }
            when 'ApexClass' {
                for(ApexClass className : [SELECT Id,Name,namespacePrefix FROM apexClass])
                {
                    String NamespacePrefix = className.NamespacePrefix!=null ?className.NamespacePrefix+'__':'';
                    WrapperList.add(new metadataSchemaWrapper.typeVsId('ApexClass','/'+className.Id,NamespacePrefix+className.name,NamespacePrefix+className.name));
                }
            }
            when 'ApexTrigger' {
                for(ApexTrigger Trigg: [SELECT Id,name,namespacePrefix FROM apexTrigger])
                {
                    String NamespacePrefix = Trigg.NamespacePrefix!=null ?Trigg.NamespacePrefix+'__':'';
                    WrapperList.add(new metadataSchemaWrapper.typeVsId('ApexTrigger','/'+Trigg.Id,NamespacePrefix+Trigg.Name,NamespacePrefix+Trigg.Name));
                }
            }
            when 'CustomTab'{
                for( TabDefinition tab : [SELECT url,Name, Label FROM TabDefinition WHERE IsCustom =true])
                {
                    WrapperList.add(new metadataSchemaWrapper.typeVsId('CustomTab',tab.url,tab.Name,tab.Label));
                }
            }
            when 'RecordType' {
                for( RecordType rType : [SELECT Id,Name,developerName,SobjectType,NamespacePrefix  FROM RecordType])
                {
                    String NamespacePrefix = rType.NamespacePrefix!=null ?rType.NamespacePrefix+'__':'';
                    WrapperList.add(new metadataSchemaWrapper.typeVsId('RecordType','/'+rType.Id,rtype.SobjectType+'.'+NamespacePrefix+rType.developerName,rtype.SobjectType+'.'+NamespacePrefix+rType.name));
                }
            }
            when 'ApexPage'{
                for(ApexPage vf : [SELECT Id,name,MasterLabel,NamespacePrefix FROM ApexPage])
                {
                    String NamespacePrefix = vf.NamespacePrefix!=null ?vf.NamespacePrefix+'__':'';
                    WrapperList.add(new metadataSchemaWrapper.typeVsId('ApexPage','/'+vf.Id,NamespacePrefix+vf.name,NamespacePrefix+vf.MasterLabel));
                }
            }
            when else {
                WrapperList= MetadataRetrieveController.listMetadataItems(cmptype);
            }
        }
        res.metaList = WrapperList;
        return res;
    }
    
    public class response{
        @auraEnabled
        public list<String> components = new List<String>();
        @auraEnabled
        public List<metadataSchemaWrapper.typeVsId> metaList;
        @auraEnabled
        public boolean einsteinEnabled = false;
    }
}