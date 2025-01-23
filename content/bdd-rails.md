---
title: BDD в Rails
---

# Содержание #
{: id="Содержание" }

* [Примеры](#Примеры)

# Примеры #
{: id="Примеры" }

* [Описание rails-представлений](#Описание_rails_представлений)

* [Описание rails-контроллеров](#Описание_rails_контроллеров)

* [Описание rails-моделей](#Описание_rails_моделей)

## Описание rails-представлений ##
{: id="Описание_rails_представлений" }

### Типы описываемых поведений ###
{: id="Типы_описываемых_поведений" }

**Отображение** (displaying)

~~~~
it 'displays an attribute of a model'
~~~~

**Обработка** (rendering)

~~~~
it 'renders a form to create a model'
~~~~

~~~~
it 'renders a field for model attribute'
~~~~

### Структура файла с описанием ###
{: id="Структура_файла_с_описанием" }

~~~~
# spec/views/<имя_контроллера>/<имя_действия>.html.haml_spec.rb

describe '<имя_контроллера>/<имя_дейстия>.html.haml' do
  it 'displays the <имя_атрибута> of the <имя_модели>' do
    assign(:<имя_переменной_экземпляра>, double('<имя_модели>', <имя_атрибута>: <возвращаемое_значение>)
    render # будет обработан шаблон, указанный в аргументе группы примеров наивысшего уровня
    rendered.should have_content('<возвращаемое_значение>')
  end
end
~~~~

~~~~
# spec/views/<имя_контроллера>/<имя_действия>.html.haml_spec.rb

describe '<имя_контроллера>/<имя_действия>.html.haml' do
  it 'renders a form to <действие> the <имя_модели>' do
    assign(:<имя_переменной_экземпляра>, mock_model('<имя_модели>').as_new_record.as_null_object)
    render # будет обработан шаблон, указанный в аргументе группы примеров наивысшего уровня
    rendered.should have_selector(
      "form[method=\"post\"][action=\"#{<маршрут>}\"] input[type=\"submit\"]"
    )
  end

  it 'renders a <тип_поля> for the <имя_модели> <имя_атрибута>' do
    assign(:<имя_переменной_экземпляра>, mock_model('<имя_модели>', <имя_атрибута>: <значение_атрибута>).as_new_record)
    render
    rendered.should have_selector(
      "form input[type=\"<тип_поля>\"][name=\"<имя_модели>[<имя_атрибута>]\"][value=<значение_атрибута>]"
    )
  end
end
~~~~

### Пример описания для представления new ###
{: id="Пример_описания_для_представления_new" }

~~~~
describe 'messages/new' do
  let :message do (mock_model 'Message').as_new_record end
  let :page    do Capybara.string rendered end
  let :form    do page.find "form[method='post'][action='#{messages_path}']" end

  before :each do
    (allow message) .to receive :title
    (allow message) .to receive :text

    assign :message, message

    render
  end

  subject { form }

  it { should have_field 'message[title]', type: 'text' }

  it { should have_selector 'textarea[name="message[text]"]' }

  it { should have_selector 'input[type="submit"][value="save"]' }
end
~~~~

### Пример описания для представления edit ###
{: id="Пример_описания_для_представления_edit" }

~~~~
# spec/views/projects/edit.html.haml_spec.rb

require 'spec_helper'

describe 'projects/edit.html.haml' do
  subject { rendered }

  let!(:project) do
    project = assign(:project, stub_model(Project, name: 'Textmate 2'))
    render
    project
  end

  it { should have_selector("form[method=\"post\"][action=\"#{project_path(project)}\"]
→ input[type=\"hidden\"][name=\"_method\"][value=\"put\"], input[type=\"submit\"]") }
end
~~~~

## Описание rails-контроллеров ##
{: id="Описание_rails_контроллеров" }

### Структура файла с описанием без контекста ###
{: id="Структура_файла_с_описанием_без_контекста" }

~~~~
# spec/controllers/some_controller_spec.rb

describe SomeController do
  describe 'create' do
    it 'creates' do
      SomeModel.should_receive(:new)
      post :create
    end

    it 'saves' do
      some_model.should_receive(:save)
      post :create
    end

    it 'redirects' do
      post :create
      response.should redirect_to(some_path)
    end
  end
end
~~~~

### Пример описания контроллера без контекста ###
{: id="Пример_описания_контроллера_без_контекста" }

~~~~
# spec/controllers/messages_controller.rb

describe MessagesController do
  describe 'create' do
    it 'creates a new message' do
      message = stub_model(Message)
      Message.should_receive(:new).and_return(message)
      post :create
    end

    it 'saves the message' do
      message = mock_model(Message)
      Message.stub(:new).and_return(message)
      message.should_receive(:save)
      post :create
    end

    it 'redirects to the Messages index' do
      post :create
      response.should redirect_to(messages_path)
    end
  end
end
~~~~

### Структура файла с описанием с использованием контекста ###
{: id="Структура_файла_с_описанием_с_использованием_контекста" }

~~~~
# spec/controllers/some_controller_spec.rb

describe SomeController do
  describe 'create' do
    let(:some_model) { mock_model(SomeModel) }

    context 'general' do
      it 'creates' do
        SomeModel.should_receive(:new)
        post :create # or post :create, id: 1
                     # or post :create, id: 1, user_id: 99
                     #
                     # method (delete, head, get, post, put, xhr)
                     # action (create, update, delete, ...)
                     # params (format, id, name, ...)
                     # session data (user_id, ...)
      end

      it 'assigns' do
        post :create
        assigns[:some_at_variable].should eq(some_model)
      end
    end

    context 'save success' do
      before(:each) do
        some_model.stub(:save).and_return(true)
      end

      it 'sets a flash message' do
        post :create
        flash[:notice].should eq('some message')
      end

      it 'redirects' do
        post :create
        response.should redirect_to(some_controller_path) # or redirect_to(@some_resource)
                                                          # or redirect_to(controller: 'some_controller',
                                                          #                action:     'some_action')
      end
    end

    context 'save fail' do
      before(:each) do
        some_model.stub(:save).and_return(false)
      end

      it 'renders' do
        post :create
        response.should render_template('new') # or render_template('some_controller/new')
      end
    end
  end
end
~~~~

### Пример описания контроллера с использованием контекста ###
{: id="Пример_описания_контроллера_с_использованием_контекста" }

~~~~
# spec/controllers/messages_controller_spec.rb

require 'spec_helper'

describe MessagesController do
  describe 'create' do
    let!(:message) do
      message = mock_model(Message).as_null_object
      Message.stub(:new).and_return(message)
      message
    end

    it 'creates a new message' do
      Message.should_receive(:new)
        .with('text' => 'a quick brown fox')
        .and_return(message)
      post :create, message: { 'text' => 'a quick brown fox' }
    end

    it 'assigns @message' do
      post :create
      assigns[:message].should eq(message)
    end

    context 'when the message saves successfully' do
      before(:each) do
        message.stub(:save).and_return(true)
      end

      it 'sets a flash message' do
        post :create
        flash[:notice].should eq('The message was saved successfully.')
      end

      it 'redirects to the Messages index' do
        post :create
        response.should redirect_to(messages_path)
      end
    end

    context 'when the message fails to save' do
      it 'renders the new template' do
        message.stub(:save).and_return(false)
        post :create
        response.should render_template('new')
      end
    end
  end
end
~~~~

### Пример описания контроллера с использованием контекста (обновленная версия) ###
{: id="Пример_описания_контроллера_с_использованием_контекста_обновленная_версия" }

~~~~
require 'rails_helper'

describe MessagesController do
  describe 'create' do
    let! :message do |example|
      (double Message) .tap do |message|
        (allow Message) .to (receive :new) .and_return message

        case example.example_group.description
        when 'the message saves successully'
          (allow message) .to (receive :save) .and_return true
        when 'the message fails to save'
          (allow message) .to (receive :save) .and_return false
        else
          (allow message) .to (receive :save)
        end

        post :create, message: { text: 'ok!' }
      end
    end

    it 'creates a new message' do
      (expect Message) .to (have_received :new) .with text: 'ok!'
    end

    it 'saves the message' do
      (expect message) .to have_received :save
    end

    context 'the message saves successully' do
      it 'sets a notification message' do
        (expect flash.notice) .to eq 'The message was saved successfully.'
      end

      it 'redirects to the messages index' do
        (expect response) .to redirect_to messages_path
      end
    end

    context 'the message fails to save' do
      it 'assigns @message' do
        (expect assigns :message) .to eq message
      end

      it 'renders the new template' do
        (expect response) .to render_template :new
      end
    end
  end
end
~~~~

### Последовательность описания действия update ###
{: id="Последовательность_описания_действия_update" }

**1.**

~~~~
# spec/controllers/projects_controller_spec.rb

descirbe 'update' do
end
~~~~

**2.**

~~~~
# spec/controllers/projects_controller_spec.rb

descirbe 'update' do
  it 'finds a project' do
    put :update, id: project.id
  end
end
~~~~

**3.**

~~~~
# spec/controllers/projects_controller_spec.rb

descirbe 'update' do
  let(:project) { stub_model(Project) }

  it 'finds a project' do
    put :update, id: project.id
  end
end
~~~~

**4.**

~~~~
# spec/controllers/projects_controller_spec.rb

descirbe 'update' do
  let(:project) { stub_model(Project) }

  before { Project.stub(:find) { project } }

  it 'finds a project' do
    put :update, id: project.id
  end
end
~~~~

**5.**

~~~~
# spec/controllers/projects_controller_spec.rb

descirbe 'update' do
  let(:project) { stub_model(Project) }

  before { Project.stub(:find) { project } }

  it 'finds a project' do
    Project.should_receive(:find) { project }
    put :update, id: project.id
  end
end
~~~~

**6.**

~~~~
# app/controllers/projects_controller.rb

class ProjectsController < ApplicationController
  def update
    Project.find
  end
end
~~~~

**7.**

~~~~
# spec/controllers/projects_controller_spec.rb

descirbe 'update' do
  let(:project) { stub_model(Project) }

  before { Project.stub(:find) { project } }

  it 'finds a project' do
    Project.should_receive(:find) { project }
    put :update, id: project.id
  end

  it 'updates the project attributes' do
    project.should_receive(:update_attributes) { true }
    put :update, id: project.id
  end
end
~~~~

**8.**

~~~~
# app/controllers/projects_controller.rb

class ProjectsController < ApplicationController
  def update
    Project.find.update_attributes
  end
end
~~~~

**9.**

~~~~
# app/controllers/projects_controller.rb

class ProjectsController < ApplicationController
  def update
    Project.find.update_attributes(params[:project])
  end
end
~~~~

**10.**

~~~~
# spec/controllers/projects_controller_spec.rb

descirbe 'update' do
  let(:project) { stub_model(Project) }

  before { Project.stub(:find) { project } }

  it 'finds a project' do
    Project.should_receive(:find) { project }
    put :update, id: project.id
  end

  it 'updates the project attributes' do
    project.should_receive(:update_attributes) { true }
    put :update, id: project.id
  end

  it 'sets a flash message' do
    put :update, id: project.id
    flash[:notice].should eq('Project has been updated')
  end
end
~~~~

**11.**

~~~~
# app/controllers/projects_controller.rb

class ProjectsController < ApplicationController
  def update
    Project.find.update_attributes(params[:project])
    flash[:notice] = 'Project has been updated'
  end
end
~~~~

**12.**

~~~~
# spec/controllers/projects_controller_spec.rb

descirbe 'update' do
  let(:project) { stub_model(Project) }

  before { Project.stub(:find) { project } }

  it 'finds a project' do
    Project.should_receive(:find) { project }
    put :update, id: project.id
  end

  it 'updates the project attributes' do
    project.should_receive(:update_attributes) { true }
    put :update, id: project.id
  end

  it 'sets a flash message' do
    put :update, id: project.id
    flash[:notice].should eq('Project has been updated')
  end

  it 'redirects to the project\'s path' do
    put :update, id: project.id
    response.should redirect_to(project)
  end
end
~~~~

**13.**

~~~~
# app/controllers/projects_controller.rb

class ProjectsController < ApplicationController
  def update
    project = Project.find
    project.update_attributes(params[:project])
    flash[:notice] = 'Project has been updated'
    redirect_to project_path(project)
  end
end
~~~~

**14.**

~~~~
# app/controllers/projects_controller.rb

class ProjectsController < ApplicationController
  def update
    project = Project.find(params[:id])
    project.update_attributes(params[:project])
    flash[:notice] = 'Project has been updated'
    redirect_to project_path(project)
  end
end
~~~~

**15.**

~~~~
# spec/controllers/projects_controller.rb

describe 'update' do
  let(:project) { stub_model(Project) }

  before { Project.stub(:find) { project } }

  it 'finds a project' do
    Project.should_receive(:find) { project }
    put :update, id: project.id
  end

  it 'updates the project attributes' do
    project.should_receive(:update_attributes) { true }
    put :update, id: project.id
  end

  context 'update is successful' do
    it 'sets a flash message' do
      put :update, id: project.id
      flash[:notice].should eq('Project has been updated')
    end

    it 'redirects to the project\'s path' do
      put :update, id: project.id
      response.should redirect_to(project)
    end
  end
end
~~~~

**16.**

~~~~
# spec/controllers/projects_controller.rb

describe 'update' do
  let(:project) { stub_model(Project) }

  before { Project.stub(:find) { project } }

  it 'finds a project' do
    Project.should_receive(:find) { project }
    put :update, id: project.id
  end

  it 'updates the project attributes' do
    project.should_receive(:update_attributes) { true }
    put :update, id: project.id
  end

  context 'update is successful' do
    before { project.stub(:update_attributes) { true } }

    it 'sets a flash message' do
      put :update, id: project.id
      flash[:notice].should eq('Project has been updated')
    end

    it 'redirects to the project\'s path' do
      put :update, id: project.id
      response.should redirect_to(project)
    end
  end
end
~~~~

**17.**

~~~~
# spec/controllers/projects_controller.rb

describe 'update' do
  let(:project) { stub_model(Project) }

  before { Project.stub(:find) { project } }

  it 'finds a project' do
    Project.should_receive(:find) { project }
    put :update, id: project.id
  end

  it 'updates the project attributes' do
    project.should_receive(:update_attributes) { true }
    put :update, id: project.id
  end

  context 'update is successful' do
    before { project.stub(:update_attributes) { true } }

    it 'sets a flash message' do
      put :update, id: project.id
      flash[:notice].should eq('Project has been updated')
    end

    it 'redirects to the project\'s path' do
      put :update, id: project.id
      response.should redirect_to(project)
    end
  end

  context 'update is failed' do
    before { project.stub(:update_attributes) { false } }
  end
end
~~~~

**18.**

~~~~
# spec/controllers/projects_controller.rb

describe 'update' do
  let(:project) { stub_model(Project) }

  before { Project.stub(:find) { project } }

  it 'finds a project' do
    Project.should_receive(:find) { project }
    put :update, id: project.id
  end

  it 'updates the project attributes' do
    project.should_receive(:update_attributes) { true }
    put :update, id: project.id
  end

  context 'update is successful' do
    before { project.stub(:update_attributes) { true } }

    it 'sets a flash message' do
      put :update, id: project.id
      flash[:notice].should eq('Project has been updated')
    end

    it 'redirects to the project\'s path' do
      put :update, id: project.id
      response.should redirect_to(project)
    end
  end

  context 'update is failed' do
    before { project.stub(:update_attributes) { false } }
    it 'sets a flash message' do
      put :update, id: project.id
      flash[:alert].should eq('Project has not been updated')
    end
  end
end
~~~~

**19.**

~~~~
# app/controllers/projects_controller.rb

class ProjectsController < ApplicationController
  def update
    project = Project.find(params[:id])
    if project.update_attributes(params[:project])
      flash[:notice] = 'Project has been updated'
      redirect_to project_path(project)
    else
      flash[:alert] = 'Project has not been updated'
    end
  end
end
~~~~

**20.**

~~~~
# spec/controllers/projects_controller.rb

describe 'update' do
  let(:project) { stub_model(Project) }

  before { Project.stub(:find) { project } }

  it 'finds a project' do
    Project.should_receive(:find) { project }
    put :update, id: project.id
  end

  it 'updates the project attributes' do
    project.should_receive(:update_attributes) { true }
    put :update, id: project.id
  end

  context 'update is successful' do
    before { project.stub(:update_attributes) { true } }

    it 'sets a flash message' do
      put :update, id: project.id
      flash[:notice].should eq('Project has been updated')
    end

    it 'redirects to the project\'s path' do
      put :update, id: project.id
      response.should redirect_to(project)
    end
  end

  context 'update is failed' do
    before { project.stub(:update_attributes) { false } }
    it 'sets a flash message' do
      put :update, id: project.id
      flash[:alert].should eq('Project has not been updated')
    end

    it 'renders an edit template' do
      put :update, id: project.id
      response.should render_template('edit')
    end
  end
end
~~~~

**21.**

~~~~
# app/controllers/projects_controller.rb

class ProjectsController < ApplicationController
  def update
    project = Project.find(params[:id])
    if project.update_attributes(params[:project])
      flash[:notice] = 'Project has been updated'
      redirect_to project_path(project)
    else
      flash[:alert] = 'Project has not been updated'
      render action: :edit
    end
  end
end
~~~~

**22.**

~~~~
describe 'update' do
  let(:project) { stub_model(Project) }

  before { Project.stub(:find) { project } }

  context 'before update' do
    it 'finds a project' do
      Project.should_receive(:find) { project }
      put :update, id: project.id
    end
  end

  context 'update is successful' do
    before { project.stub(:update_attributes) { true } }

    it 'sets a flash message' do
      put :update, id: project.id
      flash[:notice].should eq('Project has been updated')
    end

    it 'redirects to the project\'s path' do
      put :update, id: project.id
      response.should redirect_to(project)
    end
  end

  context 'update is failed' do
    before { project.stub(:update_attributes) { false } }

    it 'sets a flash message' do
      put :update, id: project.id
      flash[:alert].should eq('Project has not been updated')
    end

    it 'renders an edit template' do
      put :update, id: project.id
      response.should render_template('edit')
    end
  end
end
~~~~

**23.**

~~~~
# app/controllers/projects_controller.rb

class ProjectsController < ApplicationController
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = 'Project has been updated'
      redirect_to project_path(@project)
    else
      flash[:alert] = 'Project has not been updated'
      render action: :edit
    end
  end
end
~~~~

### Последовательность описания действия delete ###
{: id="Последовательность_описания_действия_delete" }

**1.**

~~~~
# spec/controllers/projects/controller_spec.rb

describe ProjectsController
  describe 'destroy' do
  end
end
~~~~

**2.**

~~~~
# spec/controllers/projects/controller_spec.rb

describe 'destroy' do
  it 'sets a flash message' do
  end
end
~~~~

**3.**

~~~~
# spec/controllers/projects/controller_spec.rb

describe 'destroy' do
  let(:project) { stub_model(Project) }

  it 'sets a flash message' do
    delete :destroy, id: project.id
    flash[:notice].should eq('Project has been deleted')
  end
end
~~~~

**4.**

~~~~
# app/controllers/projects_controller.rb

class ProjectsController < ApplicationController
  def destroy
  end
end
~~~~

**5.**

~~~~
# app/controllers/projects_controller.rb

class ProjectsController < ApplicationController
  def destroy
    flash[:notice] = 'Project has been deleted'
  end
end
~~~~

**6.**

~~~~
# spec/controllers/projects/controller_spec.rb

describe 'destroy' do
  let(:project) { stub_model(Project) }

  it 'sets a flash message' do
    delete :destroy, id: project.id
    flash[:notice].should eq('Project has been deleted')
  end

  it 'redirects to projects path' do
  end
end
~~~~

**7.**

~~~~
# spec/controllers/projects/controller_spec.rb

describe 'destroy' do
  let(:project) { stub_model(Project) }

  it 'sets a flash message' do
    delete :destroy, id: project.id
    flash[:notice].should eq('Project has been deleted')
  end

  it 'redirects to projects path' do
    delete :destroy, id: project.id
    response.should redirect_to(projects_path)
  end
end
~~~~

**8.**

~~~~
# app/controllers/projects_controller.rb

class ProjectsController < ApplicationController
  def destroy
    flash[:notice] = 'Project has been deleted'
    redirect_to projects_path
  end
end
~~~~

**9.**

~~~~
# spec/controllers/projects/controller_spec.rb

describe 'destroy' do
  let(:project) { stub_model(Project) }

  it 'sets a flash message' do
    delete :destroy, id: project.id
    flash[:notice].should eq('Project has been deleted')
  end

  it 'redirects to projects path' do
    delete :destroy, id: project.id
    response.should redirect_to(projects_path)
  end

  it 'deletes the project' do
  end
end
~~~~

**10.**

~~~~
# spec/controllers/projects/controller_spec.rb

describe 'destroy' do
  let(:project) { mock_model(Project) }

  it 'sets a flash message' do
    delete :destroy, id: project.id
    flash[:notice].should eq('Project has been deleted')
  end

  it 'redirects to projects path' do
    delete :destroy, id: project.id
    response.should redirect_to(projects_path)
  end

  it 'deletes the project' do
    project.should_receive(:destroy)
    delete :destroy, id: project.id
  end
end
~~~~

**11.**

~~~~
# app/controllers/projects_controller.rb

class ProjectsController < ApplicationController
  def destroy
    Project.find.destroy
    flash[:notice] = 'Project has been deleted'
    redirect_to projects_path
  end
end
~~~~

**12.**

~~~~
# app/controllers/projects_controller.rb

class ProjectsController < ApplicationController
  def destroy
    Project.find(project[:id]).destroy
    flash[:notice] = 'Project has been deleted'
    redirect_to projects_path
  end
end
~~~~

### Пример описания для контроллера приложения ###
{: id="Пример_описания_для_контроллера_приложения" }

~~~~
# spec/controllers/application_controller.rb

require 'spec_helper'

describe ApplicationController do
  controller do
    def index
      raise AccessDenied
    end
  end

  describe 'handling AccessDenied exceptions' do
    it 'redirects to the /401.html (access denied) page' do
      get :index
      response.should redirect_to('/401.html')
    end
  end
end
~~~~

В примере посредством метода `controller` создается некоторый контроллер,
представляющий любого потомка контроллера приложения. В созданном контроллере
определяется некоторое действие, вызывающее исключение. Далее в примере группы,
описывающего действие по обработке исключения, вызывается метод `get` с
действием созданного абстрактного контроллера и ожидается переход на страницу с
ошибкой.

~~~~
# spec/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from AccessDenied, with: :access_denied

  private
    def access_denied
      redirect_to '/401.html'
    end
end
~~~~

~~~~
# lib/access_denied.rb

class AccessDenied < StandardError
end
~~~~

## Описание rails-моделей ##
{: id="Описание_rails_моделей" }

### Описываемые элементы моделей ###
{: id="Описываемые_элементы_моделей" }

**Валидация**

~~~~
# spec/models/some_model_spec.rb

describe SomeModel do
  it 'is valid if all attributes are specified' do
    some_model.should be_valid
  end

  it 'is invalid if some_attribute aren\'t specified' do
    some_model.some_attribute = nil
    some_model.should have(1).error_on(:some_attribute)
    # or some_model.should_not be_valid
  end
end
~~~~

**Логика**

~~~~
# spec/models/some_model_spec.rb

describe SomeModel do
  describe 'some_method' do
    context 'happy path' do
      before(:each) { some_model.stub(:some_flag) { true } }

      it 'does all as it is expected to be'
    end

    context 'corner case' do
      before(:each) { some_model.stub(:some_flag) { false } }

      it 'doesn\'t do what it should do'
    end
  end
end
~~~~

### Пример описания c использованием метода `be_valid` ###
{: id="Пример_описания_c_использованием_метода_be_valid" }

~~~~
# spec/models/message_spec.rb

require 'spec_helper'

describe Message do
  let(:message) do
    Message.new(title: 'one',
                text: 'ok!',
                recipient: stub_model(User)
               )
  end

  it 'is valid with valid attributes' do
    message.should be_valid
  end

  it 'is not valid without a title' do
    message.title = nil
    message.should_not be_valid
  end

  it 'is not valid without text' do
    message.text = nil
    message.should_not be_valid
  end

  it 'is not valid without a recipient' do
    message.recipient = nil
    message.should_not be_valid
  end
end
~~~~

~~~~
# spec/models/message.rb

class Message < ActiveRecord::Base
  belongs_to :recipient,
             class_name: 'User'

  validates_presence_of :title,
                        :text,
                        :recipient
end
~~~~

~~~~
# spec/models/user.rb

class User < ActiveRecord::Base
end
~~~~

### Пример описания c использованием метода `error_on` ###
{: id="Пример_описания_c_использованием_метода_error_on" }

~~~~
# spec/models/message_spec.rb

describe Message do
  let(:message) do
    Message.new(title: 'one',
                text:  'ok!',
                recipient: stub_model(User)
               )
  end

  it 'is valid with valid attributes' do
    message.should be_valid
  end

  it 'is not valid without a title' do
    message.title = nil
    message.should have(1).error_on(:title)
  end

  it 'is not valid without text' do
    message.text = nil
    message.should have(1).error_on(:text)
  end

  it 'it not valid without a recipient' do
    message.recipient = nil
    message.should have(1).error_on(:recipient)
  end
end
~~~~

~~~~
# app/models/message.rb

class Message < ActiveRecord::Base
  belongs_to :recipient,
             class_name: 'User'

  validates_presence_of :title,
                        :text,
                        :recipient
end
~~~~

~~~~
# app/models/user.rb

class User < ActiveRecord::Base
end
~~~~

