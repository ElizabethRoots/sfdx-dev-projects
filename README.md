<h1 align="center">sfdx-dev-projects</h1>
This project is a collection of my Salesforce (small) coding projects. This collection comprises of multiple coded solutions that were created at different points and for different use cases. The metadata components may not fit together in the same org.

#### How To Use This Repo

This repo contains multiple individual coding projects. I've created a sample empty package.xml file you use to deploy the identified related metadata components to your Trailhead Playground or non-business related Salesforce Developer edition org. <strong> Do not deploy any file to any Salesforce production org.</strong> Please only use Trailhead Playgrounds or non-business related Salesforce Developer edition orgs.

To learn how to work with package.xml and Salesforce CLI, review the Trailhead badge <a href="https://trailhead.salesforce.com/content/learn/modules/package-xml" target="_blank">Package.xml Metadata Management</a>. In that badge, you learn how to code xml and use package.xml to selectively deploy and retrieve metadata components in your Salesforce org.

===========================

### Contents

- [Tools](#tools)
- [Instructions](#instructions)
  - [Assets](#assets)
    - [Triggers](#triggers)
    - [Apex Classes](#apex-classes)
    - [Apps and Solutions](#apps-and-solutions)
- [Resources](#resources)
  
===========================

### Tools

I used the following tools to create assets throughout this project.
|  Tool:       |  Version:  |
| ------------ | ---------- |
| **SFDX-CLI** | [![npm](https://img.shields.io/npm/v/sfdx-cli.svg?label=Salesforce%20CLI&&color=lightblue&logo=Salesforce&style=for-the-badge)](https://developer.salesforce.com/tools/sfdxcli)  |
| **VS Code**  | ![alt-text](https://img.shields.io/badge/VS_CODE-1.51.1-BrightGreen?style=Popout&logo=Visual-Studio-Code) |

===========================
### Instructions
Be sure to have Visual Studio Code (VS Code), Salesforce Extensions, and Salesforce CLI (sfdx-cli) installed before working with this project. This project uses the command-line interface.

To refresh on Salesforce DX, review the Trailhead project <a href="https://trailhead.salesforce.com/content/learn/projects/quick-start-salesforce-dx" target="_blank">Quick Start: Salesforce DX</a>

To refresh on navigating the command-ine interface, review the Trailhead module <a href="https://trailhead.salesforce.com/en/content/learn/modules/cli-basics" target="_blank">Command Line Interface</a>

1. Install VS Code here: https://code.visualstudio.com/download
2. Install Salesforce Extensions here: https://marketplace.visualstudio.com/items?itemName=salesforce.salesforcedx-vscode
3. Install Salesforce CLI here: https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm
4. Enable Dev hub: https://trailhead.salesforce.com/content/learn/projects/quick-start-salesforce-dx

#### Deploy to your playground
1. On your local machine, modify the sample package.xml file to include the related assets metadata (remember, to use the components API name).
2. Save the package.xml under the apex-sample folder. 
3. In VS Code, open a new terminal window.  
4. Navigate to the apex-sample project directory in the command line:
<code>cd apex-sample</code>
5. Deploy the metadata components to your Trailhead playground using the package.xml file.
<code></code>
6. Visually confirm the metadata components are in your Trailhead Playground.

===========================
### Assets

#### Triggers

* AccountUpdate </br>
--Description: Post a chatter message on a specific group with account information when specific criteria on Account is met.
--Purpose: This trigger is really unnecessary. I needed a simple trigger that shows how to properly format code. This could be better handled in a flow. As useless as this trigger is, it was a bit of fun to create.

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

## Resources

For details on using sfdx, please review the [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev).