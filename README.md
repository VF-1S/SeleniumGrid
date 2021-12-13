# Introduction 
The main purpose of this project is to set up Selenium Grid locally on your Windows or Linux machines with or without using Docker.

If Docker is preferable then [Selenoid](https://aerokube.com/selenoid/) solution will be configured and used, otherwise Selenium Server Standalone [Selenium Server Standalone](https://www.selenium.dev/downloads/) can be configured and used.

For more information about Selenium Grid please visit their [official documentation page](https://www.selenium.dev/documentation/grid/).

**Please note that everything here is already pre-configured in form of scripts and ready to use in most optimized way, but if you want to make additional configuration you can do by following instructions and please keep it locally.**    

# Getting Started

1.	Selenium Server Standalone - configuration and usage
2.	Selenoid - configuration and usage


# ** Selenium Server Standalone
For those who want to use Selenium Grid immediately with any kind of preparation and installation then _Selenium Server Standalone_ is a good option.

**1. Before you run Selenium Server Standalone**
* Since it is a .jar it is required to have installed and configured Java Runtime Environment (JRE) on your OS.
* **Port 4444 must be available for _localhost_ !!** For example: Selenium Server Standalone can not run in parallel with Selenoid because both of them are using port 4444. The expected exception in this case should look like:


```sh
Exception in thread "main" java.lang.RuntimeException: java.net.BindException: Address already in use: bind
            at org.openqa.selenium.grid.server.BaseServer.start(BaseServer.java:221)
            at org.openqa.selenium.remote.server.SeleniumServer.boot(SeleniumServer.java:131)
            at org.openqa.grid.internal.utils.SelfRegisteringRemote.startRemoteServer(SelfRegisteringRemote.java:119)
            ...
```

**2. Run Selenium Server Standalone on Windows**

On the root of this project find and run "localhost.bat" where you will have at the bottom of new opened cmd window this:

`2021-09-20 13:28:02.043:INFO::main: Logging initialized @920ms to org.seleniumhq.jetty9.util.log.StdErrLog`

`2021-09-20 13:28:02.712:INFO::main: Logging initialized @1605ms to org.seleniumhq.jetty9.util.log.StdErrLog`

Another conformation that Selenium server is operational you can get by visiting http://localhost:4444/grid/console which looks like this:

![Alt text](https://github.com/VF-1S/SeleniumGrid/blob/main/images/ReadmeImages/ConsoleGrid_preview.png "Grid Console")

**3. Run Selenium Server Standalone on Linux**

To run Selenium Server Standalone on Linux OS you have to clone this project and execute the following command on the project's root:

`java -Dselenium.LOGGER.level=OFF -jar ./selenium-server-standalone/selenium-server-standalone-3.141.59.jar -role hub -hubConfig ./hub/hubConfig.json`

Use the same confirmation as for Windows to see if server is running.

**4. Selenium Server Standalone custom Configuration**
- **Change Browser Version (for example MicrosoftEdge)**

    I. Download appropriate version of _msedgedriver.exe_ and put it in `./MicrosoftWebDriver/driver_version/`
    
    II. Open file `./scripts/SetGlobalVariables.bat` and for variable "EDGE" set a new path to downloaded _msedgedriver.exe_ file. It should look like:
    
        `SET EDGE=.\MicrosoftWebDriver\93.0.961.52\msedgedriver.exe` 
    
    III. Open file `./browsers/1.0/localhost_GC_MF_IE.json` and change the value of attribute "version" for appropriate browser:
    
        `{
          "browserName": "MicrosoftEdge",
          "version": "new_version",
          "maxInstances": 2,
          "seleniumProtocol": "WebDriver"
        }`
- **How to run another Node**

    By default only one node will be created on platform: WIN10 with available browsers: Chrome (5 instances), FireFox (5 instances), MicrosoftEdge (5 instances) and Internet Explorer (1 instance). 

    If there is an need to create another NODE the easiest way to do that is via command line executed in additional (cmd or PowerShell) window, otherwise the structure of this project can be ruined.

    Here is one example:

    `java -Dselenium.LOGGER.level=OFF -jar -Dwebdriver.chrome.driver=.\chromedriver\93.0.4577.63\chromedriver.exe -Dwebdriver.gecko.driver=.\geckodriver\0.30.0\geckodriver.exe .\selenium-server-standalone\selenium-server-standalone-3.141.59.jar -role node -port 5557 -browser "browserName=chrome,version=93,maxInstances=4,platform=WIN10" -browser "browserName=firefox,version=92,maxInstances=3,platform=VISTA"`

    where: 

    1. `-Dwebdriver.chrome.driver=.\chromedriver\93.0.4577.63\chromedriver.exe` - is set path to ChromeDriver
    2. `-Dwebdriver.gecko.driver=.\geckodriver\0.30.0\geckodriver.exe` - is set path to GeckoDriver
    3. `.\selenium-server-standalone\selenium-server-standalone-3.141.59.jar ` - is set path to Selenium Server Standalone
    4. `-role node -port 5557` - is setting new entity with role node on port 5557 (note: different port must be used in compare to port of first node: 5556)
    5. `-browser "browserName=chrome,version=93,maxInstances=4,platform=WIN10"` - is setting browser with name `chrome` and version `93` with `maxInstances=4` running on platform WIN10
    6. `-browser "browserName=firefox,version=92,maxInstances=3,platform=VISTA"` - is setting browser with name `firefox` and version `92` with `maxInstances=3` running on platform VISTA

     __
    
    When this command is executed the grid console should look like this:

    ![Alt text](https://github.com/VF-1S/SeleniumGrid/blob/main/images/ReadmeImages/second_node.gif "Grid Console with 2 Nodes")
        
- **Change _browserTimeout_ and _Timeout_**

    Both parameters can be changed in file `./hub/hubConfig.json` where they are set by default to 120 seconds.

- **Configure initial existing node**

    This can be done with editing values of various attributes in `./browsers/1.0/localhost_GC_MF_IE.json` where Browsers or their version can be included or excluded, `maxInstances` can be increased or decreased and different platform per browser can be set (according to [DesiredCapabilities](https://github.com/SeleniumHQ/selenium/wiki/DesiredCapabilities)).

# ** Selenoid with Docker
For those who want to use containerized Selenium Grid combined with Docker and docker compose then Selenoid from Aerokube is solution.

**Please Note: Detailed instructions how to use Selenoid you can find in [Selenoid Docs](https://aerokube.com/selenoid/latest/).**

**1. Before you run Selenoid**

It is required Docker for Desktop to be installed for Windows ( [check here](https://www.docker.com/products/docker-desktop) ) or Docker Engine on Ubuntu by following [instructions here](https://docs.docker.com/engine/install/ubuntu/).
 
Also it is required to have Docker Compose configured: 

- For Windows users Docker Desktop includes Compose along with other Docker apps, so most Windows users do not need to install Compose separately.
- For Linux users please follow [instruction here](https://docs.docker.com/compose/install/).

**Please note that ports 4444 and 8080 must be available for _localhost_ !!**

**2. Run Selenoid by using Docker on Windows**

Locate and execute file: `.\docker\scripts\windows\startLocalSelenoid.bat` and after several minutes you should see in cmd window:

![Alt text](https://github.com/VF-1S/SeleniumGrid/blob/main/images/ReadmeImages/Selenoid_done.png "Selenoid configured")

You can confirm that everything is OK by visiting http://localhost:8080/#/ where you should see:

![Alt text](https://github.com/VF-1S/SeleniumGrid/blob/main/images/ReadmeImages/Selenoid_up.png "Selenoid Up")

**3. Run Selenoid by using Docker on Linux**

Locate and execute shell script: `./docker/scripts/linux/startSelenoid.sh` with _sudo_ permission and after a while you should see the same confirmation that containers up and running like fo Windows:

![Alt text](https://github.com/VF-1S/SeleniumGrid/blob/main/images/ReadmeImages/Selenoid_done.png "Selenoid configured")

- **Run Selenoid on Linux server in VM (Oracle VirtualBox)**

    Note: It was used `ubuntu-21.04-live-server-amd64.iso` and configured on VM. It is required on your VM to attach Adapter 1 to "Bridge Adapter" with the name of network adapter on your host system, for more info [see here](https://www.virtualbox.org/manual/ch06.html#network_bridged).
    
    Run command `ip a` and there should be present IP configuration of you Linux server where you should find something like this:
    
     ```sh
        2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
                link/ether 08:00:27:87:69:10 brd ff:ff:ff:ff:ff:ff
                inet 192.168.102.39/24 brd 192.168.102.255 scope global dynamic enp0s3
                   valid_lft 689622sec preferred_lft 689622sec
                inet6 fe80::a00:27ff:fe87:6910/64 scope link
                   valid_lft forever preferred_lft forever
     ```

     where IP address of server will be `192.168.102.39` which can be used instead of localhost like: http://192.168.102.39:8080/#/
    
 

**4. Selenoid custom Configuration**

- **Adding more images to Selenoid**

    **Before taking any action please visit Selenoid's [latest image list](https://aerokube.com/images/latest/)!**
        
    If there is a need to add Browser with specific version (for example: Safari v13.0) it can be done by adding a new block under "Safari" node in `./docker/selenoid/browsers.json` file like:


    ```sh
    "13": {
            "image": "browsers/safari:13.0",
            "port": "4444",
            "path": "/",
            "hosts" : ["cdn.pendo.io:0.0.0.0","app.pendo.io:0.0.0.0"],
            "env": ["SCREEN_RESOLUTION=1920x1080x24"]
        }
    ```

    Note: you can set a custom screen resolution by changing value in _env_ attribute.

    After that the run script (_startLocalSelenoid.bat_ or *startSelenoid.sh* depends on you OS) should be updated with a new line:

    `docker pull browsers/safari:13.0`

    Execute again run script!
    
- **Set new default Browser version**

    Please note: According to Selenoid Documentation if desired capabilities for browser are not specified when Automation Test execution is started then default capabilities will be used on creating the session:

    `browserName: "MicrosoftEdge",
    enableVNC: true,
    enableVideo: false` 

    where default browser version will be used specified in `./docker/selenoid/browsers.json` file as a value of the key "default" under Browser node. If you wish to change default Browser version you should change it there and execute again run script (_startLocalSelenoid.bat_ or *startSelenoid.sh* depends on you OS)!  

- **Set new QUOTA**

    **WARNING: This may affect resources on your machine!!** Depending on machine resources and Automation Test execution strategy the QUOTA should be set in reasonable proportions.

    Locate and edit `.\docker\selenoid\docker-compose.yml` on line 16 where you can set a new limit like: `"-limit", "15"`. After that execute again run script (_startLocalSelenoid.bat_ or *startSelenoid.sh* depends on you OS)

# Why is Selenium Grid a good solution?

Selenium Grid uses a hub-node concept where you only run the test on a single machine called a **hub**, but the execution will be done by different machines called **nodes**. 

Selenium Grid is a part of the Selenium Suite that specializes in running multiple tests across different browsers, operating systems, and machines in parallel.

![Alt text](https://3fxtqy18kygf3on3bu39kh93-wpengine.netdna-ssl.com/wp-content/uploads/2019/08/Selenium-Grid-Basic-Diagram-1x-1.png "Selenoid configured")

Some of advantages are:

   -    Selenium Grid allows running selenium scripts on various browsers and operating systems.
   -   Selenium grid has a record and playback feature.
   -   It is an open-source tool, therefore no licensing cost is required.
   -   It supports test scripts written in various programming languages like Python, Ruby, Perl, PHP, C#, etc.
   
# How to contribute to this project?

You are always welcome to report a problem, make any suggestions or request a new feature here.
