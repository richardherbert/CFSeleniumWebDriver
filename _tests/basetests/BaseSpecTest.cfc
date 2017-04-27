component extends="_tests.basetests.BaseSuiteTest" {
// setup
	function beforeAll() {
		super.beforeAll();

		variables.headers = [
			{name: "Accept"
				,value="application/vnd.abcam+#variables.mediaType#;version=#variables.version#"
			}
		];
	}

// teardown
	function afterAll() {
		super.afterAll();
	}


////////////////////////////////////////////////////////////////////////////////
// common Spec level methods
////////////////////////////////////////////////////////////////////////////////

}
