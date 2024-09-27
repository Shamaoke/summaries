
#Содержание

[Создание пользователей](#Создание_пользователей)

[Создание сессий](#Создание_сессий)

[Создание сессий | Пользователь вводит неправильный пароль](#Создание_сессий___Пользователь_вводит_неправильный_пароль)

[Ограничение доступа](#Ограничение_доступа)

#Создание пользователей{#Создание_пользователей}

<nowiki>1.</nowiki> Создать файл с функцией 'Creating users'.

~~~
# features/creating_users.feature

Feature: Creating users
  Being a visitor
  I want to identify myself
  In order to get access to closed resources
~~~

<nowiki>2.</nowiki> Осуществить передачу 'create feature creating users'

<nowiki>3.</nowiki> Добавить сценарий 'Creating a user'.

~~~
# features/creating_users.feature

Feature: Creating users
  Being a visitor
  I want to identify myself
  In order to get access to closed resources

  Scenario: Creating a user
    Given I am on the users index page
    When I click "Create user"
    And I fill in "Email" with "chandler_bing@friends.tv"
    And I fill in "Password" with "secret"
    And I click "Create User"
    Then I should be on the users index page
    And I should see "User has been created"
    And the only user with email "chandler_bing@friends.tv" and password "secret" should exist
~~~

<nowiki>4.</nowiki> Осуществить передачу 'add scenario creating a user'.

<nowiki>5.</nowiki> Пометить сценарий ярлыком 'wip' (work in progress).

~~~
+@wip
 Scenario: Creating a user
~~~

<nowiki>6.</nowiki> Запустить сценарий. Программа предложит создать определения для всех шагов в сценарии.

<nowiki>7.</nowiki> Написать определение для шага 'I am on the users index page'.

~~~
# features/step_definitions/ums_steps.rb

Given /^I am on the users index page$/ do
  visit users_path
end
~~~

<nowiki>8.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
undefined local variable or method `users_path'
~~~

<nowiki>9.</nowiki> Добавить следующие строки в файл 'config/routes.rb':

~~~
# config/routes.rb

UsersManagementSystem::Application.routes.draw do
  resources :users
end
~~~

<nowiki>10.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
uninitialize constant UsersController
~~~

<nowiki>11.</nowiki> Создать файл 'app/controller/users_controller.rb' со следующим содержимым:

~~~
# app/controllers/users_controller.rb

class UsersController < ApplicationController
end
~~~

<nowiki>12.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
The action index could not be found for UsersController
~~~

<nowiki>13.</nowiki> Добавить действие 'index' для контроллера.

~~~
# app/controllers/users_controller.rb

class UsersController < ApplicationController
  def index
  end
end
~~~

<nowiki>14.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
Missing template users/index
~~~

<nowiki>15.</nowiki> Создать шаблон 'index.html.haml' в директории 'app/views/users'.

<nowiki>16.</nowiki> Запустить сценарий. Первый шаг завершится успешно.

<nowiki>17.</nowiki> Написать определение для шага 'I click "Create User"'.

~~~
# features/step_definitions/ums_steps.rb

When /^I click "([^"]*)"$/ do |element|
  click_on element
end
~~~

<nowiki>18.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
no link or button 'Create User' found
~~~

<nowiki>19.</nowiki> Спуститься на уровень объектов. Создать файл 'spec/views/users/index.html.haml_spec.rb' со следующим содержимым:

~~~
# spec/views/users/index.html.haml_spec.rb

require 'spec_helper'

describe 'users/index' do
  before { render }

  subject { rendered }

  it { should have_selector "a[href=\"#{new_user_path}\"]", text: 'Create User' }
end
~~~

<nowiki>20.</nowiki> Запустить спецификацию. Программа даст сбой возвратив следующее:

~~~
should has css "a[href=\"http://test.host/users/new\"]" with text "Create User"
~~~

<nowiki>21.</nowiki> Добавить в файл 'app/views/users/index.html.haml' следующее:

~~~
%div= link_to 'Create User', new_user_path
~~~

<nowiki>22.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>23.</nowiki> Поднятся на уровень приложения. Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
the action 'new' could not be found for UsersController
~~~

<nowiki>24.</nowiki> Добавить действие 'new' в контроллер 'UsersController'.

~~~
# app/controllers/users_controller.rb

class UsersController < ApplicationController
  def index
  end

  def new
  end
end
~~~

<nowiki>25.</nowiki> Запустить сценарий. Программа даст сбой возвратив следующее:

~~~
Missing template users/new
~~~

<nowiki>26.</nowiki> Создать файл 'new.html.haml' в директории 'app/views/users'.

<nowiki>27.</nowiki> Запустить сценарий. Программа завершится успешно.

<nowiki>28.</nowiki> Написать определение для шага 'I fill in "Email" with "chandler_bing@friends.tv"'.

~~~
# features/step_definitions/ums_steps.rb

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in field, with: value
end
~~~

<nowiki>29.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
cannot fill in, no text field, text area or password field with id, name, or label 'Email' found
~~~

<nowiki>30.</nowiki> Спуститься на уровень объектов. Создать файл 'spec/views/users/new.html.haml_spec.rb'. Добавить в файл следующее:

~~~
require 'spec_helper'

describe 'users/new' do
  before { render }

  subject { rendered }

  it { should have_selector "form[action=\"#{users_path}\"][method=\"post\"] input[type=\"submit\"]" }
end
~~~

<nowiki>31.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
expected css "form[action=\"/users\"][method=\"post\"] input[type=\"submit\"]" to return something
~~~

<nowiki>32.</nowiki> Добавить в файл 'app/views/users/new.html.haml' следующее:

~~~
%div
  = form_for @user do |f|
    %div= f.submit
~~~

<nowiki>33.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее.

~~~
undefined method `model_name' for NilClass:Class
~~~

<nowiki>34.</nowiki> Добавить в файл 'spec/views/users/new.html.haml_spec.rb' следующее:

~~~
 require 'spec_helper'

 describe 'users/new.html.haml' do
+  before { assign :user, stub_model(User).as_new_record }
   before { render }

   subject { rendered }

   it { should have_selector "form[action=\"#{users_path}\"][method=\"post\"] input[type=\"submit\"]" }
 end
~~~

<nowiki>35.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
uninitialized constant User
~~~

<nowiki>36.</nowiki> Создать файл 'app/models/user.rb' со следующим содержимым:

~~~
# encoding: utf-8

class User < ActiveRecord::Base
end
~~~

<nowiki>37.</nowiki> Запустить спецификацию. Программа возвратит следующее:

~~~
Could not find table 'users'
~~~

<nowiki>38.</nowiki> Создать миграцию со следующим содержимым:

~~~
# db/migrate/<timestamp>_create_users.rb

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps
    end
  end
end
~~~

<nowiki>39.</nowiki> Выполнить миграцию.

<nowiki>40.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>41.</nowiki> Добавить в файл 'spec/views/users/new.html.haml_spec.rb' следующее:

~~~
 require 'spec_helper'

 describe 'users/new.html.haml' do
   before { assign :user, stub_model(User).as_new_record }
   before { render }

   subject { rendered }

   it { should have_selector "form[action=\"#{users_path}\"][method=\"post\"] input[type=\"submit\"]" }
+  it { should have_selector "form input[type=\"text\"][name=\"user[email]\"]" }
 end
~~~

<nowiki>42.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
expected css "form input[type=\"text\"][name=\"user[email]\"]"
~~~

<nowiki>43.</nowiki> Добавить в файл 'app/views/users/new.html.haml' следующее:

~~~
 %div
   = form_for @user do |f|
+    %div
+      %span= f.label :email
+      %span= f.text_field :email
     %div= f.submit
~~~

<nowiki>44.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
undefined method `email' for #<User id: nil, created_at: nil, updated_at: nil>
~~~

<nowiki>45.</nowiki> Изменить файл 'spec/views/users/new.html.haml_spec.rb', следующим образом:

~~~
 require 'spec_helper'

 describe 'users/new' do
-  before { assign :user, stub_model(User).a_new_record }
+  before {
+    assign(:user, stub_model(User) { |user| user.stub :email }.as_new_record)
+  }
   before { render }

   subject { rendered }

   it { should have_selector "form[action=\"#{users_path}\"][method=\"post\"] input[type=\"submit\"]" }
   it { should have_selector "form input[type=\"text\"][name=\"user[email]\"]" }
 end
~~~

<nowiki>46.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>47.</nowiki> Подняться на уровень приложения. Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
undefined method `model_name' for NilClass:Class
~~~

<nowiki>48.</nowiki> Спуститься на уровень объектов. Создать файл 'spec/controllers/users_controller_spec.rb' со следующим содержимым:

~~~
# spec/controllers/users_controller_spec.rb

require 'spec_helper'

describe UsersController do
  describe 'new' do
    it 'assigns @user' do
      get :new
      assigns[:user].should be_an_instance_of User
    end
  end
end
~~~

<nowiki>49.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
expected nil to be an instance of User(id: integer, created_at: datetime, updated_at: datetime, email: string)
~~~

<nowiki>50.</nowiki> Изменить файл 'app/controllers/users_controller.rb', добавив следующее:

~~~
 # encoding: utf-8

 class UsersController < ApplicationController
   def index
   end

   def new
+    @user = User.new
   end
 end
~~~

<nowiki>51.</nowiki> Запусить спецификацию. Программа завершится успешно.

<nowiki>52.</nowiki> Поднятся на уровень приложения запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
undefined method `email' for #<User ...>
~~~

<nowiki>53.</nowiki> Создать файл миграции со следующим содержимым:

~~~
class AddEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
  end
end
~~~

<nowiki>54.</nowiki> Осуществить миграцию.

<nowiki>55.</nowiki> Запустить сценарий. Шаг 'I fill "Email" with "chandler_bing@friends.tv"' будет успешно пройден. Однаго следующий шаг: 'I fill "Password" with "secret"', будет провален. Программа возвратит следующее:

~~~
cannot fill in, no text field, text area or password field with id, name, or label 'Password' found \
  (Capybara::ElementNotFound)
~~~

<nowiki>56.</nowiki> Спуститься на уровень объектов. Добавить в файл 'spec/views/new.html.haml_spec.rb' следующую строку:

~~~
 require 'spec_helper'

 describe 'users/new' do
   before {
     assign(:user, stub_model(User) { |user| user.stub :email }.as_new_record)
   }
   before { render }

   subject { rendered }

   it { should have_selector "form[action=\"#{users_path}\"][method=\"post\"] input[type=\"submit\"]" }
   it { should have_selector "form input[type=\"text\"][name=\"user[email]\"]" }
+  it { should have_selector "form input[type=\"password\"][name=\"user[password]\"]" }
 end
~~~

<nowiki>57.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
expected css "form input[type=\"password\"][name=\"user[password]\"] to return something
~~~

<nowiki>58.</nowiki> Добавить в файл 'app/views/users/new.html.haml' следующие строки:

~~~
 %div
   = form_for @user do |f|
     %div
       %span= f.label :email
       %span= f.text_field :email
+    %div
+      %span= f.label :password
+      %span= f.password_field :password
     %div= f.submit
~~~

<nowiki>59.</nowiki> Запустить спецификацию. Программа не потребует создания атрибута 'password' для модели, поскольку Rails не требует наличия атрибута для поля ввода пароля.

<nowiki>60.</nowiki> Запустить сценарий. Шаг 'I fill "password" with "secret"' будет успешно пройден. Однаго следующий шаг: 'I click "Create User"', будет провален. Программа возвратит следующее:

~~~
The action 'create' could not be found for UsersController (AbstractController::ActionNotFound)
~~~

<nowiki>61.</nowiki> Добавить в файл 'app/controllers/users_controller.rb' следующие строки:

~~~
 class UsersController < ApplicationController
   def index
   end

   def new
     @user = User.new
   end

+  def create
+  end
 end
~~~

<nowiki>62.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
Missing template users/create, application/create
~~~

<nowiki>63.</nowiki> Добавить в файл 'app/controllers/users_controller.rb' следующие строки:

~~~
 require 'spec_helper'

 describe UsersController do
   describe 'new' do
     it 'assigns @user' do
       get :new
       assigns[:user].should be_an_instance_of User
     end
   end

+  describe 'create' do
+    it 'redirects to the users index page' do
+      post :create
+      response.should redirect_to users_path
+    end
+  end
 end
~~~

<nowiki>64.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
Missing template users/create, application/create
~~~

<nowiki>65.</nowiki> Добавить в файл 'app/controllers/users_controller.rb' следующие строки:

~~~
 class UsersController < ApplicationController
   def index
   end

   def new
     @user = User.new
   end

+  def create
+    redirect_to users_path
+  end
 end
~~~

<nowiki>66.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>67.</nowiki> Поднятся на уровень объектов. Запустить сценарий. Программа завершится усшешно.

<nowiki>68.</nowiki> Написать определение для шага 'I should be on the users index page'.

~~~
Then /^I should be on the users index page$/ do
  current_path.should eq users_path
end
~~~

<nowiki>69.</nowiki> Запустить сценарий. Программа завершится успешно, поскольку перенаправление уже было реализовано.

<nowiki>70.</nowiki> Написать определение для шага 'I should see "User has been created'.

~~~
Then /^I should see "([^"]*)"$/ do |message|
  page.should have_content message
end
~~~

<nowiki>71.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
expected there to be content "User has been created" in "Ums\n\nCreate User\n\n\n" \
(RSpec::Expectations::ExpectationNotMetError)
~~~

<nowiki>72.</nowiki> Спуститься на уровень объектов. Добавить в файл 'spec/controllers/users_controller_spec.rb' следующие строки:

~~~
 require 'spec_helper'

 describe UsersController do
   describe 'new' do
     it 'assigns @user' do
       get :new
       assigns[:user].should be_an_instance_of User
     end
   end

   describe 'create' do
+    it 'sets a flash message' do
+      post :create
+      flash[:notice].should eq 'User has been created'
+    end
+
     it 'redirects to the users index page' do
       post :create
       response.should redirect_to users_path
     end
   end
 end
~~~

<nowiki>73.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
expected: "User has been created"
     got: nil
~~~

<nowiki>74.</nowiki> Добавить в файл 'app/controllers/users_controller.rb' следующую строку:

~~~
 class UsersController < ApplicationController
   def index
   end

   def new
     @user = User.new
   end

   def create
+    flash[:notice] = 'User has been created'
     redirect_to users_path
   end
 end
~~~

<nowiki>75.</nowiki> Запустить сценарий. программа завершится успешно.

<nowiki>76.</nowiki> Подняться на уровень объектов. Запустить сценарий. Программа даст сбой, снова возвратив следующее:

~~~
expected there to be content "User has been created" in "Ums\n\nCreate User\n\n\n" \
(RSpec::Expectations::ExpectationNotMetError)
~~~

<nowiki>77.</nowiki> Спуститься на уровень объектов. Изменить файл 'spec/views/users/index.html.haml' следующим образом:

~~~
require 'spec_helper'

describe 'users/index' do
  subject { rendered }

  context 'in general' do
    before { render }

    it { should have_selector "a[href=\"#{new_user_path}\"]", text: 'Create User' }
  end

  context 'flash is set' do
    before { flash[:notice] = 'All is OK!'; render }

    it { should have_content 'All is OK!' }
  end

  context 'flash is not set' do
    before { flash[:notice] = nil; render }

    it { should_not have_content 'All is OK!' }
  end
end
~~~

В данной группе примеры были распределены по контекстам: "общий, не зависящий от состояния оповещения", "оповещение было создано" и "оповещение не было создано".

<nowiki>78.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
expected there to be content "All is OK!" in "Create User"
~~~

<nowiki>79.</nowiki> Добавить в файл 'app/views/users/index.html.haml' следующую строку:

~~~
+%div= flash[:notice]
 %div= link_to 'Create User', new_user_path
~~~

<nowiki>80.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>81.</nowiki> Поднятся на уровень приложения. Запустить сценарий. Программа завершится успешно.

<nowiki>82.</nowiki> Создать отдельный файл определений шагов, специфичных для модели User, 'features/step_definitions/user_steps.rb'. Внести в него определение для шага 'the only user with email "chandler_bing@friends.tv" and password "secret" should exist'.

~~~
Then /^the only user with email "([^"]*)" and password "([^"]*)" should exist$/ do |email, password|
  User.find_all_by_email_and_hashed_password(
    email, User.encrypt_password(password, User.find_by_email(email).salt)
  ).should have(1).element
end
~~~

<nowiki>83.</nowiki> Запустить сценарий, программа даст сбой, возвратив следующее:

~~~
undefined method `salt' for nil:NilClass (NoMethodError)
~~~

<nowiki>84.</nowiki> Спуститься на уровень объектов. Добавить в файл 'spec/controllers/users_controller_spec.rb' следующие строки:

~~~
 describe UsersController do
   describe 'new' do
     it 'assigns @user' do
       get :new
       assigns[:user].should be_an_instance_of User
     end
   end

   describe 'create' do
+    it 'create a user' do
+      User.should_receive(:create).with('email' => 'chandler_bing@friends.tv', 'password' => 'secret')
+      post :create, user: { email: 'chandler_bing@friends.tv', password: 'secret' }
+    end
+
     it 'sets a flash message' do
       post :create
       flash[:notice].should eq 'User has been created'
     end

     it 'redirects to the users index page' do
       post :create
       response.should redirect_to users_path
     end
   end
 end
~~~

<nowiki>84.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
expected: 1 time
received: 0 times
~~~

<nowiki>85.</nowiki> Добавить в файл 'app/controller/users_controller.rb' следующее:

~~~
 class UsersController < ApplicationController
   def index
   end

   def new
     @user = User.new
   end

   def create
+    User.create(params[:user])
     flash[:notice] = 'User has been created'
     redirect_to users_path
   end
 end
~~~

<nowiki>86.</nowiki>Запустить спецификацию. Программа завершится успешно.

<nowiki>87.</nowiki> Поднятся на уровень приложения. Запустить сценарий. Шаг 'I click "Create User"' окажется проваленным. Программа возвратит следующее:

~~~
unknown attribute: password (ActiveRecord::UnknownAttributeError)
~~~

<nowiki>88.</nowiki> Изменить файл 'app/models/user.rb', добавив следующее:

~~~
 class User < ActiveRecord::Base
+  def password=(password)
+  end
 end
~~~

<nowiki>89.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
undefined method `salt' for #<User:0x0000000372e1f8> (NoMethodError)
~~~

<nowiki>90.</nowiki> Создать миграцию со следующим содержимым:

~~~
class AddSaltToUsers < ActiveRecord::Migration
  def change
    add_column :users, :salt, :string
  end
end
~~~

<nowiki>91.</nowiki> Осуществить миграцию.

<nowiki>92.</nowiki> Запустить сценанрий. Программа даст сбой, возвратив следующее:

~~~
undefined method `encrypt_password' for #<Class:0x00000004b08ea8> (NoMethodError)
~~~

<nowiki>93.</nowiki> Создать файл 'spec/users/user_spec.rb' со следующим содержимым:

~~~
require 'spec_helper'

describe User do
  context 'class' do
    describe 'encrypt_password' do
      it 'encrypts a password' do
        User.encrypt_password('secret', '0.0').should =~ /9d0d203/
      end
    end
  end
end
~~~

<nowiki>94.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
undefined method `encrypt_password' for #<Class:0x00000003b589e0>
~~~

<nowiki>95</nowiki> Добавить в файл 'app/models/user.rb' следующее:

~~~
 class User < ActiveRecord::Base
+  class << self
+    def encrypt_password
+    end
+  end
+
   def password=(password)
   end
 end
~~~

<nowiki>96.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
wrong number of arguments (2 for 0)
~~~

<nowiki>97.</nowiki> Изменить файл 'app/models/user.rb' следующим образом:

~~~
 class User < ActiveRecord::Base
   class << self
-    def encrypt_password
+    def encrypt_password(password, salt)
     end
   end

   def password=(password)
   end
 end
~~~

<nowiki>98.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
expected: /9d0d203/
     got: nil (using =~)
~~~

<nowiki>99.</nowiki> Добавить в файл модели следующее:

~~~
+require 'digest/sha2'

 class User < ActiveRecord::Base
   class << self
     def encrypt_password(password, salt)
+      Digest::SHA2.hexdigest(password + salt)
     end
   end

   def password=(password)
   end
 end
~~~

<nowiki>100.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>101.</nowiki> Поднятся на уровень приложения. Запусить сценарий. Программа даст сбой, возвратив следующее:

~~~
can't convert nil into String (TypeError)
~~~

Причина данной ошибки в том, что при записи пользователя в БД, атрибут 'salt' оказывается равным 'nil' и это значение впоследствии передается методу '+' в определении метода 'encrypt_password', что приводит к вызову исключения при попытке конкатенации строки с nil'ом.

<nowiki>102.</nowiki> Создать файл 'spec/factories/user_factory.rb' и добавить в него следующее:

~~~
FactoryGirl.define do
  factory :user do
    email 'chandler_bing@friends.tv'
  end
end
~~~

<nowiki>103.</nowiki> Добавить в файл 'spec/models/user_spec.rb' следующее:

~~~
 require 'spec_helper'

 describe User do
   context 'class' do
     describe 'encrypt_password' do
       it 'encrypts a password' do
         User.encrypt_password('secret', '0.0').should =~ /9d0d203/
       end
     end
   end

+  context 'instance' do
+    describe 'password=' do
+      it 'sets a salt attribute' do
+        password = stub('password')
+        user = FactoryGirl.build(:user)
+        user.stub(:rand) { 0.0 }
+        user.should_receive(:salt=).with('0.0')
+        user.password=(password)
+      end
+    end
+  end
 end
~~~

<nowiki>104.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
(#<User:0x00000005a7ee50>).salt=("0.0")
    expected: 1 time
    received: 0 times
~~~

<nowiki>105.</nowiki> Добавить в файл 'app/models/user.rb' следующее:

~~~
 require 'digest/sha2'

 class User < ActiveRecord::Base
   class << self
     def encrypt_password(password, salt)
       Digest::SHA2.hexdigest(password + salt)
     end
   end

+  def password=(password)
+    self.salt = rand.to_s
+  end
 end
~~~

<nowiki>106.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>107.</nowiki> Поднятся на уровень приложения. Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
undefined method `find_all_by_email_and_hashed_password' for #<Class:0x0000000320be00> (NoMethodError)
~~~

Данная ошибка вызвана отсутствием атрибута 'hashed_password'.

<nowiki>108.</nowiki> Создать файл миграции со следующим содержимым:

~~~
class AddHashedPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hashed_password, :string
  end
end
~~~

<nowiki>109.</nowiki> Осуществить миграцию.

<nowiki>110.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
expected 1 element, got 0 (RSpec::Expectations::ExpectationNotMetError)
~~~

<nowiki>111.</nowiki> Спуститься на уровень объектов. Добавить в файл 'spec/models/user_spec.rb' следующие строки:

~~~
 require 'spec_helper'

 describe User do
   context 'class' do
     describe 'encrypt_password' do
       it 'encrypts a password' do
         User.encrypt_password('secret', '0.0').should =~ /9d0d203/
       end
     end
   end

   context 'instance' do
     describe 'password=' do
       it 'sets a salt attribute' do
         password = stub('password')
         user = FactoryGirl.build(:user)
         user.stub(:rand) { 0.0 }
         user.should_receive(:salt=).with('0.0')
         user.password=(password)
       end

+      it 'sets a hashed_password attribute' do
+        password = stub('password')
+        user = FactoryGirl.build(:user)
+        user.class.stub(:encrypt_password) { 'an_encrypted_password' }
+        user.should_receive(:hashed_password=).with('an_encrypted_password')
+        user.password=(password)
+      end
     end
   end
 end
~~~

<nowiki>112.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
(#<User:0x00000005a71228>).hashed_password=("an_encrypted_password")
    expected: 1 time
    received: 0 times
~~~

<nowiki>113.</nowiki> Изменить файл 'app/models/user.rb', добавив в него следующее:

~~~
 require 'digest/sha2'

 class User < ActiveRecord::Base
   class << self
     def encrypt_password(password, salt)
       Digest::SHA2.hexdigest(password + salt)
     end
   end

   def password=(password)
     self.salt = rand.to_s
+    self.hashed_password = self.class.encrypt_password(password, salt)
   end
 end
~~~

<nowiki>114.</nowiki> Запустить спецификацию. Программа завершится успешно:

<nowiki>115.</nowiki> Осуществить рефайкторинг примера:

~~~
 require 'spec_helper'

 describe User do
   context 'class' do
     describe 'encrypt_password' do
       it 'encrypts a password' do
         User.encrypt_password('secret', '0.0').should =~ /9d0d203/
       end
     end
   end

   context 'instance' do
     describe 'password=' do
+      let(:user)     { FactoryGirl.build(:user) }
+      let(:password) { stub(:password).as_null_object }

       it 'sets a salt attribute' do
-        password = stub('password')
-        user = FactoryGirl.build(:user)
         user.stub(:rand) { 0.0 }
         user.should_receive(:salt=).with('0.0')
         user.password=(password)
       end

       it 'sets a hashed_password attribute' do
-        password = stub('password')
-        user = FactoryGirl.build(:user)
         user.class.stub(:encrypt_password) { 'an_encrypted_password' }
         user.should_receive(:hashed_password=).with('an_encrypted_password')
         user.password=(password)
       end
     end
   end
 end
~~~

<nowiki>116.</nowiki> Поднятся на уровень приложения. Запустить сценарий. Все шаги сценария будут успешно пройдены.

<nowiki>117.</nowiki> Осуществить передачу 'pass scenario creating a user'.

#Создание сессий{#Создание_сессий}

<nowiki>1.</nowiki> Создать файл 'features/creating_sessions.feature' со следующим содержимым:

~~~
Feature: Creating sessions
  Being a user
  I want to identify miself
  In order to get access to closed resouses
~~~

<nowiki>2.</nowiki> Осуществить передачу 'create feature creating sessions'.

<nowiki>3.</nowiki> Добавить сценарий 'Creating a session' со следующими шагами:

~~~
Scenario: Creating a session
  Given a user with an email "chandler_bing@friends.tv" and a password "secret" exists
  And I am on the users index page
  When I click "Log In"
  And I fill in "Email" with "chandler_bing@friends.tv"
  And I fill in "Password" with "secret"
  And I click "Log In"
  Then I should be on the users index page
  And I should see "User has been logged in"
  And a session should exist
~~~

<nowiki>4.</nowiki> Осуществить передачу 'add scenario creating a session'.

<nowiki>5.</nowiki> Пометить сценарий тегом '@wip'.

~~~
 Feature: Creating sessions
   Being a user
   I want to identify miself
   In order to get access to closed resouses

+  @wip
   Scenario: Creating a session
     Given a user with an email "chandler_bing@friends.tv" and a password "secret" exists
     And I am on the users index page
     When I click "Log In"
     And I fill in "Email" with "chandler_bing@friends.tv"
     And I fill in "Password" with "secret"
     And I click "Log In"
     Then I should be on the users index page
     And I should see "User has been logged in"
     And a session should exist
~~~

<nowiki>6.</nowiki> Запустить сценарий. Программа сообщит, что шаг 'a user with an email <...> and password <...> exists' не определен.

<nowiki>7.</nowiki> Добавить в файл 'spec/factories/user_factory.rb' следующую строку:

~~~
 FactoryGirl.define do
   factory :user do
     email 'chandler_bing@friends.tv'
+    password 'secret'
   end
 end
~~~

<nowiki>8.</nowiki> Написать определение для шага 'a user with an email <...> and password <...> exists'.

~~~
Given /^a user with an email "([^"]*)" and a password "([^"]*)" exists$/ do |email, password|
  FactoryGirl.create(:user, email: email, password: password)
end
~~~

<nowiki>9.</nowiki> Запустить сценарий. Шаги 'a user with an email <...> exists' и 'I am on the users index page' будут пройдены. Однако, шаг 'I click "Log In"' будет провален. Программа возвратит следующее:

~~~
no link or button 'Log In' found (Capybara::ElementNotFound)
~~~

<nowiki>10.</nowiki> Спуститься на уровень объектов. Добавить в файл 'spec/views/users/index.html.haml_spec.rb' следующее:

~~~
 require 'spec_helper'

 describe 'users/index' do
   subject { rendered }

   context 'in general' do
     before { render }

     it { should have_selector "a[href=\"#{new_user_path}\"]", text: 'Create User' }
+    it { should have_selector "a[href=\"#{new_session_path}\"]", text: 'Log In' }
   end
  <...>
 end
~~~

<nowiki>11.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
NameError:
  undefined local variable or method `new_session_path'
~~~

<nowiki>12.</nowiki> Добавить в файл 'config/routes.rb' следующую строку:

~~~
 Ums::Application.routes.draw do
   resources :users
+  resources :sessions
   <...>
 end
~~~

<nowiki>13.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
expected css "a[href=\"/sessions/new\"]" with text "Log In" to return something
~~~

<nowiki>14.</nowiki> Добавить в файл 'app/views/users/index.html.haml' следующую строку:

~~~
 %div= flash[:notice]
+%div= link_to 'Log In', new_session_path
 %div= link_to 'Create User', new_user_path
~~~

<nowiki>15.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>16.</nowiki> Поднятся на уровень приложения. Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
uninitialized constant SessionsController (ActionController::RoutingError)
~~~

<nowiki>17.</nowiki> Создать файл 'app/controllers/sessions_controller.rb' со следующим содержимым:

~~~
class SessionsController < ApplicationController
end
~~~

<nowiki>18.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
The action 'new' could not be found for SessionsController (AbstractController::ActionNotFound)
~~~

<nowiki>19.</nowiki> Добавить в файл 'app/controllers/sessions_controller.rb' следующее:

~~~
class SessionsController < ApplicationController
  def new
  end
end
~~~

<nowiki>20.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
Missing template sessions/new, application/new
~~~

<nowiki>21.</nowiki> Создать шаблон 'app/views/sessions/new.html.haml'.

<nowiki>22.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
cannot fill in, no text field, text area or password field with id, name, or label 'Email' found (Capybara::ElementNotFound)
~~~

<nowiki>23.</nowiki> Спуститься на уровень объектов. Создать файл 'spec/views/sessions/new.html.haml_spec.rb' и добавить в него следующее:

~~~
require 'spec_helper'

describe 'sessions/new' do
  subject { rendered }

  before { render }

  it { should have_selector "form[action=\"#{session_path}\"][method=\"post\"] input[type=\"submit\"]" }
end
~~~

<nowiki>24.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
expected css "form[action=\"/sessions\"][method=\"post\"] input[type=\"submit\"]" to return something
~~~

<nowiki>25.</nowiki> Добавить в файл 'app/views/sessions/new.html.haml' следующее:

~~~
%div
  = form_tag sessions_path do
    %div= submit_tag
~~~

<nowiki>26.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>27.</nowiki> Добавить в файл 'spec/views/sessions/new.html.haml' следующее:

~~~
 require 'spec_helper'

 describe 'sessions/new' do
   subject { rendered }

   before { render }

   it { should have_selector "form[action=\"#{session_path}\"][method=\"post\"] input[type=\"submit\"]" }
+  it { should have_selector "form input[type=\"submit\"][name=\"user[email]\"]" }
 end
~~~

<nowiki>28.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
expected css "form input[type=\"text\"][name=\"user[email]\"]" to return something
~~~

<nowiki>29.</nowiki> Добавить в файл 'app/views/sessions/new.html.haml' следующие строки:

~~~
%div
  = form_tag sessions_path do
    %div
      %span= label_tag :user_email
      %span= text_field_tag 'user[email]'
    %div= submit_tag
~~~

<nowiki>30.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>31.</nowiki> Поднятся на уровень приложения. Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
cannot fill in, no text field, text area or password field with id, name, or label 'Email' found (Capybara::ElementNotFound)
~~~

<nowiki>32.</nowiki> Изменить файл 'app/views/sessions/new.html.haml' следующим образом:

~~~
 %div
   = form_tag sessions_path do
     %div
-      %span= label_tag :user_email
+      %span= label_tag :user_email, 'Email'
       %span= text_field_tag 'user[email]'
     %div= submit_tag
~~~

<nowiki>33.</nowiki> Запустить сценарий. Шаг 'I fill in "Email" with "chandler_bing@friends.tv"' будет успешно пройден. Однако, шаг 'I fill in "Password" with "secret"' будет провален. Программа возвратит следующее:

~~~
cannot fill in, no text field, text area or password field with id, name, or label 'Password' found \
  (Capybara::ElementNotFound)
~~~

<nowiki>34.</nowiki> Спуститься на уровень объектов. Добавить в файл 'spec/views/sessions/new.html.haml_spec.rb' следующие строки:

~~~
 require 'spec_helper'

 describe 'sessions/new' do
   subject { rendered }

   before { render }

   it { should have_selector "form[action=\"#{session_path}\"][method=\"post\"] input[type=\"submit\"]" }
   it { should have_selector "form input[type=\"text\"][name=\"user[email]\"]" }
+  it { should have_selector "form input[type=\"password\"][name=\"user[password]\"]" }
 end
~~~

<nowiki>35.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
expected css "form input[type=\"password\"][name=\"user[password]\"]" to return something
~~~

<nowiki>36.</nowiki> Изменить файл 'app/views/sessions/new.html.haml', добавив в него следующее:

~~~
 %div
   = form_tag sessions_path do
     %div
       %span= label_tag :user_email, 'Email'
       %span= text_field_tag 'user[email]'
+    %div
+      %span= label_tag :user_password
+      %span= password_field_tag 'user[password]'
     %div= submit_tag
~~~

<nowiki>37.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>38.</nowiki> Поднятся на уровень приложения. Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
cannot fill in, no text field, text area or password field with id, name, or label 'Password' found \
  (Capybara::ElementNotFound)
~~~

<nowiki>39.</nowiki> Изменить файл 'app/views/sessions/new.html.haml' следующим образом:

~~~
 %div
   = form_tag sessions_path do
     %div
       %span= label_tag :user_email, 'Email'
       %span= text_field_tag 'user[email]'
     %div
-      %span= label_tag :user_password
+      %span= label_tag :user_password, 'Password'
       %span= password_field_tag 'user[password]'
     %div= submit_tag
~~~

<nowiki>40.</nowiki> Запустить сценарий. Шаг 'I fill in "Password" with "secret"' будет пройден. Однако шаг 'I click "Log In"' окажется проваленным. Программа возвратит следующее:

~~~
no link or button 'Log In' found (Capybara::ElementNotFound)
~~~

<nowiki>41.</nowiki> Изменить файл 'app/views/sessions/new.html.haml' следующим образом:

~~~
 %div
   = form_tag sessions_path do
     %div
       %span= label_tag :user_email, 'Email'
       %span= text_field_tag 'user[email]'
     %div
       %span= label_tag :user_password, 'Password'
       %span= password_field_tag 'user[password]'
-    %div= submit_tag
+    %div= submit_tag 'Log In'
~~~

<nowiki>42.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
The action 'create' could not be found for SessionsController (AbstractController::ActionNotFound)
~~~

<nowiki>43.</nowiki> Добавить в файл 'app/controllers/sessions_controller.rb' следующие строки:

~~~
 class SessionsController < ApplicationController
   def new
   end

+  def create
+  end
 end
~~~

<nowiki>44.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
Missing template sessions/create, application/create
~~~

<nowiki>45.</nowiki> Спуститься на уровень объектов. Создать файл 'spec/controllers/sessions_controller_spec.rb' со следующим содержимым:

~~~
require 'spec_helper'

describe SessionsController do
  describe 'create' do
    it 'redirects to the users path' do
      post :create
      response.should redirect_to users_path
    end
  end
end
~~~

<nowiki>46.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
Expected response to be a <:redirect>, but was <200>
~~~

<nowiki>47.</nowiki> Изменить файл 'app/controllers/sessions_controller.rb' добавив в него следующее:

~~~
class SessionsController < ApplicationController
  def new
  end

  def create
    redirect_to users_path
  end
end
~~~

<nowiki>48.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>49.</nowiki> Поднятся на уровень объектов. Запустить сценарий. Шаги 'I click "Log In"' и 'I should be on the users index page' будут пройдены. Однако шаг 'I should see "User has bee logged in"' окажется проваленным. Программа возвратит следующее:

~~~
expected there to be content "User has been logged in" \
  in "Ums\n\n\nLog In\nCreate User\n\n\n" (RSpec::Expectations::ExpectationNotMetError)
~~~

<nowiki>50.</nowiki> Спуститься на уровень объектов. Добавить в файл 'spec/controllers/sessions_controller_spec.rb' следующее:

~~~
 require 'spec_helper'

 describe SessionsController do
   describe 'create' do
+    it 'sets a flash message' do
+      post :create
+      flash[:notice].should eq 'User has been logged in'
+    end
+
     it 'redirects to the users path' do
       post :create
       response.should redirect_to users_path
     end
   end
 end
~~~

<nowiki>51.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
expected: "User has been logged in"
     got: nil
~~~

<nowiki>52.</nowiki> Изменить файл 'app/controllers/sessions_controller.rb' добавив следующее:

~~~
 class SessionsController < ApplicationController
   def new
   end

   def create
+    flash[:notice] = 'User has been logged in'
     redirect_to users_path
   end
 end
~~~

<nowiki>53.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>54.</nowiki> Поднятся на уровень приложения. Запустить сценарий. Шаг 'I should see "User has been logged in"' будет пройден.

<nowiki>55.</nowiki> Написать определение для шага 'a session should exist'.

~~~
Then /^a session should exist$/ do
  session['user_id'].should eq @user.id
end
~~~

<nowiki>65.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
undefined method `session' for nil:NilClass (NoMethodError)
~~~

Данная ошибка вызвана тем, что хэш сессии не доступен в шагах Cucumber'а посредством вспомогательного метода 'session'.

<nowiki>66.</nowiki> Создать файл 'features/support/ums_helpers.rb' со следующим содержимым:

~~~
module UmsHelpers
  def session
    Marshal.load(
      Base64.decode64(
        Capybara
          .current_session
          .driver
          .request
          .cookies
          .fetch(
            Rails
              .application
              .config
              .session_options
              .fetch(:key)
          )
      )
    )
  end
end
~~~

<nowiki>67.</nowiki> Добавить в файл 'features/support/env.rb' следующее:

~~~
require_relative 'ums_helpers'
<...>
# Load UmsHelpers
World(UmsHelpers)
~~~

<nowiki>68.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
Called id for nil, which would mistakenly be 4 -- if you really wanted the id of nil, use object_id (RuntimeError)
~~~

Ошибка вызвана тем, что переменная '@user' равна 'nil'.

<nowiki>69.</nowiki> Изменить шаг 'a user with an email <...> and a password <...> exists' следующим образом:

~~~
 Given /^a user with an email "([^"]*)" and a password "([^"]*)" exists$/ do |email, password|
-  FactoryGirl.create(:user, email: email, password: password)
+  @user = FactoryGirl.create(:user, email: email, password: password)
 end
~~~

<nowiki>70.</nowiki> Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
expected: 1
     got: nil
~~~

<nowiki>71.</nowiki> Спуститься на уровень объектов. Добавить в файл 'spec/controllers/session_controller_spec.rb' следующее:

~~~
require 'spec_helper'

describe SessionsController do
  describe 'create' do
    it 'sets a session' do
      user = stub_model(User)
      User.stub(:authenticate) { user.id }
      post :create
      session[:user_id].should eq user.id
    end
  <...>
  end
end
~~~

<nowiki>72.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
expected: 1001
     got: nil
~~~

<nowiki>73.</nowiki> Изменить файл 'app/controllers/sessions_controller.rb' следующим образом:

~~~
 class SessionsController < ApplicationController
   def new
   end

   def create
+    session[:user_id] = User.authenticate(params[:user])
     flash[:notice] = 'User has been logged in'
     redirect_to users_path
   end
 end
~~~

<nowiki>74.</nowiki> Запустить спецификацию. Пример 'sets a session' завершится успешно. Однако, примеры 'sets a flash message' и 'redirects to the users path' дадут сбой. Программа возвратит следующее:

~~~
1) SessionsController create sets a flash message
     Called id for nil, which would mistakenly be 4 -- if you really wanted the id of nil, use object_id

2) SessionsController create redirects to the users path
     Called id for nil, which would mistakenly be 4 -- if you really wanted the id of nil, use object_id
~~~

<nowiki>75.</nowiki> Изменить файл 'spec/controllers/sessions_controller_spec.rb' следующим образом:

~~~
 require 'spec_helper'

 describe SessionsController do
   describe 'create' do
+    let(:user) { stub_model User }

+    before { User.stub(:authenticate) { user.id } }

     it 'sets a session' do
-      user = stub_model(User)
-      User.stub(:authenticate) { user.id }
       post :create
       session[:user_id].should eq user.id
     end

     it 'sets a flash message' do
       post :create
       flash[:notice].should eq 'User has been logged in'
     end

     it 'redirects to the users path' do
       post :create
       response.should redirect_to users_path
     end
   end
 end
~~~

<nowiki>76.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>77.</nowiki> Поднятся на уровень приложения. Запустить сценарий. Шаг 'I click "Log In"' будет провален. Программа возвратит следующее:

~~~
undefined method `authenticate' for #<Class:0x0000000350cdc0> (NoMethodError)
~~~

<nowiki>78.</nowiki> Спуститься на уровень объектов. Добавить в файл 'spec/models/user_spec.rb' следующие строки:

~~~
require 'spec_helper'

describe User do
  context 'class' do
    describe 'encrypt_password' do
      it 'encrypts a password' do
        User.encrypt_password('secret', '0.0').should =~ /9d0d203/
      end
    end

    describe 'authenticate' do
      it 'returns a user id based on the passed hash of attributes' do
        user = FactoryGirl.create(:user)
        User.authenticate(email: 'chandler_bing@friends.tv', password: 'secret').should eq user.id
      end
    end
  end
  <...>
end
~~~

<nowiki>79.</nowiki> Запустить спецификацию. Программа даст сбой возвратив следующее:

~~~
undefined method `authenticate' for #<Class:0x00000004418f30>
~~~

<nowiki>80.</nowiki> Добавить в файл 'app/models/user.rb' следующее:

~~~
 require 'digest/sha2'

 class User < ActiveRecord::Base
   class << self
     def encrypt_password(password, salt)
       Digest::SHA2.hexdigest(password + salt)
     end

+    def authenticate
+    end
   end

   def password=(password)
     self.salt = rand.to_s
     self.hashed_password = self.class.encrypt_password(password, salt)
   end
 end
~~~

<nowiki>81.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
wrong number of arguments (1 for 0)
~~~

<nowiki>82.</nowiki> Изменить файл 'app/models/user.rb' следующим образом:

~~~
 require 'digest/sha2'

 class User < ActiveRecord::Base
   class << self
     def encrypt_password(password, salt)
       Digest::SHA2.hexdigest(password + salt)
     end

-    def authenticate
+    def authenticate(attributes)
     end
   end

   def password=(password)
     self.salt = rand.to_s
     self.hashed_password = self.class.encrypt_password(password, salt)
   end
 end
~~~

<nowiki>83.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
 expected: 1
      got: nil
~~~

<nowiki>84.</nowiki> Изменить файл 'app/models/user.rb' следующим образом:

~~~
 require 'digest/sha2'

 class User < ActiveRecord::Base
   class << self
     def encrypt_password(password, salt)
       Digest::SHA2.hexdigest(password + salt)
     end

     def authenticate(attributes)
+      user = User.find_by_email(attributes[:email])
+      user.id if encrypt_password(attributes[:password], user.salt) == user.hashed_password
     end
   end

   def password=(password)
     self.salt = rand.to_s
     self.hashed_password = self.class.encrypt_password(password, salt)
   end
 end
~~~

<nowiki>85.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>86.</nowiki> Запуситить сценарий. Программа завершится успешно.

<nowiki>87.</nowiki> Осуществить передачу 'pass scenario creating a session'.

#Создание сессий | Пользователь вводит неправильный пароль{#Создание_сессий___Пользователь_вводит_неправильный_пароль}

<nowiki>1.</nowiki> Добавить в файл 'features/creating_sessions.feature' следующие строки:

~~~
 Feature: Creating sessions
   Being a user
   I want to identify miself
   In order to get access to closed resouses

   Scenario: Creating a session
     Given a user with an email "chandler_bing@friends.tv" and a password "secret" exists
     And I am on the users index page
     When I click "Log In"
     And I fill in "Email" with "chandler_bing@friends.tv"
     And I fill in "Password" with "secret"
     And I click "Log In"
     Then I should be on the users index page
     And I should see "User has been logged in"
     And a session should exist
+
+   Scenario: Creating a session with an incorrect password
+     Given a user with an email "chandler_bing@friends.tv" and a password "secret" exists
+     And I am on the users index page
+     When I click "Log In"
+     And I fill in "Email" with "chandler_bing@friends.tv"
+     And I fill in "Password" with "incorrect"
+     And I click "Log In"
+     Then I should see "User has not been logged in"
+     And a session should not exist
~~~

<nowiki>2.</nowiki> Осуществить передачу 'add scenario creating a session with an incorrect password'

<nowiki>3.</nowiki> Пометить вновь созданный сценарий тегом '@wip'.

<nowiki>4.</nowiki> Запустить сценарий. Программа даст сбой на шаге 'I should see "User has not been logged in"'.

~~~
expected there to be content "User has not been logged in"
~~~

<nowiki>5.</nowiki> Спуститься на уровень объектов. Изменить файл 'spec/views/sessions/new.html.haml_spec.rb' следующим образом:

~~~
 require 'spec_helper'

 describe 'sessions/new' do
   subject { rendered }

+  context 'in general' do
     before { render }

     it { should have_selector "form[action=\"#{session_path}\"][method=\"post\"] input[type=\"submit\"]" }
     it { should have_selector "form input[type=\"text\"][name=\"user[email]\"]" }
     it { should have_selector "form input[type=\"password\"][name=\"user[password]\"]" }
+  end
+
+  context 'flash is set' do
+    before { flash[:notice] = 'All is OK!'; render }
+
+    it { should have_content 'All is OK!' }
+  end
 end
~~~

<nowiki>6.</nowiki> Запустить спецификацию. Программа даст сбой, возвратив следующее:

~~~
expected there to be content "All is OK!"
~~~

<nowiki>7.</nowiki> Добавить в файл 'app/views/sessions/new.html.haml' следующую строку:

~~~
+%div= flash[:notice]
 %div
   = form_tag sessions_path do
     %div
       %span= label_tag :user_email, 'Email'
       %span= text_field_tag 'user[email]'
     %div
       %span= label_tag :user_password, 'Password'
       %span= password_field_tag 'user[password]'
     %div= submit_tag 'Log In'
~~~

<nowiki>8.</nowiki> Запустить спецификацию. Программа завершится успешно.

<nowiki>9.</nowiki> Подняться на уровень объектов. Запустить сценарий. Программа даст сбой, возвратив следующее:

~~~
expected there to be content "User has not been logged in"
~~~

#Ограничение доступа{#Ограничение_доступа}

