<h1>sfdx-dev-projects</h1>>

This project is a collection of my Salesforce (small) coding projects. This collection comprises of multiple coded solutions that were created at different points and for different use cases. The metadata components may not fit together in the same org.

<h3>How To Use This Repo</h3>

Don't deploy this project in its entirety. This repo contains multiple individual coding projects. I've created a sample empty package.xml file you use to deploy the identified related metadata components to your Trailhead Playground. <strong> Do not deploy any file to any Salesforce production org.</strong>  

To refresh on working with package.xml using Salesforce CLI, review the Trailhead badge <a href="https://trailhead.salesforce.com/content/learn/modules/package-xml" target="_blank">Package.xml Metadata Management</a>. In that badge, you learn how to write xml and use package.xml to selectively deploy and retrieve metadata components in your Salesforce org.

## Contents

- [Contents](#contents)
- [Tools](#tools)
- [Instructions](#instructions)
  - [Deploy to your playground](#deploy-to-your-playground)
- [Assets](#assets)
- [Resources](#resources)
  
---

## Tools

The following tools were used to create this project.
|  Tool:       |  Version:  |
| ------------ | ---------- |
| **SFDX-CLI** | [![npm](https://img.shields.io/npm/v/sfdx-cli.svg?label=Salesforce%20CLI&&color=lightblue&logo=Salesforce&style=for-the-badge)](https://developer.salesforce.com/tools/sfdxcli)  |
| **VS Code**  | ![alt-text](https://img.shields.io/badge/VS_CODE-1.51.1-BrightGreen?style=Popout&logo=Visual-Studio-Code) |

---

## Instructions

Be sure to have Visual Studio Code (VS Code), Salesforce Extensions, and Salesforce CLI (sfdx-cli) installed before working with this project. This project uses the Salesforce Dev Hub feature and the command-line interface.

To refresh on Salesforce DX, review the Trailhead project <a href="https://trailhead.salesforce.com/content/learn/projects/quick-start-salesforce-dx" target="_blank">Quick Start: Salesforce DX</a>

To refresh on navigating the command-ine interface, review the Trailhead module <a href="https://trailhead.salesforce.com/en/content/learn/modules/cli-basics" target="_blank">Command Line Interface</a>

1. Install VS Code here: https://code.visualstudio.com/download
2. Install Salesforce Extensions here: https://marketplace.visualstudio.com/items?itemName=salesforce.salesforcedx-vscode
3. Install Salesforce CLI here: https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm
4. Enable Dev Hub: https://trailhead.salesforce.com/content/learn/projects/quick-start-salesforce-dx

---

### Deploy to your playground

1. On your local machine, modify the sample package.xml file to include the related assets metadata (remember, to use the components API name).
2. Save the package.xml under the apex-sample folder.
3. In VS Code, open a new terminal window.  
4. Navigate to the apex-sample project directory in the command line:
<code>cd apex-sample</code>
5. Deploy the metadata components to your Trailhead playground using the package.xml file.
<code>sfdx force:source:deploy -x ./package.xml -u DevHub -w10</code>
6. Visually confirm the metadata components are in your Trailhead Playground.

---

## Assets

* AccountUpdate </br>
--Description: Post a chatter message on a specific group with account information when specific criteria on Account is met.
--Purpose: This trigger is really unnecessary. I needed a simple trigger that shows how to properly format code. This could be better handled in a flow. As useless as this trigger is, it was a bit of fun to create.
AccountUpdate.trigger

* Create Chatter Post on Hot Account Updates </br>
--Description:  
--Purpose:
CreateChatterPostAstroAccount.cls
HotAccountUpdate.trigger
HotAccountsClass.cls
HotAccountUpdateTest.cls (unit test for HotAccountUpdate.trigger and HotAccountsClass.cls)

* Prevent User Leaving Mandatory Group </br>
--Description:  
--Purpose:
PreventUserLeavingMandatoryGrp.trigger

* Remove Attachments GDPR</br>
--Description:  
--Purpose:
CasesController.cls
CaseGDPRUpdate.page
RemoveAttachmentsGDPRTest.cls (unit test for trigger)
RemoveAttachmentsGDPR.trigger

* Create Account Sample</br>
--Description:
--Purpose:
CreateAccount.cls
CreateAccountTest.cls

---

## Resources

For details on using sfdx, please review the [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev).
