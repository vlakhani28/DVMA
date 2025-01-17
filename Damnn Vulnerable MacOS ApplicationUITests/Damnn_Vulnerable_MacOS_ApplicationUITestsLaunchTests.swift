//
//  Damnn_Vulnerable_MacOS_ApplicationUITestsLaunchTests.swift
//  Damnn Vulnerable MacOS ApplicationUITests
//
//  Created by Vaibhav Lakhani on 26/12/24.
//

import XCTest

final class Damnn_Vulnerable_MacOS_ApplicationUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
