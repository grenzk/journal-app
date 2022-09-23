require 'application_system_test_case'

class CategoriesTest < ApplicationSystemTestCase
  setup { @category = categories(:first) }

  test 'Creating a new category' do
    visit categories_path
    assert_selector 'h1', text: 'Categories'

    click_on 'New category'
    fill_in 'Name', with: 'Personal'

    assert_selector 'h1', text: 'Categories'
    click_on 'Create category'

    assert_selector 'h1', text: 'Categories'
    assert_text 'Personal'
  end

  test 'Showing a category' do
    visit categories_path
    click_link @category.name

    assert_selector 'h1', text: @category.name
  end

  test 'Updating a category' do
    visit categories_path
    assert_selector 'h1', text: 'Categories'

    click_on 'Edit', match: :first
    fill_in 'Name', with: 'Updated category'

    assert_selector 'h1', text: 'Category'
    click_on 'Update category'

    assert_selector 'h1', text: 'Categories'
    assert_text 'Updated category'
  end

  test 'Destroying a category' do
    visit categories_path
    assert_text @category.name

    click_on 'Delete', match: :first
    assert_no_text @category.name
  end
end
