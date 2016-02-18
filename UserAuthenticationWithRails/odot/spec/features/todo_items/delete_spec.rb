require 'spec_helper'

describe "Deleting todo items" do
  let(:user) { create(:user) }
  let!(:todo_list) { TodoList.create(title: "Grocery list", description: "Groceries") }
  let!(:todo_item) { todo_list.todo_items.create(content: "Milk") }
  
  before do
    sign_in user, password: "treehouse1"
  end
  
  it "is successful" do
   visit_todo_list(todo_list)
   within "#todo_item_#{todo_item.id}" do
     click_link "Delete"
   end
   expect(page).to have_content("Todo list item was deleted")
   expect(TodoItem.count).to eq(0)
  end
  
end