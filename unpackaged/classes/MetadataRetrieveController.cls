public with sharing class MetadataRetrieveController
{
    private static final Integer METADATA_API_VERSION =
        Integer.valueOf(new MetadataService.MetadataPort().endpoint_x.substringAfterLast('/'));
    public static List<SelectOption> MetaDataItems {get; set;}
    public static String MetaDataFolder {get; set;}

    public static List<String> init()
    {
        // List available Metadata Types via the 'describeMetadata' API call
        MetadataService.MetadataPort service = createService();
        MetadataService.DescribeMetadataResult describeResult = service.describeMetadata(METADATA_API_VERSION);
        List<String> metadataTypeNames = new List<String>();
        for(MetadataService.DescribeMetadataObject metadataObject : describeResult.metadataObjects)
        {
            metadataTypeNames.add(metadataObject.xmlName);
            // Include child Metadata Types (such as CustomField, ValidationRule etc..)
            if(metadataObject.childXmlNames!=null){
                for(String childXmlName : metadataObject.childXmlNames)
                    if(childXmlName!=null)
                    {
                        metadataTypeNames.add(childXmlName);
                       }
            }
        }
        // Sort Metadata Types
        metadataTypeNames.sort();
        return metadataTypeNames;
    }

    public static List<metadataSchemaWrapper.typeVsId> listMetadataItems(string MetaDataType)
    {
        List<metadataSchemaWrapper.typeVsId> metaList = new List<metadataSchemaWrapper.typeVsId>();

        // List Metadata items for the selected Metadata Type
        MetaDataItems = new List<SelectOption>();
        MetadataService.MetadataPort service = createService();
        List<MetadataService.ListMetadataQuery> queries = new List<MetadataService.ListMetadataQuery>();
        MetadataService.ListMetadataQuery queryLayout = new MetadataService.ListMetadataQuery();
        if(MetaDataFolder!=null && MetaDataFolder.length()>0)
            queryLayout.folder = MetaDataFolder;
        queryLayout.type_x = MetaDataType;
        queries.add(queryLayout);
        system.debug('queries'+queries);
        MetadataService.FileProperties[] fileProperties = service.listMetadata(queries, METADATA_API_VERSION);

        // Sort
        List<String> fullNames = new List<String>();
        if(fileProperties!=null)
        {
            for(MetadataService.FileProperties fileProperty : fileProperties)
               { fullNames.add(fileProperty.fullName);}
            fullNames.sort();
            for(String fullName : fullNames){
                MetaDataItems.add(new SelectOption(fullName,EncodingUtil.urlDecode(fullName, 'UTF-8')));
                metaList.add(new metadataSchemaWrapper.typeVsId(MetaDataType,'/'+fullName,fullName,fullName) );
            }

        }
        system.debug('fullNames->'+fullNames);

        return metaList;
    }
    private static MetadataService.MetadataPort createService()
    {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.SessionHeader = new MetadataService.SessionHeader_element();
        String content = Page.SessionIdViewer.getContent().toString();

        String tokenSession =  content.substringbetween('Session_Id_Start_Here','Session_Id_End_Here');

        service.SessionHeader.sessionId = tokenSession;
        return service;
    }
}