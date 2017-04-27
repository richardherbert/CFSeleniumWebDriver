component extends='WebDriver' {
	public WebDriver function init(
		string localDriverRepoPath = variables.defaultLocalDriverRepoPath
	) {
		variables.javaSystem.setProperty( 'webdriver.gecko.driver', localDriverRepoPath & '/geckodriver.exe' );

		var driver = createObject( 'java', 'org.openqa.selenium.firefox.FirefoxDriver' );

		return super.init( driver );
	}
}
