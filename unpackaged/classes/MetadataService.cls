public class MetadataService {
    public static String SOAP_M_URI = 'http://soap.sforce.com/2006/04/metadata';
    public class SessionHeader_element {
        public String sessionId;
        private String[] sessionId_type_info = new String[]{'sessionId',SOAP_M_URI,null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                private String[] field_order_type_info = new String[]{'sessionId'};
                    }
    public class DebuggingInfo_element {
        public String debugLog;
        private String[] debugLog_type_info = new String[]{'debugLog',SOAP_M_URI,null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                private String[] field_order_type_info = new String[]{'debugLog'};
                    }
    public class CallOptions_element {
        public String client;
        private String[] client_type_info = new String[]{'client',SOAP_M_URI,null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                private String[] field_order_type_info = new String[]{'client'};
                    }
    public class LogInfo {
        public String category;
        public String level;
        private String[] category_type_info = new String[]{'category',SOAP_M_URI,null,'1','1','false'};
            private String[] level_type_info = new String[]{'level',SOAP_M_URI,null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                    private String[] field_order_type_info = new String[]{'category','level'};
                        }
    public class DebuggingHeader_element {
        public MetadataService.LogInfo[] categories;
        public String debugLevel;
        private String[] categories_type_info = new String[]{'categories',SOAP_M_URI,null,'0','-1','false'};
            private String[] debugLevel_type_info = new String[]{'debugLevel',SOAP_M_URI,null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                    private String[] field_order_type_info = new String[]{'categories','debugLevel'};
                        }
    public class AllOrNoneHeader_element {
        public Boolean allOrNone;
        private String[] allOrNone_type_info = new String[]{'allOrNone',SOAP_M_URI,null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                private String[] field_order_type_info = new String[]{'allOrNone'};
                    }
    public class DescribeMetadataObject {
        public String[] childXmlNames;
        public String directoryName;
        public Boolean inFolder;
        public Boolean metaFile;
        public String suffix;
        public String xmlName;
        private String[] childXmlNames_type_info = new String[]{'childXmlNames',SOAP_M_URI,null,'0','-1','false'};
            private String[] directoryName_type_info = new String[]{'directoryName',SOAP_M_URI,null,'1','1','false'};
                private String[] inFolder_type_info = new String[]{'inFolder',SOAP_M_URI,null,'1','1','false'};
                    private String[] metaFile_type_info = new String[]{'metaFile',SOAP_M_URI,null,'1','1','false'};
                        private String[] suffix_type_info = new String[]{'suffix',SOAP_M_URI,null,'0','1','false'};
                            private String[] xmlName_type_info = new String[]{'xmlName',SOAP_M_URI,null,'1','1','false'};
                                private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                                    private String[] field_order_type_info = new String[]{'childXmlNames','directoryName','inFolder','metaFile','suffix','xmlName'};
                                        }
    public class DescribeMetadataResult {
        public MetadataService.DescribeMetadataObject[] metadataObjects;
        public String organizationNamespace;
        public Boolean partialSaveAllowed;
        public Boolean testRequired;
        private String[] metadataObjects_type_info = new String[]{'metadataObjects',SOAP_M_URI,null,'0','-1','false'};
            private String[] organizationNamespace_type_info = new String[]{'organizationNamespace',SOAP_M_URI,null,'1','1','false'};
                private String[] partialSaveAllowed_type_info = new String[]{'partialSaveAllowed',SOAP_M_URI,null,'1','1','false'};
                    private String[] testRequired_type_info = new String[]{'testRequired',SOAP_M_URI,null,'1','1','false'};
                        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                            private String[] field_order_type_info = new String[]{'metadataObjects','organizationNamespace','partialSaveAllowed','testRequired'};
                                }
    public class describeMetadata_element {
        public Double asOfVersion;
        private String[] asOfVersion_type_info = new String[]{'asOfVersion',SOAP_M_URI,null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                private String[] field_order_type_info = new String[]{'asOfVersion'};
                    }
    public class describeMetadataResponse_element {
        public MetadataService.DescribeMetadataResult result;
        private String[] result_type_info = new String[]{'result',SOAP_M_URI,null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                private String[] field_order_type_info = new String[]{'result'};
                    }
    public class RetrieveResult {
        public Boolean done;
        public String errorMessage;
        public String errorStatusCode;
        public MetadataService.FileProperties[] fileProperties;
        public String id;
        public MetadataService.RetrieveMessage[] messages;
        public String status;
        public Boolean success;
        public String zipFile;
        private String[] done_type_info = new String[]{'done',SOAP_M_URI,null,'1','1','false'};
            private String[] errorMessage_type_info = new String[]{'errorMessage',SOAP_M_URI,null,'0','1','false'};
                private String[] errorStatusCode_type_info = new String[]{'errorStatusCode',SOAP_M_URI,null,'0','1','false'};
                    private String[] fileProperties_type_info = new String[]{'fileProperties',SOAP_M_URI,null,'0','-1','false'};
                        private String[] id_type_info = new String[]{'id',SOAP_M_URI,null,'1','1','false'};
                            private String[] messages_type_info = new String[]{'messages',SOAP_M_URI,null,'0','-1','false'};
                                private String[] status_type_info = new String[]{'status',SOAP_M_URI,null,'1','1','false'};
                                    private String[] success_type_info = new String[]{'success',SOAP_M_URI,null,'1','1','false'};
                                        private String[] zipFile_type_info = new String[]{'zipFile',SOAP_M_URI,null,'1','1','false'};
                                            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                                                private String[] field_order_type_info = new String[]{'done','errorMessage','errorStatusCode','fileProperties','id','messages','status','success','zipFile'};
                                                    }
    public class checkRetrieveStatus_element {
        public String asyncProcessId;
        public Boolean includeZip;
        private String[] asyncProcessId_type_info = new String[]{'asyncProcessId',SOAP_M_URI,null,'1','1','false'};
            private String[] includeZip_type_info = new String[]{'includeZip',SOAP_M_URI,null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                    private String[] field_order_type_info = new String[]{'asyncProcessId','includeZip'};
                        }
    public class checkRetrieveStatusResponse_element {
        public MetadataService.RetrieveResult result;
        private String[] result_type_info = new String[]{'result',SOAP_M_URI,null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                private String[] field_order_type_info = new String[]{'result'};
                    }
    public virtual class Metadata {
        public String fullName;
    }
    public class AsyncResult {
        public Boolean done;
        public String id;
        public String message;
        public String state;
        public String statusCode;
        private String[] done_type_info = new String[]{'done',SOAP_M_URI,null,'1','1','false'};
            private String[] id_type_info = new String[]{'id',SOAP_M_URI,null,'1','1','false'};
                private String[] message_type_info = new String[]{'message',SOAP_M_URI,null,'0','1','false'};
                    private String[] state_type_info = new String[]{'state',SOAP_M_URI,null,'1','1','false'};
                        private String[] statusCode_type_info = new String[]{'statusCode',SOAP_M_URI,null,'0','1','false'};
                            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                                private String[] field_order_type_info = new String[]{'done','id','message','state','statusCode'};
                                    }
    public class ProfileObjectPermissions {
        public Boolean allowCreate;
        public Boolean allowDelete;
        public Boolean allowEdit;
        public Boolean allowRead;
        public Boolean modifyAllRecords;
        public String object_x;
        public Boolean viewAllRecords;
        private String[] allowCreate_type_info = new String[]{'allowCreate',SOAP_M_URI,null,'0','1','false'};
            private String[] allowDelete_type_info = new String[]{'allowDelete',SOAP_M_URI,null,'0','1','false'};
                private String[] allowEdit_type_info = new String[]{'allowEdit',SOAP_M_URI,null,'0','1','false'};
                    private String[] allowRead_type_info = new String[]{'allowRead',SOAP_M_URI,null,'0','1','false'};
                        private String[] modifyAllRecords_type_info = new String[]{'modifyAllRecords',SOAP_M_URI,null,'0','1','false'};
                            private String[] object_x_type_info = new String[]{'object',SOAP_M_URI,null,'1','1','false'};
                                private String[] viewAllRecords_type_info = new String[]{'viewAllRecords',SOAP_M_URI,null,'0','1','false'};
                                    private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                                        private String[] field_order_type_info = new String[]{'allowCreate','allowDelete','allowEdit','allowRead','modifyAllRecords','object_x','viewAllRecords'};
                                            }
    public class PackageTypeMembers {
        public String[] members;
        public String name;
        private String[] members_type_info = new String[]{'members',SOAP_M_URI,null,'0','-1','false'};
            private String[] name_type_info = new String[]{'name',SOAP_M_URI,null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                    private String[] field_order_type_info = new String[]{'members','name'};
                        }
    public class Package_x extends Metadata {
        public String type = 'Package_x';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName',SOAP_M_URI,null,'0','1','false'};
            public String apiAccessLevel;
        public String description;
        public String namespacePrefix;
        public MetadataService.ProfileObjectPermissions[] objectPermissions;
        public String packageType;
        public String postInstallClass;
        public String setupWeblink;
        public MetadataService.PackageTypeMembers[] types;
        public String uninstallClass;
        public String version;
        private String[] apiAccessLevel_type_info = new String[]{'apiAccessLevel',SOAP_M_URI,null,'0','1','false'};
            private String[] description_type_info = new String[]{'description',SOAP_M_URI,null,'0','1','false'};
                private String[] namespacePrefix_type_info = new String[]{'namespacePrefix',SOAP_M_URI,null,'0','1','false'};
                    private String[] objectPermissions_type_info = new String[]{'objectPermissions',SOAP_M_URI,null,'0','-1','false'};
                        private String[] packageType_type_info = new String[]{'packageType',SOAP_M_URI,null,'0','1','false'};
                            private String[] postInstallClass_type_info = new String[]{'postInstallClass',SOAP_M_URI,null,'0','1','false'};
                                private String[] setupWeblink_type_info = new String[]{'setupWeblink',SOAP_M_URI,null,'0','1','false'};
                                    private String[] types_type_info = new String[]{'types',SOAP_M_URI,null,'0','-1','false'};
                                        private String[] uninstallClass_type_info = new String[]{'uninstallClass',SOAP_M_URI,null,'0','1','false'};
                                            private String[] version_type_info = new String[]{'version',SOAP_M_URI,null,'1','1','false'};
                                                private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                                                    private String[] type_att_info = new String[]{'xsi:type'};
                                                        private String[] field_order_type_info = new String[]{'fullName', 'apiAccessLevel','description','namespacePrefix','objectPermissions','packageType','postInstallClass','setupWeblink','types','uninstallClass','version'};
                                                            }
    public class RetrieveRequest {
        public Double apiVersion;
        public String[] packageNames;
        public Boolean singlePackage;
        public String[] specificFiles;
        public MetadataService.Package_x unpackaged;
        private String[] apiVersion_type_info = new String[]{'apiVersion',SOAP_M_URI,null,'1','1','false'};
            private String[] packageNames_type_info = new String[]{'packageNames',SOAP_M_URI,null,'0','-1','false'};
                private String[] singlePackage_type_info = new String[]{'singlePackage',SOAP_M_URI,null,'1','1','false'};
                    private String[] specificFiles_type_info = new String[]{'specificFiles',SOAP_M_URI,null,'0','-1','false'};
                        private String[] unpackaged_type_info = new String[]{'unpackaged',SOAP_M_URI,null,'0','1','false'};
                            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                                private String[] field_order_type_info = new String[]{'apiVersion','packageNames','singlePackage','specificFiles','unpackaged'};
                                    }
    public class retrieve_element {
        public MetadataService.RetrieveRequest retrieveRequest;
        private String[] retrieveRequest_type_info = new String[]{'retrieveRequest',SOAP_M_URI,null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                private String[] field_order_type_info = new String[]{'retrieveRequest'};
                    }
    public class retrieveResponse_element {
        public MetadataService.AsyncResult result;
        private String[] result_type_info = new String[]{'result',SOAP_M_URI,null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                private String[] field_order_type_info = new String[]{'result'};
                    }
    public class PicklistEntry {
        public Boolean active;
        public Boolean defaultValue;
        public String label;
        public String validFor;
        public String value;
        private String[] active_type_info = new String[]{'active',SOAP_M_URI,null,'1','1','false'};
            private String[] defaultValue_type_info = new String[]{'defaultValue',SOAP_M_URI,null,'1','1','false'};
                private String[] label_type_info = new String[]{'label',SOAP_M_URI,null,'1','1','false'};
                    private String[] validFor_type_info = new String[]{'validFor',SOAP_M_URI,null,'0','1','false'};
                        private String[] value_type_info = new String[]{'value',SOAP_M_URI,null,'1','1','false'};
                            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                                private String[] field_order_type_info = new String[]{'active','defaultValue','label','validFor','value'};
                                    }
    public class ValueTypeField {
        public MetadataService.ValueTypeField[] fields;
        public String[] foreignKeyDomain;
        public Boolean isForeignKey;
        public Boolean isNameField;
        public Integer minOccurs;
        public String name;
        public MetadataService.PicklistEntry[] picklistValues;
        public String soapType;
        public Boolean valueRequired;
        private String[] fields_type_info = new String[]{'fields',SOAP_M_URI,null,'0','-1','false'};
            private String[] foreignKeyDomain_type_info = new String[]{'foreignKeyDomain',SOAP_M_URI,null,'0','-1','false'};
                private String[] isForeignKey_type_info = new String[]{'isForeignKey',SOAP_M_URI,null,'1','1','false'};
                    private String[] isNameField_type_info = new String[]{'isNameField',SOAP_M_URI,null,'1','1','false'};
                        private String[] minOccurs_type_info = new String[]{'minOccurs',SOAP_M_URI,null,'1','1','false'};
                            private String[] name_type_info = new String[]{'name',SOAP_M_URI,null,'1','1','false'};
                                private String[] picklistValues_type_info = new String[]{'picklistValues',SOAP_M_URI,null,'0','-1','false'};
                                    private String[] soapType_type_info = new String[]{'soapType',SOAP_M_URI,null,'1','1','false'};
                                        private String[] valueRequired_type_info = new String[]{'valueRequired',SOAP_M_URI,null,'1','1','false'};
                                            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                                                private String[] field_order_type_info = new String[]{'fields','foreignKeyDomain','isForeignKey','isNameField','minOccurs','name','picklistValues','soapType','valueRequired'};
                                                    }
    public class DescribeValueTypeResult {
        public Boolean apiCreatable;
        public Boolean apiDeletable;
        public Boolean apiReadable;
        public Boolean apiUpdatable;
        public MetadataService.ValueTypeField parentField;
        public MetadataService.ValueTypeField[] valueTypeFields;
        private String[] apiCreatable_type_info = new String[]{'apiCreatable',SOAP_M_URI,null,'1','1','false'};
            private String[] apiDeletable_type_info = new String[]{'apiDeletable',SOAP_M_URI,null,'1','1','false'};
                private String[] apiReadable_type_info = new String[]{'apiReadable',SOAP_M_URI,null,'1','1','false'};
                    private String[] apiUpdatable_type_info = new String[]{'apiUpdatable',SOAP_M_URI,null,'1','1','false'};
                        private String[] parentField_type_info = new String[]{'parentField',SOAP_M_URI,null,'0','1','false'};
                            private String[] valueTypeFields_type_info = new String[]{'valueTypeFields',SOAP_M_URI,null,'0','-1','false'};
                                private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                                    private String[] field_order_type_info = new String[]{'apiCreatable','apiDeletable','apiReadable','apiUpdatable','parentField','valueTypeFields'};
                                        }
    public class describeValueType_element {
        public String type_x;
        private String[] type_x_type_info = new String[]{'type',SOAP_M_URI,null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                private String[] field_order_type_info = new String[]{'type_x'};
                    }    
    public class FileProperties {
        public String createdById;
        public String createdByName;
        public DateTime createdDate;
        public String fileName;
        public String fullName;
        public String id;
        public String lastModifiedById;
        public String lastModifiedByName;
        public DateTime lastModifiedDate;
        public String manageableState;
        public String namespacePrefix;
        public String type_x;
        private String[] createdById_type_info = new String[]{'createdById',SOAP_M_URI,null,'1','1','false'};
            private String[] createdByName_type_info = new String[]{'createdByName',SOAP_M_URI,null,'1','1','false'};
                private String[] createdDate_type_info = new String[]{'createdDate',SOAP_M_URI,null,'1','1','false'};
                    private String[] fileName_type_info = new String[]{'fileName',SOAP_M_URI,null,'1','1','false'};
                        private String[] fullName_type_info = new String[]{'fullName',SOAP_M_URI,null,'1','1','false'};
                            private String[] id_type_info = new String[]{'id',SOAP_M_URI,null,'1','1','false'};
                                private String[] lastModifiedById_type_info = new String[]{'lastModifiedById',SOAP_M_URI,null,'1','1','false'};
                                    private String[] lastModifiedByName_type_info = new String[]{'lastModifiedByName',SOAP_M_URI,null,'1','1','false'};
                                        private String[] lastModifiedDate_type_info = new String[]{'lastModifiedDate',SOAP_M_URI,null,'1','1','false'};
                                            private String[] manageableState_type_info = new String[]{'manageableState',SOAP_M_URI,null,'0','1','false'};
                                                private String[] namespacePrefix_type_info = new String[]{'namespacePrefix',SOAP_M_URI,null,'0','1','false'};
                                                    private String[] type_x_type_info = new String[]{'type',SOAP_M_URI,null,'1','1','false'};
                                                        private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                                                            private String[] field_order_type_info = new String[]{'createdById','createdByName','createdDate','fileName','fullName','id','lastModifiedById','lastModifiedByName','lastModifiedDate','manageableState','namespacePrefix','type_x'};
                                                                }
    public class describeValueTypeResponse_element {
        public MetadataService.DescribeValueTypeResult result;
        private String[] result_type_info = new String[]{'result',SOAP_M_URI,null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                private String[] field_order_type_info = new String[]{'result'};
                    }
    public class RetrieveMessage {
        public String fileName;
        public String problem;
        private String[] fileName_type_info = new String[]{'fileName',SOAP_M_URI,null,'1','1','false'};
            private String[] problem_type_info = new String[]{'problem',SOAP_M_URI,null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                    private String[] field_order_type_info = new String[]{'fileName','problem'};
                        }
    public class listMetadataResponse_element {
        public MetadataService.FileProperties[] result;
        private String[] result_type_info = new String[]{'result',SOAP_M_URI,null,'0','-1','false'};
            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                private String[] field_order_type_info = new String[]{'result'};
                    }
    public class listMetadata_element {
        public MetadataService.ListMetadataQuery[] queries;
        public Double asOfVersion;
        private String[] queries_type_info = new String[]{'queries',SOAP_M_URI,null,'0','-1','false'};
            private String[] asOfVersion_type_info = new String[]{'asOfVersion',SOAP_M_URI,null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                    private String[] field_order_type_info = new String[]{'queries','asOfVersion'};
                        }
    public class ListMetadataQuery {
        public String folder;
        public String type_x;
        private String[] folder_type_info = new String[]{'folder',SOAP_M_URI,null,'0','1','false'};
            private String[] type_x_type_info = new String[]{'type',SOAP_M_URI,null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                    private String[] field_order_type_info = new String[]{'folder','type_x'};
                        }
    public virtual class MetadataWithContent extends Metadata {
        public String content;
    }
    public class MetadataPort {
        public String endpoint_x = URL.getSalesforceBaseUrl().toExternalForm() + '/services/Soap/m/49.0';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public MetadataService.SessionHeader_element SessionHeader;
        public MetadataService.DebuggingInfo_element DebuggingInfo;
        public MetadataService.DebuggingHeader_element DebuggingHeader;
        public MetadataService.CallOptions_element CallOptions;
        public MetadataService.AllOrNoneHeader_element AllOrNoneHeader;
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/2006/04/metadata';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/2006/04/metadata';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/2006/04/metadata';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/2006/04/metadata';
        private String AllOrNoneHeader_hns = 'AllOrNoneHeader=http://soap.sforce.com/2006/04/metadata';
        private String[] ns_map_type_info = new String[]{SOAP_M_URI, 'MetadataService'};
            
            public MetadataService.DescribeMetadataResult describeMetadata(Double asOfVersion) {
                MetadataService.describeMetadata_element request_x = new MetadataService.describeMetadata_element();
                request_x.asOfVersion = asOfVersion;
                MetadataService.describeMetadataResponse_element response_x;
                Map<String, MetadataService.describeMetadataResponse_element> response_map_x = new Map<String, MetadataService.describeMetadataResponse_element>();
                response_map_x.put('response_x', response_x);
                WebServiceCallout.invoke(
                    this,
                    request_x,
                    response_map_x,
                    new String[]{endpoint_x,
                        '',
                        SOAP_M_URI,
                        'describeMetadata',
                        SOAP_M_URI,
                        'describeMetadataResponse',
                        'MetadataService.describeMetadataResponse_element'}
                );
                response_x = response_map_x.get('response_x');
                return response_x.result;
            }
        
        public MetadataService.RetrieveResult checkRetrieveStatus(String asyncProcessId,Boolean includeZip) {
            MetadataService.checkRetrieveStatus_element request_x = new MetadataService.checkRetrieveStatus_element();
            request_x.asyncProcessId = asyncProcessId;
            request_x.includeZip = includeZip;
            MetadataService.checkRetrieveStatusResponse_element response_x;
            Map<String, MetadataService.checkRetrieveStatusResponse_element> response_map_x = new Map<String, MetadataService.checkRetrieveStatusResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                    '',
                    SOAP_M_URI,
                    'checkRetrieveStatus',
                    SOAP_M_URI,
                    'checkRetrieveStatusResponse',
                    'MetadataService.checkRetrieveStatusResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.AsyncResult retrieve(MetadataService.RetrieveRequest retrieveRequest) {
            MetadataService.retrieve_element request_x = new MetadataService.retrieve_element();
            request_x.retrieveRequest = retrieveRequest;
            MetadataService.retrieveResponse_element response_x;
            Map<String, MetadataService.retrieveResponse_element> response_map_x = new Map<String, MetadataService.retrieveResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                    '',
                    SOAP_M_URI,
                    'retrieve',
                    SOAP_M_URI,
                    'retrieveResponse',
                    'MetadataService.retrieveResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.DescribeValueTypeResult describeValueType(String type_x) {
            MetadataService.describeValueType_element request_x = new MetadataService.describeValueType_element();
            request_x.type_x = type_x;
            MetadataService.describeValueTypeResponse_element response_x;
            Map<String, MetadataService.describeValueTypeResponse_element> response_map_x = new Map<String, MetadataService.describeValueTypeResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                    '',
                    SOAP_M_URI,
                    'describeValueType',
                    SOAP_M_URI,
                    'describeValueTypeResponse',
                    'MetadataService.describeValueTypeResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.FileProperties[] listMetadata(MetadataService.ListMetadataQuery[] queries,Double asOfVersion) {
            MetadataService.listMetadata_element request_x = new MetadataService.listMetadata_element();
            request_x.queries = queries;
            request_x.asOfVersion = asOfVersion;
            MetadataService.listMetadataResponse_element response_x;
            Map<String, MetadataService.listMetadataResponse_element> response_map_x = new Map<String, MetadataService.listMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                    '',
                    SOAP_M_URI,
                    'listMetadata',
                    SOAP_M_URI,
                    'listMetadataResponse',
                    'MetadataService.listMetadataResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
    }
}