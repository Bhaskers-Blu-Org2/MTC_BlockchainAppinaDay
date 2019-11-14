# Prework Requirements

<ul>
  <li> Attendee must have her or his own Azure subscription with the rights to deploy Azure  
  Blockchain Workbench.  <b>Using a MSDN account for Azure access is OK; however, the account monthly limits would soon be hit therefore causing charges to your MSDN account</b>
  </li>
  <li> Recommend each attendee has a GitHub ID
  </li>
  <li> Attendee must have rights to install and configure software on their local machine
  </li>
</ul>
 
 ## Configure Development Machine
1. Install [Visual Studio Code](https://code.visualstudio.com/Download).  Visual Studio Code will be used for the MVP solution development.  Visual Studio Code 1.32 or higher is required - you can check your installed version in Visual Studio Code by selecting the `Help` menu and then selecting `About`.

2. Install the [Visual Studio Code Solidity Extension](https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity).  This extension from Juan Blanco adds the Solidity language to Visual Studio Code.

3. Install the [Visual Studio Code Python Extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python).  This extension from Microsoft adds the Python language to Visual Studio Code.  Install the current version as it supports Python back to 2.7.

4. Install [Node.JS](https://nodejs.org/en/).  As of Nov 2019, we require Node 10.15.x or higher; it's recommended to install the LTS version.  You can check your node version by running "node -v" on a command line.
    <ul>
        <li>
            When you install Node.JS, it will install NPM which is required to install additional tools
        </li>
    </ul>

5.	Install [Python 2.7](https://www.python.org/downloads/release/python-2715/).  The Azure Blockchain Development Kit for Ethereum is tested with Python 2.17.15.  You can check your Python version by running "python --version" on a command line.
    <ul>
        <li>
            It's important to install Python 2.17.15 even if it's a secondary install of Python on a machine that already has a later version.  On Windows, you can use the MSI installer for x86-64 as appropriate.  When installing, select to add Python to the PATH on the `Customize Python` option in the installer.  You can select the Python interpreter using the Visual Studio Code command palette (Ctrl-Shift-P then search for "python: select interpreter")
        </li>
    </ul>

6.	Install Global Windows Build Tools, Ganache CLI, and Truffle
    <ul>
        <li> 
            npm install --global windows-build-tools
        </li>
        <li>
            npm install -g ganache-cli
        </li>
        <li>
            npm install -g truffle
        </li>    
    </ul>

7.	OPTIONAL - Install [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
    <ul>
        <li>
            Select the optional install to add a Windows SSH client
        </li>
        <li>
            Chose appropriate 32- or 64-bit MSI
        </li>
        <li>
            Select the default options
        </li>
    </ul>

8.  OPTIONAL - Install [PuTTYGen](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) (optional) – tool for creating certificates
    <ul>
        <li>
            Certificates can be generated with many different tools, so the use of PuTTYGen is optional
        </li>
    </ul>

9.	OPTIONAL - Install [Git Bash](https://gitforwindows.org/) (optional)
    <ul>
        <li>
            There are many BASH shells so the use of Git BASH is optional; however, you will need a BASH shell
        </li>
    </ul>

10.	OPTIONAL - Install [GitHub Desktop](https://desktop.github.com/) (optional, but recommended)
    <ul>
        <li>
            If you're not familiar with Git CLI, Git Desktop provides an easier GUI for managing the repo
        </li>
    </ul>

11.	OPTIONAL - Clone the [Azure Blockchain Workbench Samples GitHub repo](https://github.com/Azure-Samples/blockchain.git) (optional)
    <ul>
        <li>
            This public repo contains many Azure Blockchain Workbench code samples, and is a useful reference for extending blockchain solutions 
        </li>
    </ul>

12.	Configure Visual Studio Code
    <ul>
        <li>
            It is recommended you change the Visual Studio Code terminal shell to default to BASH.  In Visual Studio Code, enter Shift+Ctrl+P to bring up the command palette.  Enter "terminal: Select Default Shell", select this command, and then select the installed BASH shell as the default
        </li>
    </ul>

13. Install [Ganache](https://www.trufflesuite.com/ganache)
    <ul>
        <li>
            Ganache provides a personal blockchain for ethereum development 
        </li>
    </ul>
    
 ## Create a GitHub Repo or an Azure DevOps Project
 If you are working in a team, it is recommended you have minimally a shared code repo in something like GitHub.  GitHub is limited to 3 collaborative users unless the repo owner has the Professional version.   If this repo is going to be managed using Agile/SCRUM/etc., it's recommended to create an Azure DevOps Organization and Project for managing the DevOps cycle beyond just the repo.

 Launch [Azure DevOps](https://dev.azure.com) and login in.  If one doesn't already exist, create an organization by selecting `New organization` from the left-pane menu.  Provide a meaningful name and choose its location.

 You'll need to create a project.  Provide a meaningful `Project name`, select project type `Enterprise`, and then select `Advanced`. In the `Advanced` options, leave `Version control` as 'Git' and then select `Work item process` as 'Agile'.

 In your DevOps organization, you may need to allow external users to be invited.  If this isn't in your control to allow this, work with Microsoft to create a temporary DevOps organization and your users will be added to it.  Later you can move the assets into your own, internal DevOps organization/project.

 From your newly created project (you can use the breadcrumb trail on the top to select it), select `Project settings` from the bottom of the page.  Select `Teams`, select your named team, and then add the appropriate users to the team.

 Inside the DevOps project, select `Repos` from the left-pane menu, and then select `Clone` in the upper-right side, and select to clone it into Visual Studio Code.  When you add this repo to GitHub desktop, you will be challenged for your user and password.  From the `Clone` dialogue in Azure DevOps, select `Generate Git credentials` and copy/save that password.  You will need this password to authenticate GitHub desktop to access the DevOps repo - you do not use your GitHub login password.

 ## Deploying Azure Blockchain Workbench
 For most customers, there are controls on who can create new users in their corporate Azure Active Directory.  For example, the company Contoso has the Azure AD namespace of contoso.onmicrosoft.com, but it's not possible for someone to create a new set of test users in that corporate tenant.  
 
 You will need to create a new Azure Active Directory instance.  In this new Azure AD namespace you'll create the Azure Blockchain Workbench users needed to access deployed blockchain applications.  For example, the new Azure AD namespace myabw.onmicrosoft.com is created to support the deployment of Azure Blockchain Workbench.

 It is also required to create an App Registration in your new Azure AD namespace. You'll need to verify you have the rights to deploy an App Registration and can configure its settings as well as make configuration changes to the new Azure AD namespace.

 The deployment process can be done manually or with some automation.  Please review the [Deploy Azure Blockchain Workbench](https://docs.microsoft.com/en-us/azure/blockchain/workbench/deploy#azure-ad-configuration) instructions to ensure you'll be able to successfully deploy Azure Blockchain Workbench.  It is recommended to deploy this prior to the workshop so the workshop time can be focused on blockchain applications.

# Contributing
This project welcomes contributions and suggestions. Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact opencode@microsoft.com with any additional questions or comments.
