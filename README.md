# Salesforce-Package.xml-Creator

This Source contains a Tool to Simplify Salesforce Package.xml Creation if you associate yourself with deployment often and always making packages Either Manual or some External Help. This Tool Might Help you in Some Sort of way for faster and Clean Package Generation Experience.
Do Checkout this Article for Its Features:
# https://medium.com/@shashanksingla/package-xml-creator-in-lwc-bfddad49519e

Components Include:-
# ----------------------------------------------- #
 # ApexClass :-
        MetadataFetcherAdvanced
        MetadataRetrieveController
        MetadataService
        metadataSchemaWrapper
# CustomTab :-
    Metadata_Fetcher
# FlexiPage: -
	  Metadata_Fetcher
# LightningComponentBundle :-
        confirmationModal
        metadataSelectorAdvanced
        xmlPreviewer
# LightningMessageChannel:-
        xmlviewer
# ApexPage:-
        SessionIdViewer
# StaticResource :-
        MetadataCheckbox
# ---------------------------------------------- #

## To use the component in your org, Download the project and Create a zip file of unpackged folder for direct deploy using Workbench/ANT and if you want to deploy it using VS Code please convert it first using these step
# 1.Unzip the Package Salesforce-Package.xml-Creator-main
# 2.Copy the internal folder Salesforce-Package.xml-Creator-main from unzipped folder(Package Salesforce-Package.xml-Creator-main) to the Root Folder(which will contain mainfest folder) of your SFDX Project.
# 3.now run this command in your root folder (sfdx force:mdapi:convert -r Salesforce-Package.xml-Creator-main)  (Please make sure there is no existing force-app folder otherwise it will not work,if its a new SFDX project then command will not fail if its existing project first rename existing(force-app) folder then run command, it will create a new force-app folder then move its contents to renamed folder and delete new force-app folder followed by renaming of old folder to force-app.)
 now the changes are there in you local copy of project.you can deploy it now in VS Code.
# Post-deployment Assign the Metadata_Fetcher( Custom Tab) Profile Visibility From Profile Settings and activate the Metadata_Fetcher( App Page ) from Lightning App Builder for Your Profile and your Preferred App. ##
