require "application_system_test_case"

class Api::TodosTest < ApplicationSystemTestCase
  setup do
    @api_todo = api_todos(:one)
  end

  test "visiting the index" do
    visit api_todos_url
    assert_selector "h1", text: "Api/Todos"
  end

  test "creating a Todo" do
    visit api_todos_url
    click_on "New Api/Todo"

    click_on "Create Todo"

    assert_text "Todo was successfully created"
    click_on "Back"
  end

  test "updating a Todo" do
    visit api_todos_url
    click_on "Edit", match: :first

    click_on "Update Todo"

    assert_text "Todo was successfully updated"
    click_on "Back"
  end

  test "destroying a Todo" do
    visit api_todos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Todo was successfully destroyed"
  end
end
