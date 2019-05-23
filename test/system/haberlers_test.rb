require "application_system_test_case"

class HaberlersTest < ApplicationSystemTestCase
  setup do
    @haberler = haberlers(:one)
  end

  test "visiting the index" do
    visit haberlers_url
    assert_selector "h1", text: "Haberlers"
  end

  test "creating a Haberler" do
    visit haberlers_url
    click_on "New Haberler"

    fill_in "Baslik", with: @haberler.baslik
    fill_in "Icerik", with: @haberler.icerik
    click_on "Create Haberler"

    assert_text "Haberler was successfully created"
    click_on "Back"
  end

  test "updating a Haberler" do
    visit haberlers_url
    click_on "Edit", match: :first

    fill_in "Baslik", with: @haberler.baslik
    fill_in "Icerik", with: @haberler.icerik
    click_on "Update Haberler"

    assert_text "Haberler was successfully updated"
    click_on "Back"
  end

  test "destroying a Haberler" do
    visit haberlers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Haberler was successfully destroyed"
  end
end
