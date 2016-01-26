run:
	xctool --version
	@echo
	xctool -workspace samples/Counter/Counter.xcworkspace -scheme UIDesign -sdk iphonesimulator test
