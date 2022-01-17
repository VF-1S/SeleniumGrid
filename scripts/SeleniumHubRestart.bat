git pull

SET CHROME=.\chromedriver\97.0.4692.71\chromedriver.exe
SET GECKO=.\geckodriver\0.30.0\geckodriver.exe
SET IE=.\iedriverserver\3.150.1\IEDriverServer.exe
SET EDGE=.\MicrosoftWebDriver\97.0.1072.62\msedgedriver.exe
SET SELENIUM=.\selenium-server-standalone\selenium-server-standalone-3.141.59.jar
SET HUB=http://localhost:4444/grid/register

java -Dselenium.LOGGER.level=OFF -jar -Dwebdriver.firefox.bin=%FIREFOX% -Dwebdriver.edge.driver=%EDGE% -Dwebdriver.chrome.driver=%CHROME% -Dwebdriver.gecko.driver=%GECKO% -Dwebdriver.ie.driver=%IE% -Dwebdriver.ie.bin=%IE32% %SELENIUM% -role node -nodeConfig %BROWSERS%
