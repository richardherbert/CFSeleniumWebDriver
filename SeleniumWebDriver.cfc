component {
	public SeleniumWebDriver function init( requried string driverType, required string localDriverRepoPath ) {
		variables.driver = setDriverByType( driverType, localDriverRepoPath );

		return this;
	}

	public cfselenium.drivers.WebDriver function getDriver() {
		return variables.driver;
	}

	public any function setDriverByType( required string driverType, required string localDriverRepoPath ) {
		switch( driverType ) {
			case 'firefox':
				var driver = new cfselenium.drivers.FireFoxDriver( localDriverRepoPath );
			break;

			default:
				var driver = new cfselenium.drivers.WebDriver( localDriverRepoPath );
			break;
		}

		return driver;
	}
}
