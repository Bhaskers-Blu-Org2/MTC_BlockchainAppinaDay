# MTC Blockchain App in a Day, Prework
The Blockchain App in a Day is a hands-on workshop where a Microsoft team leads a customer(s) through the development of a blockchain solution to demonstrate the value of a distributed ledger solution.  The customer will deploy Azure Blockchain Workbench, configure a development machine, and will develop a solution using Azure Blockchain Workbench.  This workshop does not extend the blockchain solution for off-chain integrations or more complex scenarios like IoT integration; rather, it’s meant as a primer in using Azure Blockchain Workbench to develop and deploy an initial solution.  
  
## Prework Readiness Checklist

<ul>
  <li> Attendee must have her or his own Azure subscription with the rights to deploy Azure  
  Blockchain Workbench.  <b>Using a MSDN account for Azure access is OK; however, the account monthly limits would soon be hit therefore causing charges to your MSDN account</b>
  </li>
  <li> Recommend each developer has a GitHub ID
  </li>
  <li> Attendee must have rights to install and configure software on their Windows machine
  </li>
</ul>
 
 ## Configure Development Machine
1. Install [Visual Studio Code](https://code.visualstudio.com/Download)

2. Install the [Visual Studio Code Solidity Extension](https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity)

3. Install [Node.JS](https://nodejs.org/en/)
4. Install [Python 2.7](https://www.python.org/downloads/release/python-2713/)
    <ul>
        <li>
            Versioning matters, install the recommended version
        </li>
    </ul>
 

5.	Install Global Windows Build Tools. Ganache CLI and Truffle
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
6.	Install [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) (optional)
    <ul>
        <li>
            Optional install to add a Windows SSH client
        </li>
        <li>
            Chose appropriate 32- or 64-bit MSI
        </li>
        <li>
            Select the default options
        </li>
    </ul>

7.	Install [PuTTYGen](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) (optional) – tool for creating certificates

8.	Install [Git Bash](https://gitforwindows.org/) (optional)

9.	Install [GitHub Desktop](https://desktop.github.com/) (optional)

10.	Clone the [Azure Blockchain Workbench GitHub repo](https://github.com/Azure-Samples/blockchain.git) (optional)

11.	Configure Visual Studio Code
    <ul>
        <li>
            It is recommended you change the VS Code terminal shell to default to a Bash shell.  In this example, we use GitBash
        </li>
        <li>
            <b>Option A</b> - Inside VS Code, go intoile->Preferences->Settings->Features.>Terminal->External: Windows Exec, change to the following (update the file path as needed on your PC). "C:\Program Files\Git\bin\bash.exe"
        </li>
        <li>
            <b>Option B</b> - Enter either Ctrl-Shift-P or F1 and enter “Terminal: Select Default Shell”.  Select GitBash as your default shell
        </li>
    </ul>

    
 ## Create an Active Directory Namespace
 For most customers, there are purposeful controls on how identities can be created in their Azure Active Directory namespace.  For example, the company Contoso has the Azure AD namespace of contoso.onmicrosoft.com, but it's not possible for someone to  create a new set of test identities in their corporate tenant.  In order to complete the Azure Blockchain Workbench deployment, it is recommended you create a new Active Active Diretory instance under your existing subscription.  It's in this new, test namespace where you'll create the Azure Blockchain Workbench users needed to access deployed applications.  For example, the new Azure AD tenant myabw.onmicrosoft.com is created to support the deployment of Azure Blockchain Workbench.

 Creating this new namespace ahead of time will expedite your of Azure Blockchain Workbench during the workshop.

 ## Deploy Azure Blockchain Workbench
The Blockchain App in a Day workshop will use Azure Blockchain Workbench, and each attendee (or attendees from the same company) must have an Azure subscription with the rights to deploy this template.

<b>Deployment will be completed during the Blockchain App in a Day workshop as an instructor-led activity.</b>  Please ensure prior to the workshop you have the rights to deploy Azure Blockchain Workbench.

# Contributing
This project welcomes contributions and suggestions. Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact opencode@microsoft.com with any additional questions or comments.
