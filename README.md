<h1 align="center">sfdx-dev-projects</h1>
This project is a collection of my Salesforce (small) coding projects. This collection comprises of multiple coded solutions that were created at different points and for different use cases. The metadata components may not fit together in the same org.

#### How To Use This Repo

This repo contains multiple individual coding projects. I've created a package.xml file that identifies all related metadata components for each identified asset. You use the package.xml file to deploy the asset to your scratch org. <strong> Do not deploy any file to any Salesforce production org.</strong>

===========================

### Contents

- [Contents:](#contents)
- [Tools](#tools)
- [Assets](#assets)
  - [Triggers](#triggers)
  - [Apex Classes](#apex-classes)
  - [Apps and Solutions](#apps-and-solutions)
- [Instructions](#instructions)
- [Resources](#resources)
  
===========================

### Tools

I used the following tools to create assets throughout this project.
|  Tool:       |  Version:  |
| ------------ | ---------- |
| **SFDX-CLI** | [![npm](https://img.shields.io/npm/v/sfdx-cli.svg?label=SFDX-CLI&logo=Salesforce&style=Popout)](https://developer.salesforce.com/tools/sfdxcli)  |
| **VS Code**  | ![alt-text](https://img.shields.io/badge/VS_CODE-1.51.1-BrightGreen?style=Popout&logo=Visual-Studio-Code) | 

===========================

### Assets

#### Triggers

* AccountUpdate </br>
Description: Post chatter message on a specific group with account information when specific criteria on Account is met.
Purpose: This trigger is really unnecessary. This could be better handled in a flow IMO. I needed a simple trigger because I have written content on how to properly structure code. Such as bulkify the soql pull, don't have DML statements in a FOR loop... etc. As useless as this trigger is, it was a bit of fun to create.

#### Apex Classes

* Cases Controller </br>
[Work in progress]

* Create Account </br>
[Work in progress]

* Create Chatter Post Astro Account </br>
[Work in progress]

* Hot Account </br>
[Work in progress]

* Remove Attachments GDPR </br>
[Work in progress]

* Tests </br>
[Work in progress]

#### Apps and Solutions

[Work in progress]

===========================

## Instructions
Be sure to have Visual Studio Code (VS Code) and Salesforce CLI (sfdx-cli) installed before working with this project.


===========================
## Resources

For details on using sfdx, please review the [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev).