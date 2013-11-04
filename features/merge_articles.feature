Feature: article merging
	As an admin
	In order to consolidate similar articles
	I want to be able to merge two articles

Background:
	Given I am on the new article page
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    When I go to the new article page
    When I fill in "article_title" with "Bazbar"
    And I fill in "article__body_and_extended_editor" with "Dolor Sit Amet"
    And I press "Publish"


Scenario:  A non-admin cannot merge two articles
	Given I am logged in as contributor
	Given I am on the edit article page
	Then I should not see "Merge"

Scenario: Merged article should contain both texts
	Given "Foobar" and "Bazbar" have been merged into "Foobar"
	When I follow "Foobar"
	Then I should see "Dolor Sit Amet"



Scenario: Merged article has one author
	Given "Foobar" and "Bazbar" have been merged into "Foobar"

Scenario: Comments should carry over

Scenario:  Title of merged article should match one of original