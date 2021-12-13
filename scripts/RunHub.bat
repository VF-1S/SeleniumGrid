SET HUB_CONFIG=.\hub\hubConfig.json

java -Dselenium.LOGGER.level=OFF -jar %SELENIUM% -role hub -hubConfig %HUB_CONFIG%