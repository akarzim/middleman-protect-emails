Feature: Email Protection

  Scenario: Inserts script into the page
    Given the Server is running at "test-app"
    When I go to "/"
    Then I should see "</script>"

  Scenario: Shows obfuscated email on page
    Given the Server is running at "test-app"
    When I go to "/"
    Then I should see "<a href='#email-protection-rznvy@rknzcyr.pbz'></a>"

  Scenario: Inserts script into end of body if a body tag exists
    Given the Server is running at "test-app"
    When I go to "/with_body.html"
    Then I should see:
    """
    </script>
    </body>
    """

  Scenario: Does not insert script if there is no email on the page
    Given the Server is running at "test-app"
    When I go to "/with_no_email.html"
    Then I should not see "</script>"

  Scenario: Encrypts multiple emails
    Given the Server is running at "test-app"
    When I go to "/with_multiple_emails.html"
    Then I should see "<a href='#email-protection-rznvy1@rknzcyr.pbz'></a>"
    Then I should see "<a href='#email-protection-rznvy2@rknzcyr.pbz'></a>"

  Scenario: Encrypts mailto link parameters
    Given the Server is running at "test-app"
    When I go to "/with_url_params.html"
    Then I should see "<a href='#email-protection-rznvy@rknzcyr.pbz?fhowrpg=Grfg%20Fhowrpg&obql=Grfg%20Obql'></a>"
