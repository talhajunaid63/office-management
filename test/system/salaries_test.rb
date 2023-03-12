require "application_system_test_case"

class SalariesTest < ApplicationSystemTestCase
  setup do
    @salary = salaries(:one)
  end

  test "visiting the index" do
    visit salaries_url
    assert_selector "h1", text: "Salaries"
  end

  test "should create salary" do
    visit salaries_url
    click_on "New salary"

    fill_in "Bonus", with: @salary.bonus
    fill_in "Company", with: @salary.company_id
    fill_in "Gross total", with: @salary.gross_total
    fill_in "Month", with: @salary.month
    fill_in "User", with: @salary.user_id
    click_on "Create Salary"

    assert_text "Salary was successfully created"
    click_on "Back"
  end

  test "should update Salary" do
    visit salary_url(@salary)
    click_on "Edit this salary", match: :first

    fill_in "Bonus", with: @salary.bonus
    fill_in "Company", with: @salary.company_id
    fill_in "Gross total", with: @salary.gross_total
    fill_in "Month", with: @salary.month
    fill_in "User", with: @salary.user_id
    click_on "Update Salary"

    assert_text "Salary was successfully updated"
    click_on "Back"
  end

  test "should destroy Salary" do
    visit salary_url(@salary)
    click_on "Destroy this salary", match: :first

    assert_text "Salary was successfully destroyed"
  end
end
