---
title: RSpec
---

* [I. Элементы инфраструктуры RSpec](#I)

  + [1. Базовые элементы RSpec](#1)

  + [2. Элементы структуры спецификации](#2)

  + [3. Элементы примера использования субъекта](#3)

  + [4. Элементы инфраструктуры имитации RSpec](#4)

  + [5. Элементы вывода](#5)

* [II. Реализация элементов инфраструктуры RSpec](#II)

  + [6. Методы структуры спецификации](#6)

  + [7. Методы инфраструктуры имитации](#7)

  + [8. Методы форматирования](#8)

* [III. Использование элементов RSpec](#III)

  + [9. Гайд по использованию дублеров](#Гайд_по_использованию_дублеров)

  + [10. Типы примеров](#Типы_примеров)

  + [11. Способры группировки примеров](#Способы_группировки_примеров)

  + [12. Использование закрепленных методов](#Использование_закрепленных_методов)

  + [13. Использование вспомогательных методов](#Использование_вспомогательных_методов)

  + [14. Использование отложенных примеров](#Использование_отложенных_примеров)

  + [15. Создание общих примеров](#Создание_общих_примеров)

  + [16. Использование методов сравнения](#Использование_методов_сравнения)

  + [17. Имитация объектов и методов](#Имитация_объектов_и_методов)

* [IV. Командная строка](#IV)

  + [RSpec](#RSpec)

  + [Autotest](#Autotest)

  + [Rake](#Rake)

  + [Rcov](#Rcov)

* [V. Расширение RSpec](#V)

  + [Фильтры](#Фильтры)

  + [Макросы](#Макросы)

  + [Основные методы](#Основные_методы)

  + [Методы расширения](#Методы_расширения)

  + [Пользовательские методы сравнения](#Пользовательские_методы_сравнения)

  + [Примеры расширения и настройки](#Примеры_расширения_и_настройки)

# I. Элементы инфраструктуры RSpec #
{: id="I" }

## 1. Базовые элементы RSpec ##
{: id="1" }

**subject** (субъект)

: тестируемый объект.

**collaborator** (объект-соучастник)

: ещё не созданный вспомогательный объект.

**primary collaborator** (первичный соучастник)

: вспомогательный объект для тестируемого объекта.

**secondary collaborator** (вторичный соучастник)

: вспомогательный объект для вспомогательного объекта.

## 2. Элементы структуры спецификации ##
{: id="2" }

**example group** (группа примеров использования субъекта)

: группа, содержащая перечень примеров использования субъекта.

**shared examples group** (группа общих примеров использования субъекта)

: группа, содержащая перечень примеров, доступная для включения в другие группы примеров.

**code example** (пример использования)

: пример использования субъекта.

**description** (описание примера или группы примеров)

: строка, представляющая некоторый аспект работы системы, который мы хотим описать.

**passing example** (выполненный пример)

: пример не давший сбоя при запуске.

**failed example** (невыполненный пример)

: пример давший сбой при запуске.

**pending example** (отложенный пример)

: отложенный пример внесенный в группу примеров.

**helper** (вспомогательный метод)

: метод, позволяющий упростить пример использования и сделать его более читабельным.

**hook** (закрепленный метод)

: метод, запускаемый в некоторый ключевой момент прогона группы примеров.

## 3. Элементы примера использования субъекта ##
{: id="3" }

**expectation** (ожидаемый результат)

: некоторое описываемое в примере поведение, которое требуется иметь субъекту.

**matcher** (метод сравнения)

: метод, определяющий критерий сравнения и ожидаемый результат.

## 4. Элементы инфраструктуры имитации RSpec ##
{: id="4" }

### 4.1 Имитаторы объектов ###
{: id="4.1" }

**double** (дублер)

: объект, замещающий в примерe ещё не созданный вспомогательный объект.

**mock** (имитатор)

: дублер, имитирующий поведение вспомогательного объекта.

**stub** (заглушка)

: дублер, не осуществляющий имитацию поведения вспомогательного объекта.

**ordinary double** (обычный дублер)

: дублер, принимающий только определенные для него сообщения.

**double as null object** (null-дублер)

: дублер, принимающий все сообщения.

**extended object** (расширенный объект)

: объект, уже имеющийся в структуре программного интерфейса, но расширенный некоторыми методом.

### 4.2 Имитаторы методов ###
{: id="4.2" }

**double method** (метод-дублер)

: метод, отсутствующий в оригинальном объекте или объекте-дублере, который может быть вызван или обязателен для вызова.

**mock method** (метод-имитатор)

: метод-дублер, обязательный для вызова.

**stub method** (метод-заглушка)

: метод-дублер, необязательный для вызова.

**argument matcher** (метод сравнения аргументов)

: метод определяющий критерий для ожидаемого агрумента.

## 5. Элементы вывода ##
{: id="5" }

**formatter** (форматировщик)

: класс, форматирующий вывод результатов тестов.

# II. Реализация элементов инфраструктуры RSpec #
{: id="II" }

## 6. Методы структуры спецификации ##
{: id="6" }

### 6.1 Основные методы ###
{: id="6.1" }

**`describe`** --- определить группу примеров для некоторого субъекта.

**`let`** --- определить вспомогательный метод, запоминающий состояние между вызовами в разных примерах, но не в одном.

**`let!`** --- определить вспомогательный метод, запоминающий состояние между вызовами в разных примерах, но не в одном и вызывать его перед каждым примером.

**`its`** --- определить вложенную группу примеров, а затем сгенерировать пример на основе переданного блока.

**`subject`** --- определить субъект в теле группы примеров.

: **`subject`** --- возвратить субъект, определенный в группе примеров.

**`example`**, **`it`**, **`specify`** --- определить пример использования.

**`should`**, **`should_not`** --- определить ожидаемый результат.

### 6.2 Методы сравнения ###
{: id="6.2" }

**`expect to`** --- ожидать изменение.

**`expect not to`** --- ожидать постоянства.

**`expect to change`** --- ожидать изменение некоторого признака.

**`expect to rise_error`** --- ожидать вызов исключения.

**`expect to throw symbol`** --- ожидать выброса символа.

**`be_within of`** --- ожидать, что вещественное число находится в некотором допустимом промежутке.

**`have`** *(n)* **`items`**, **`have_exactly`** *(n)* **`items`** --- ожидать, что коллекция имеет ровно указанное количество элементов.

**`have_at_least`** *(n)* **`items`** --- ожидать, что коллекция имеет как минимум указанное количество элементов.

**`have_at_most`** *(n)* **`itmes`** --- ожидать, что коллекция имеет максимум указанное количество элементов.

### 6.3 Закрепленные методы ###
{: id="6.3" }

**`before all`** --- запустить переданный блок перед запуском группы примеров.

**`before each`** --- запустить переданный блок перед запуском каждого примера.

**`after all`** --- запустить переданный блок после запуска группы примеров.

**`after each`** --- запустить переданный блок после запуска каждого примера.

**`around each`** --- запустить начальную часть переданного блока перед запуском каждого примера, а конечную --- после его запуска.

### 6.4 Методы создания общих примеров ###
{: id="6.4" }

**`shared_examples_for`** --- создать группу общих примеров.

**`it_behaves_like`** --- встроить группу общих примеров в текущую группу.

## 7. Методы инфраструктуры имитации ##
{: id="7" }

### 7.1 Методы создания объектов-дублеров ###
{: id="7.1" }

**`double`**, **`mock`**, **`stub`** --- создать объект-дублер.

**`double as_null_object`** --- создать объект-дублер, способный принимать как определенные, так и неопределенные сообщения.

### 7.2 Методы-дублеры ###
{: id="7.2" }

**`stub`** --- создать метод-заглушку.

**`stub_chain`** --- создать цепь методов-заглушек.

**`should_receive`** --- создать метод-имитатор.

**`should_not_receive`**  --- создать негативный метод-имитатор.

### 7.3 Методы-модификаторы ###
{: id="7.3" }

**`never`**

**`once`**

**`twice`**

**`exactly`**(*n*)**`times`**

**`at_least`**(*n*)**`times`**

**`at_most`**(*n*)**`times`**

**`and_return`**

**`and_raise`**

**`and_throw`**

### 7.4 Методы сравнения аргументов ###
{: id="7.4" }

**`instance_of`**

**`anything`**

**`any_args`**

**`no_args`**

**`hash_including`**

**`hash_not_including`**

**`//`** (регулярное выражение)

*пользовательский_метод_сравнения*

## 8. Методы форматирования ##
{: id="8" }

**`output`** --- возвратить объект ввода-вывода.

# III. Использование RSpec #
{: id="III" }

## 9. Гайд по использованию дублеров ##
{: id="Гайд_по_использованию_дублеров" }

**Изолируйте примеры от тяжелых зависимостей**

Определяемые объекты в большинстве случаев зависят от других объектов. Некоторые из них имеют простую структуру и их легко создавать, однако, бывает, что объекты-зависимости сложны, взаимодействуют с сетевыми ресурсами или с БД или осуществляют прочие операции, требующие *значительных временных ресурсов*. Подобные объекты следует заменять дублерами.

**Изолируйте примеры от неопределенностей**

Объекты-зависимости могут в своей работе взаимодействовать с внешними системами, имеющими *непредсказуемые характеристики или состояния*. К ним относятся файлы, содержимое которых не всегда определено, сеть и сетевые ресурсы, которые в некоторый момент могут быть недоступны и прочие схожие объекты. Кроме того, работа определяемого объекта может зависеть от генератора случайных чисел, вывод которого также непостоянен. Во всех подобных случаях следует заменять объекты-зависимости дублерами.

**Заменяйте ещё не созданные объекты-зависимости дублерами**

В процессе определения некоторого объекта может оказаться, что он зависит от ещё не созданного объекта. Дублеры, в этом случае, во-первых, помогут избежать необходимости реализации этой зависимости и, во-вторых, будут способствовать более точному определению интерфейса будущего объекта.

**Исследуйте интерфейс будущей зависимости**

Одной из основных ценностей объекта-дублера является возможность более точного определения интерфейса будущего объекта-зависимости, либо уточнения этого интерфейса в уже созданном .

**Фокусируйтесь на ролях, думая о дублере не как об объекте, а как об интерфейсе**

При создании дублеров, следует сконцентрироваться на той роли, которую они будут выполнять. Т. е. дублер, сам по себе, не является воплощением некоторого отдельно взятого будущего объекта, а репрезентует требуемый интерфейс, который в дальнейшем может быть присущ нескольким созданным объектам. А это значить, что все эти объекты смогут выполнить ту роль, которая была определена настоящим объектом-дублером.

**Фокусируйтесь в примерах на взаимодействии между объектами, а не на их структуре**

Объектно-ориентированные системы основаны на интерфейсах и взаимодействиях. Структура объекта и детали его реализации не являются частью наблюдаемого поведения этого объекта. Исключение из спецификаций ссылок на внутреннее устройство объектов, делает эти спецификации более гибкими и устойчивыми к изменениям структуры того или иного объекта. Когда мы при создании дублеров фокусируемся на структуре, мы описываем объекты, когда же мы концентрируемся на взаимодействиях, мы создаем интерфейсы.

**Избегайте излишней детализации**

Функция дублеров --- упрощение настройки контекста для примера. Если дублеров много, то настройка превращается в долгий и путанный процесс, а это признак того, что пришло время пересмотреть дизайн приложения.

**По возможности, избегайте использования методов-дублеров, возвращающих объекты-дублеры**

Если дублеры имеют методы, возвращающие некоторые значения, то значения эти, в большинстве случаев, должны быть настолько просты, насколько это возможно, то есть, представлять из себя обычные языковые примитивы. Необходимость создания дублеров, возвращающих другие дублеры явный признак изъяна в дизайне. Если определяемый объект сложно использовать в примере, его будет сложно использовать и в других местах.

**Используйте высокоуровневые автоматизированные тесты**

Комплект автоматизированных высокоуровневых тестов гарантирует, что примеры, имитирующие некоторый программный интерфейс, не останутся незамеченными, после его создания или изменения.

**Не создавайте хрупких примеров**

При сложности в настройке, установке объектов-дублеров, при наличии большого их количества, примеры использования объекта становятся хрупкими. Это явный признак сильных связей между объектами, что является недостатком дизайна. Чем проще объект дублер, тем проще будут впоследствии созданные объекты.

## 10. Типы примеров ##
{: id="Типы_примеров" }

**Основанные на описании конечного состояния** *(State-based)*

Пример, в котором описывается конечное состояние некоторого объекта после проведения с ним определенных манипуляций.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
object.should have(some_state)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    describe One do
      it 'returns ok!' do
        one = One.new
        result = one.do_something
        result.should eql('ok!')
      end
    end

**Основанные на описании поведения** *(Interaction-based)*

Пример, в котором описывается поведение некоторого объекта в определенных условиях.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
object.should_receive(some_message)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    describe One do
      it 'gets do_something' do
        two = double('Two')
        two.should_receive(:do_something)
        One.new(two)
      end
    end

## 11. Способы группировки примеров ##
{: id="Способы_группировки_примеров" }

### Группировка на основе начального состояния ###
{: id="Группировка_на_основе_начального_состояния" }

~~~
     1	describe Array do
     2	  context 'when empty' do
     3	  end
     4	
     5	  context 'when full' do
     6	  end
     7	end
~~~

### Группировка на основе методов ###
{: id="Группировка_на_основе_методов" }

~~~
     1	describe Array do
     2	  describe '#pop' do
     3	  end
     4	
     5	  describe '#push' do
     6	  end
     7	end
~~~

### Группировка на основе субъекта ###
{: id="Группировка_на_основе_субъекта" }

~~~
describe Subject do
  context 'class' do
    subject { Subject }
  end

  context 'instance' do
    subject { Subject.new }
  end
end
~~~

### Комбинированная группировка ###
{: id="Комбинированная_группировка" }

~~~
describe Subject do
  it { should do_one } # default context

  context 'class' do
    subject { Subject }

    it { should do_two }
  end

  context 'some_state' do
    # let!(:some_state) { subject.set_some_state }
    before { subject.set_some_state }

    it { should be_in_some_state }
  end
end
~~~

### Создание вложенной группы с автоматически сгенерированными примерами ###
{: id="Создание_вложенной_группы_с_автоматически_сгенерированными_примерами" }

~~~
describe [1, 2, 3, 4] do
  its(:size)  { should == 4 }
  its(:first) { should == 1 }
  its(:last)  { should == 4 }
end
~~~

## 12. Использование закрепленных методов ##
{: id="Использование_закрепленных_методов" }

`around`

~~~
     1	describe 'some code' do
     2	  around(:each) do |example|
     3	    puts 'before'
     4	    example.run
     5	    puts 'after'
     6	  end
     7	
     8	  it 'does one' do
     9	    puts 'one'
    10	  end
    11	
    12	  it 'does two' do
    13	    puts 'two'
    14	  end
    15	
    16	  it 'does three' do
    17	    puts 'three'
    18	  end
    19	end
~~~

## 13. Использование вспомогательных методов ##
{: id="Использование_вспомогательных_методов" }

Вспомогательные методы помогают очистить примеры от повторяющегося кода.

**`let`, `let!`**[^1]

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$count = 0

describe "let" do
  let(:count) { $count += 1 }

  it "memoizes the value" do
    count.should == 1
    count.should == 1
  end

  it "is not cached across examples" do
    count.should == 2
  end
end
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$count = 0

describe "let!" do
  invocation_order = []

  let!(:count) do
    invocation_order << :let!
    $count += 1
  end

  it "calls the helper method in a before hook" do
    invocation_order << :example
    invocation_order.should == [:let!, :example]
    count.should == 1
  end
end
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Метод `let!` позволяет объединить вызовы метода `let` и `before`.

*до рефакторинга*

~~~~~~~~~~~~~~~~~~~~~~~~~~~
let(:messsage) do
  mock_model('Message')
    .as_new_record
    .as_null_object
end

before(:each) do
  assign(:message, message)
end
~~~~~~~~~~~~~~~~~~~~~~~~~~~

*после рефакторинга*

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let!(:message) do
  message = mock_model('Message')
    .as_new_record
    .as_null_object
  assign(:message, message)
  message
end
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Пользовательские вспомогательные методы**

Вспомогательный метод может быть определен либо в теле группы примеров,

~~~
     1	describe Thing do
     2	  def create_thing(status)
     3	    thing = Thing.new
     4	    thing.set_status(status)
     5	    yield thing
     6	  end
     7	
     8	  context 'when ok' do
     9	    it 'returns \'ok!\'' do
    10	      create_thing('ok') do |thing|
    11	        thing.one.should eql('ok!')
    12	      end
    13	    end
    14	  end
    15	
    16	  context 'when fail' do
    17	    it 'returns \'fail!\'' do
    18	      create_thing('fail') do |thing|
    19	        thing.one.should eql('fail!')
    20	      end
    21	    end
    22	  end
    23	end
~~~

либо в отдельном модуле:

~~~
     1	module UserHelpers
     2	  def create_thing(status)
     3	    thing = Thing.new
     4	    thing.set_status(status)
     5	    yield thing
     6	  end
     7	end
     8	
     9	describe Thing do
    10	  include UserHelpers
    11	
    12	  context 'when ok' do
    13	    it 'returns \'ok!\'' do
    14	      create_thing('ok') do |thing|
    15	        thing.one.should eql('ok!')
    16	      end
    17	    end
    18	  end
    19	
    20	  context 'when fail' do
    21	    it 'returns \'fail!\'' do
    22	      create_thing('fail') do |thing|
    23	        thing.one.should eql('fail!')
    24	      end
    25	    end
    26	  end
    27	end
~~~

В последнем случае потребуется включение указанного модуля в тело группы примеров.

Если необходимо включить вспомогательные методы некоторого модуля сразу во все группы примеров, то необходимо использовать метод `configure` класса `RSpec`.

~~~
     1	RSpec.configure do |config|
     2	  config.include(UserHelpers)
     3	end
~~~

## 14. Использование отложенных примеров ##
{: id="Использование_отложенных_примеров" }

В БДД есть методика, заключающаяся в содержании списка тестов, которые только предстоит написать для некоторого объекта, и, по мере прохождения этих тестов, вычеркивать их из списка. Добавление же новых тестов в список нужно осуществлять по мере их появления.

RSpec поддерживает данную методику и позволяет откладывать непройденные тесты. Для этого нужно определить пример и не передовать ему блок:

~~~
     1	describe 'some code' do
     2	  it 'does one'
     3	  it 'does two'
     4	  it 'does three'
     5	  it 'does four'
     6	end
~~~

Данный пример будет иметь следующий вывод:

~~~
some code
  does one (PENDING: Not Yet Implemented)
  does two (PENDING: Not Yet Implemented)
  does three (PENDING: Not Yet Implemented)
  does four (PENDING: Not Yet Implemented)

Pending:
  some code does one
    # Not Yet Implemented
    # ./example_spec.rb:2
  some code does two
    # Not Yet Implemented
    # ./example_spec.rb:3
  some code does three
    # Not Yet Implemented
    # ./example_spec.rb:4
  some code does four
    # Not Yet Implemented
    # ./example_spec.rb:5

Finished in 0.00049 seconds
4 examples, 0 failures, 4 pending
~~~

В процессе работы над приложением может понадобиться внести изменения в код при наличии непройденного теста. Для осуществления этого нужно пометить непройденный тест как отложенный, используя метод `pending`, изменить код приложения и в завершении снять маркер с отложенного теста.

Например:

~~~
     1	describe 'some code' do
     2	  it 'does one' do
     3	    pending 'to the future'
     4	    'one'.should eql('one')
     5	  end
     6	end
~~~

Данный пример будет иметь следующий вывод:

~~~
some code
  does one (PENDING: to the future)

Pending:
  some code does one
    # to the future
    # ./example_spec.rb:2

Finished in 0.00069 seconds
1 example, 0 failures, 1 pending
~~~

Третьим способом создания отложенного примера является вызов метода `pending` с переданным блоком. Этот способ используется для отладки программы.

Например:

~~~
     1	describe 'some code' do
     2	  it 'does one' do
     3	    pending('bug 1') do
     4	      'one'.should eql('one')
     5	    end
     6	  end
     7	end
~~~

Вывод в данном примере будет зависеть от того, соответствует ли ожидаемый результат имеющeмуся или нет. В первом случае будет вызвано исключение:

~~~
some code
  does one (FAILED - 1)

Failures:

  1) some code does one FIXED
     Expected pending 'to the future' to fail. No Error was raised.
     # ./example_spec.rb:3:in `block (2 levels) in <top (required)>'

Finished in 0.0007 seconds
1 example, 1 failure
~~~

Во-втором случае пример будет считаться отложенным:

~~~
some code
  does one (PENDING: to the future)

Pending:
  some code does one
    # to the future
    # ./example_spec.rb:2

Finished in 0.00073 seconds
1 example, 0 failures, 1 pending
~~~

## Создание общих примеров ##
{: id="Создание_общих_примеров" }

**`shared_examples_for(<имя>, &<блок>)`** --- установить общий пример.

~~~
     1	shared_examples_for 'any pizza' do
     2	  it 'tastes really good' do
     3	    @pizza.should taste_really_good
     4	  end
     5	
     6	  it 'is available by the slice' do
     7	    @pizza.should be_available_by_the_slice
     8	  end
     9	end
~~~

**`it_behaves_like(<имя_общего_примера>)`** --- включить общий пример в группу.

~~~
    10	
    11	describe 'New York style thin crust pizza' do
    12	  before(:each) do
    13	    @pizza = Pizza.new(:region => 'New York',
    14	                       :style  => 'thin crust')
    15	  end
    16	
    17	  it_behaves_like 'any pizza'
    18	
    19	  it 'has a really great sauce' do
    20	    @pizza.should have_a_really_great_sauce
    21	  end
    22	end
    23	
    24	describe 'Chicago style stuffed pizza' do
    25	  before(:each) do
    26	    @pizza = Pizza.new(:region => 'Chicago', :style => 'stuffed')
    27	  end
    28	
    29	  it_behaves_like 'any pizza'
    30	
    31	  it 'has a ton of cheese' do
    32	    @pizza.should have_a_ton_of_cheese
    33	  end
    34	end
~~~

## 16. Использование методов сравнения ##
{: id="Использование_методов_сравнения" }

**`expect to change`** --- сравнить изменения объекта.

~~~
     1	# encoding: utf-8
     2	
     3	describe 'number' do
     4	  describe '#succ' do
     5	    it 'increases a number by 1' do
     6	      n = 1
     7	      expect {
     8	        n = n.succ
     9	      }.to change { n }.by(1)
    10	    end
    11	
    12	    it 'increases a number to 2' do
    13	      n = 1
    14	      expect {
    15	        n = n.succ
    16	      }.to change { n }.to(2)
    17	    end
    18	
    19	    it 'increases a number from 1 to 2' do
    20	      n = 1
    21	      expect {
    22	        n = n.succ
    23	      }.to change { n }.from(1).to(2)
    24	    end
    25	  end
    26	end
~~~

**`expect to raise_error`** --- проверить вызов исключения.

~~~
     1	# encoding: utf-8
     2	
     3	describe 'a number' do
     4	  describe '#/ (divide)' do
     5	    it 'raises ZeroDivisionError' do
     6	      expect {
     7	        1/0
     8	      }.to raise_error(ZeroDivisionError)
     9	    end
    10	  end
    11	end
~~~

**`expect to throw_symbol`** --- проверить выброс символа.

~~~
     1	# encoding: utf-8
     2	
     3	describe 'a course' do
     4	  context 'when full' do
     5	    it 'doesn\'t allow students to register' do
     6	      course = Course.new(:seats => 20)
     7	      20.times { course.register Student.new }
     8	      expect {
     9	        course.register Student.new
    10	      }.to throw_symbol(:course_full)
    11	    end
    12	  end
    13	end
~~~

**`be_within of`** --- проверить, что вещественное число находится в некотором допустимом промежутке.

~~~
     1	# encoding: utf-8
     2	
     3	describe 'a floating point number' do
     4	  it 'is in an acceptable delta' do
     5	    f = 1.251
     6	    f.should be_within(0.005).of(1.25)
     7	  end
     8	end
~~~

## 17. Имитация объектов и методов ##
{: id="Имитация_объектов_и_методов" }

### Создание объектов-дублеров ###
{: id="Создание объектов-дублеров" }

**`double`**, **`mock`**, **`stub`**

~~~
# encoding: utf-8

describe 'Person' do
  describe '#name' do
    it 'returns the person\'s name' do
      person = double('person', :name => 'Pavel')
      person.name.should eql('Pavel')
    end
  end
end
~~~

### Использование методов-дублеров ###
{: id="Использование_методов-дублеров" }

**`stub`**, **`stub with`**, **`stub and_return`**

~~~
# encoding: utf-8

describe 'Person' do
  before(:each) do
    @person = double('person')
    @person.stub(:age_for) do |what|
      case what
      when 'drinking' then 21
      when 'voting'   then 18
      end
    end
  end

  it 'is in appropriate age for drinking' do
    @person.age_for('drinking').should eql(21)
  end

  it 'is in appropriate age for voting' do
    @person.age_for('voting').should eql(18)
  end
end
~~~

**`should_not_receive`**

~~~
# encoding: utf-8

class Statement
  def initialize(customer, show_name)
    @customer  = customer
    @show_name = show_name
  end

  def generate
    @customer.name if @show_name
  end
end

describe Statement do
  it 'doesn\'t get a customer\'s name' do
    customer  = double('customer')
    statement = Statement.new(customer, false)
    customer.should_not_receive(:name)
    statement.generate
  end

  it 'gets a customer\'s name' do
    customer  = double('customer')
    statement = Statement.new(customer, true)
    customer.should_receive(:name)
    statement.generate
  end
end
~~~

**`stub_chain and_return`**

~~~
# encoding: utf-8

class Statement
  def initialize(customer)
    @customer = customer
  end

  def generate
    "Statement for #{@customer.first_name.last_name}"
  end
end

describe Statement do
  it 'uses customer\'s first name and his last name in the header' do
    customer = double('customer')
    customer.stub_chain(:first_name, :last_name).and_return('Pavel Alekhin')
    statement = Statement.new(customer)
    statement.generate.should =~ /^Statement for Pavel Alekhin/
  end
end
~~~

### Использование пользовательского метода сравнения аргумента ###
{: id="Использование_пользовательского_метода_сравнения_аргумента" }

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
module GreaterThenMatcher
  class Matcher
    def initialize(expected)
      @expected = expected
    end

    def description
      "a number greather then #{@expected}"
    end

    def ==(actual)
      actual > @expected
    end
  end

  def a_number_greater_then_three
    Matcher.new(3)
  end
end

class Person
  def use(device)
    device.add 4
  end
end

RSpec.configure do |config|
 config.include(GreaterThenMatcher, include: 'greater then matcher')
end

describe Person, include: 'greater then matcher' do
  it 'uses calculator' do
    calculator = mock('calculator')
    person     = Person.new

    calculator.should_receive(:add).with(a_number_greater_then_three)
    person.use(calculator)
  end
end
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Взаимодействие субъекта и объекта соучастника ###
{: id="Взаимодействие_субъекта_и_боъекта_соучастника" }

~~~
# encoding: utf-8

describe Subject do
  it 'will be true if collaborator is true' do
    collaborator = double('collaborator')
    subject = Subject.new(collaborator)

    collaborator.should_receive(:some_method).and_return(true)
    subject.some_another_method.should be_true
  end
end
~~~

# IV. Командная строка #
{: id="IV" }

## RSpec ##
{: id="RSpec" }

### Команды вызова ###
{: id="Команды_вызова" }

**`rspec`** *имя*\_spec.rb --- запустить спецификацию в указанном файле.

**`rspec`** *имя\_директории* --- запустить спецификацию во всех файлах в указанной директории и во всех поддиректориях.

**`rspec`** **`-r`** *./файл_с_пользовательским_форматировщиком*.rb **`-f`** *КлассФорматировщика* *имя*\_spec.rb --- запустить спецификацию в указанном файле, применив пользовательское форматирование вывода.

~~~
$ rspec -r ./custom_formatter.rb -f CustomFormatter example_spec.rb
~~~

### Опции командной строки ###
{: id="Опции_командной_строки" }

**`--format`**, **`-f`** -- форматировать вывод определенным образом.

: **`documentation`**, **`d`** --- в формате документации.

:  **`html`**, **`h`** --- в формате html.

**`--output`** *имя\_файла*, **`-o`** *имя\_файла* ---пернаправить вывод в файл.

### Файлы конфигурации ###
{: id="Файлы_конфигурации" }

`~/.rspec` --- файл конфигурации для текущего пользователя.

`./.rspec` --- файл конфигурации для текущего проекта.

### Приоритет файлов конфигурации ###
{: id="Приоритет_файлов_конфигурации" }

опции командной строки → файл проекта → файл пользователя

### Использование RSpec в командной строке ###
{: id="Использование_RSpec_в_командной_строке" }

*Перенаправить вывод различного формата в разные файлы.*

~~~
$ rspec spec/ -fp \
              -fd -o documentation.txt \
              -fh -o hypertext.html
~~~

## Autotest ##
{: id="Autotest" }

### Джемы ###
{: id="Джемы" }

**`ZenTest`** --- комплект утилит для облегчения тестирования.

**`autotest-rails`** --- autotest-плагин для Rails.

### Перечень утилит пакета ZenTest ###
{: id="Перечень_утилит_пакета_ZenTest" }

**zentest**

**unit_diff**

**autotest**

**multiruby**

### Команда вызова ###
{: id="Команды_вызова" }

**`autotest`** --- запустить утилиту autotest.

### Опции командной строки ###
{: id="Опции_командной_строки" }

**`--quiet`**, **`-q`** --- не выводить сообщения о выполняемых командах.

### Файлы конфигурации ###
{: id="Файлы_конфигурации" }

`./.autotest` --- файл конфигурации плагинов для текущего проекта.

`~/.autotest` --- файл конфигурации плагинов для текущего пользователя.

### Настройка ###
{: id="Настройка" }

### Использование Autotest ###
{: id="Использование_Autotest" }

*Запустить autotest, урезав вывод сообщений о запускаемых командах.*

~~~
$ autotest -q
~~~

## Rake ##
{: id="Rake" }

### Команда вызова ###
{: id="Команда_вызова" }

**`rake spec`** --- запустить все спецификации для текущего проекта.

### Файл конфигурации ###
{: id="Файл_конфигурации" }

`./Rakefile` --- файл конфигурации для текущего проекта.

### Настройка ###
{: id="Настройка" }

*Настроить запуск всех спецификаций для текущего проекта.*

~~~
# ./Rakefile

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new #=> spec task by default
~~~

*Настроить запуск всех спецификаций с передачей опций командной строки.*

~~~
# ./Rakefile

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ['--color', '--format documentation']
end
~~~

*Настроить запуск спецификаций в некоторой директории отдельной командой.*

~~~
# ./Rakefile

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new #=> run all the specs

RSpec::Core::RakeTask.new('spec:simple_string') do |t| #=> run specs in 'spec/simple_string/'
  t.pattern = 'spec/simple_string/**/*_spec.rb'
end

RSpec::Core::RakeTask.new('spec:simple_math') do |t| #=> run spes in 'spec/simple_math/'
  t.pattern = 'spec/simple_math/**/*_spec.rb'
end
~~~

*Настроить запуск спецификаций в некоторой директории отдельной командой, определив rake-задачи в пространстве имен.*

~~~
require 'rspec/core/rake_task'

namespace :spec do

  desc 'run all specs'
  RSpec::Core::RakeTask.new

  desc 'run the simple_string specs'
  RSpec::Core::RakeTask.new(:simple_string) do |t|
    t.pattern = 'spec/example/simple_string/**/*_spec.rb'
  end

  desc 'run the simple_math specs'
  RSpec::Core::RakeTask.new(:simple_math) do |t|
    t.pattern = 'spec/example/simple_math/**/*_spec.rb'
  end
end
~~~

Полный перечень настроечных опций содержится в документации[^2].

## Rcov ##
{: id="Rcov" }

### Команды вызова ###
{: id="Rcov-Команды_вызова" }

**`rcov --help`** --- просмотреть список опций.

### Джемы ###
{: id="Rcov-Джемы" }

**`rcov`** --- утилита измерения покрытия кода тестами.

**`rcov_rails`** --- плагин Rcov для Rails.

### Файлы конфигурации ###
{: id="Rcov-Файлы_конфигурации" }

`./Rakefile` --- файл конфигурации для текущего проекта.

### Настройка ###
{: id="Rcov-Настройка" }

*Настроить запуск спецификаций с выводом, включающим отчет Rcov.

~~~
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new # run all the specs

RSpec::Core::RakeTask.new('spec:rcov') do |t| # run all the specs and include the rcov report
  t.rcov      = true
  t.rcov_opts = [
                 '--text-report',   # output the report to sdtout
                 '--no-html',       # do not create the coverage directory with the html report
                 '--exclude spec\/' # exclude specs from the report
                ]
end
~~~

# V. Расширение RSpec #
{: id="V" }

## Фильтры ##
{: id="Фильтры" }

**inclusion filter** (включающий фильтр)

: фильтр, для примеров соответствующих условию.

**exclusion filter** (исключающий фильтр)

: фильтр, для примеров не соответствующих условию.

**if filter** (if-фильтр)

: фильтр, доступный по умолчанию, для примеров соответствующих условию.

**unless filter** (unless-фильтр)

: фильтр, доступный по умолчанию, для примеров не соответствующих условию.

## Макросы ##
{: id="Макросы" }

**macros** (макрокоманда)

: символьное имя, заменяемое при запуске спецификаций на заранее определенную последовательность команд.

## Основные методы ##
{: id="Основные_методы" }

**`example`** --- возвращает `RSpec::Core::Example`

**`metadata`** --- возвращает `RSpec::Core::Metadata`

**`configure`** --- передает блоку `RSpec::Core::Configuration`

**`filter`**  --- создать включающий фильтр.

**`exclusion_filter`** --- создать исключающий фильтр.

## Методы расширения ##
{: id="Методы_расширения" }

**`extend`** --- включить все методы некоторого модуля в класс RSpec::Core::ExampleGroup и таким образом сделать их доступными в блоке метода `describe`.

**`include`** --- включить все методы некоторого модуля в экземпляр класса RSpec::Core::ExampleGroup и таким образом сделать их доступными в блоке метода `it`.

###Закрепленные методы###

**`before`** --- закрепить некоторое действие за определенными или всеми группами и выполнить его перед каждым комплектом, группой или отдельным примером.

**`after`** --- закрепить некоторое действие за определенными или всеми группами и выполнить его после каждого комплекта, группы или отдельного примера.

**`around`** --- закрепить некоторое действие за определенными или всеми группами и выполнить его перед и после отдельного примера.

## Пользовательские методы сравнения ##
{: id="Пользовательские_методы_сравнения" }

**`define`** (**`matcher`**) --- определить пользовательский метод сравнения.

**`match`** (**`match_for_should`**) --- определить условие для пользовательского метода сравнения. Если метод сравнения, установленный подобным образом, возвратит `true`, то пример, использующий метод `should` будет считаться пройденным, а пример с методом `should_not` не будет пройден.

**`match_for_should_not`** --- определить условие для пользовательского метода сравнения. Если метод сравнения, установленный подобным образом, возвратит `true`, то пример, использующий метод `should` будет считаться непройденным, а пример с методом `should_not` будет пройден.

**`chain`** --- создать присоединенный метод сравнения.

**`description`** --- определить пользовательское описание для примера.

**`failure_message_for_should`** --- определить пользовательское сообщение об ошибкe для метода `should`.

**`failure_message_for_should_not`** --- определить пользовательское сообщение об ошибке для метода `should_not`.

### Протокол методов сравнения ###
{: id="Пользовательские_методы_сравнения-Протокол_методов_сравнения" }

**`matches?`** --- определить условие для пользовательского метода сравнения. Если метод сравнения, установленный подобным образом, возвратит `true`, то пример, использующий метод `should` будет считаться пройденным, а пример с методом `should_not` не будет пройден.

**`does_not_match?`** --- определить условие для пользовательского метода сравнения. Если метод сравнения, установленный подобным образом, возвратит `true`, то пример, использующий метод `should` будет считаться непройденным, а пример с методом `should_not` будет пройден.

**`description`** --- определить пользовательское описание для примера.

**`failure_message_for_should`** --- определить пользовательское сообщение об ошибкe для метода `should`.

**`failure_message_for_should_not`** --- определить пользовательское сообщение об ошибке для метода `should_not`.

## Примеры расширения и настройки ##
{: id="Примеры_расширения_и_настройки" }

### Настройка ###
{: id="Примеры_расширения_и_настройки-Настройка" }

*Запустить метод конфигурации.*

~~~
RSpec.configure { |config| }
~~~

*Настроить цветной вывод.*

~~~
RSpec.configure { |config| config.color_enabled = true }
~~~

*Настроить цветной вывод не только в консоль, но и в канал, и файл.*

~~~
RSpec.configure { |config| config.tty = true }
~~~

*Настроить форматировщик.*

~~~
RSpec.configure { |config| config.formatter = :documentation } # :progress, :html, :textmate
~~~

*Передать метаданные основным методам.*

~~~
describe 'some code', one: 1  do
  it 'does something', two: 2 do
    puts example.metadata[:one], #=> 1
         example.metadata[:two]  #=> 2
  end
end
~~~

### Фильтрация ###
{: id="Примеры_расширения_и_настройки-Фильтрация" }

*Установить включающий фильтр.*

~~~
RSpec.configure do |config|
  config.filter = {focus: true}
end

describe 'some code' do
  it 'does one' do
  end

  it 'does two', focus: true do
  end
end

describe 'some another code', focus: true do
  it 'does three' do
  end

  it 'does four' do
  end
end
~~~

*Установить исключающий фильтр.*

~~~
RSpec.configure do |config|
  config.exclusion_filter = {slow: true}
end

describe 'some code' do
  it 'does one' do
  end

  it 'does two', slow: true do
  end
end

describe 'some another code', slow: true do
  it 'does three' do
  end

  it 'does four' do
  end
end
~~~

*Установить включающий фильтр, доступный по умолчанию.*

~~~
describe 'some code' do
  it 'does one', if: true do
  end

  it 'does two' do
  end
end

describe 'some another code', if: true do
  it 'does three' do
  end

  it 'does four' do
  end
end
~~~

*Установить исключающий фильтр, доступный по умолчанию.*

~~~
describe 'some code' do
  it 'does one', unless: false do
  end

  it 'does two' do
  end
end

describe 'some another code', unless: false do
  it 'does three' do
  end

  it 'does four' do
  end
end
~~~

*Установить исключающий фильтр и передать ему объект Proc в качестве значения.*

~~~
RSpec.configure do |config|
  config.exclusion_filter = {
    condition: ->(meta) do
      if meta == :network_dependent
        !true # or false depending on the network condition
      end
    end # if the lambda returns true
        # then the appropriate example is excluded
  }
end

describe 'some network dependent code' do
   it 'does one', condition: :network_dependent do # works if network
                                                   # is available
   end

   it 'does two' do # always works
   end
end
~~~

### Закрепленные методы ###
{: id="Примеры_расширения_и_настройки-Закрепленные_методы" }

*Установить закрепленные методы, выполняемые до, до и после, и после комплекта, группы или отдельного примера.*

~~~
RSpec.configure do |config|
  config.before(:suite, mark: true) do # or before :all, or before :each
    puts 'before'
  end

  config.around(:each, mark: true) do |example| # and only each
    print '{ '
    example.run
    print " }\n"
  end

  config.after(:suite, mark: true) do # or after :all, or after :each
    puts 'after'
  end
end
~~~

### Пользовательские методы сравнения ###
{: id="Примеры_расширения_и_настройки-Пользовательские_методы_сравнения" }

*Установить пользовательский метод сравнения.*

~~~
RSpec::Matchers.define :be_a_multiple_of do |expected|
  match do |actual|
    actual.modulo(expected).zero?
  end
end

describe 9 do
  it { should be_a_multiple_of(3) }
  it { should_not be_a_multiple_of(4) }
end
~~~

*Установить пользовательский метод сравнения и перезаписать сообщения об ошибках для методов `should` и `should_not`.*

~~~
RSpec::Matchers.define :be_a_multiple_of do |expected|
  match do |actual|
    actual.modulo(expected).zero?
  end

  failure_message_for_should do |actual|
    "expected that #{actual} would be a multiple of #{expected}"
  end

  failure_message_for_should_not do |actual|
    "expected that #{actual} would not be a multiple of #{expected}"
  end
end

describe 9 do
  it { should_not be_a_multiple_of(3) }
  it { should be_a_multiple_of(4) }
end
~~~

*Установить пользовательское описание для примера.*

~~~
RSpec::Matchers.define :be_a_multiple_of do |expected|
  match do |actual|
    actual.modulo(expected).zero?
  end

  description do
    "be divisible to #{expected} without a remainder"
  end
end

describe 9 do
  it { should be_a_multiple_of(3) }
  it { should_not be_a_multiple_of(4) }
end
~~~

*Создать пользовательский метод сравнения, не предполагающий наличия аргументов.*

~~~
RSpec::Matchers.define :have_two_elements do
  match do |actual|
    actual.length.eql?(2)
  end
end

describe [1, 2] do
  it { should have_two_elements }
end
~~~

*Создать пользовательский метод сравнения, предполагающий наличие нескольких аргументов.*

~~~
RSpec::Matchers.define :be_the_sum_of do |*expected|
  match do |actual|
    actual.eql? expected.inject(:+)
  end
end

describe 10 do
  it { should be_the_sum_of(1, 2, 3, 4) }
end
~~~

*Создать пользовательский метод сравнения с использованием вспомогательного метода.*

~~~
RSpec::Matchers.define :have_the_same_elements_as do |expected|
  def similar?(a, b)
    a.sort.eql?(b.sort)
  end

  match do |actual|
    similar? actual, expected
  end
end

describe [1, 2, 3] do
  it { should have_the_same_elements_as([3, 2, 1]) }
end
~~~

*Создать пользовательский метод сравнения с использованием вспомогательного метода, созданного с помощью метода `define_method`.*

~~~
RSpec::Matchers.define :have_the_same_elements_as do |expected|
  define_method :similar? do |actual|
    actual.sort.eql?(expected.sort)
  end

  match do |actual|
    similar? actual
  end
end

describe [1, 2, 3] do
  it { should have_the_same_elements_as([3, 2, 1]) }
end
~~~

*Создать пользовательский метод сравнения и вспомогательный метод с использованием модуля.*

~~~
module MyHelpers
  extend RSpec::Matchers::DSL

  def similar?(a, b)
    a.sort.eql?(b.sort)
  end

  define :have_the_same_elements_as do |expected|
    match do |actual|
      similar? actual, expected
    end
  end
end

describe [1, 2, 3] do
  include MyHelpers

  it { should have_the_same_elements_as([3, 2, 1]) }
end
~~~

*Создать пользовательский метод сравнения и вспомогательный метод в теле метода `describe`.*

~~~
describe [1, 2, 3] do
  extend RSpec::Matchers::DSL

  def similar?(a, b)
    a.sort.eql?(b.sort)
  end

  define :have_the_same_elements_as do |expected|
    match do |actual|
      similar? actual, expected
    end
  end

  it { should have_the_same_elements_as([3, 2, 1]) }
end
~~~

*Создать вспомогательные методы с различными условиями для методов `should` и `should_not`.*

~~~
RSpec::Matchers.define :contain do |*expected|
  match_for_should do |actual|
    expected.all? { |elm| actual.include?(elm) }
  end

  match_for_should_not do |actual|
    expected.none? { |elm| actual.include?(elm) }
  end
end

describe [1, 2, 3] do
  it { should contain(1, 2, 3) }
  it { should_not contain(4, 5, 6) }
end
~~~

*Создать цепь присоединенных методов.*

~~~
RSpec::Matchers.define :be_bigger_than do |first|
  match do |actual|
    (actual > first) && (actual < @second) && (actual != @third)
  end

  chain :but_less_than do |second|
    @second = second
  end

  chain :and_not_equal do |third|
    @third = third
  end

  description do
    "be bigger than #{first} but less than #{@second} and not equal #{@third}"
  end
end

describe 9 do
  it { should be_bigger_than(8).but_less_than(11).and_not_equal(10) }
end
~~~

*Получить доступ к методам, определенным в блоке группы примеров, в блоке метода `define`.*

~~~
RSpec::Matchers.define :do_one do
  match do
    one == 'ok!'
  end
end

RSpec::Matchers.define :do_two do
  match do
    two == 'ok too!'
  end
end

RSpec::Matchers.define :do_three do
  match do
    three == 'ok free!'
  end
end

describe 'some object' do
  define_method :one do
    'ok!'
  end

  define_method :two do
    'ok too!'
  end

  define_method :three do
    'ok free!'
  end

  it { should do_one }
  it { should do_two }
  it { should do_three }
end
~~~

*Получить доступ к методам, включенным в блок группы примеров, в блоке метода `define`.*

~~~
RSpec::Matchers.define :do_one do
  match do
    one == 'ok!'
  end
end

module MyHelpers
  def one
    'ok!'
  end
end

describe 'some object' do
  include MyHelpers

  it { should do_one }
end
~~~

*Создать пользовательский метод сравнения, используя протокол методов сравнения.*

~~~
class MyMatcher
  def matches?(actual)
    actual.eql?(true)
  end

  def description
    'be true'
  end

  def failure_message_for_should
    'fail!'
  end

  def failure_message_for_should_not
    'boom!'
  end
end

module MyMatchers
  def do_one
    MyMatcher.new
  end
end

RSpec.configure do |config|
  config.include(MyMatchers, :include => :my_matchers)
end

describe true, :include => :my_matchers do
  it { should do_one }
end

describe false, :include => :my_matchers do
  it { should_not do_one }
end
~~~

### Расширение ###
{: id="Примеры_расширения_и_настройки-Расширение" }

*Расширить выбранную группу пользовательским методом.*

~~~
module MyModule
  def one
    'one'
  end
end

RSpec.configure do |config|
  config.include(MyModule, accept: :my_module)
end

describe 'some code', accept: :my_module do
  it 'does one' do
    one #=> one
  end
end

describe 'some another code' do
  it 'does two' do
    one rescue 'boom!' #=> boom!
  end
end
~~~

### Макросы ###
{: id="Примеры_расширения_и_настройки-Макросы" }

*Создать несколько макросов, использующих, предварительно созданные пользовательские методы сравнения. Перед вызовом макросов в спецификации установить некоторое значение.*

~~~
############
# Matchers #
############

RSpec::Matchers.define :do_one do
  match do |actual|
    actual.one.eql?(1)
  end
end

RSpec::Matchers.define :do_two do
  match do |actual|
    actual.two.eql?(2)
  end
end

RSpec::Matchers.define :do_three do
  match do |actual|
    actual.three.eql?(3)
  end
end

############
# Macroses #
############

module MyMacros
  def set_some_value
    SomeAnotherClass.value = 0
    yield
  end

  def it_does_one
    it { should do_one }
  end

  def it_does_two
    it { should do_two }
  end

  def it_does_three
    it { should do_three }
  end
end

#################
# Configuration #
#################

RSpec.configure do |config|
  config.extend(MyMacros)
end

###########
# Classes #
###########

class SomeAnotherClass
  def self.value=(value)
    @@value = value
  end

  def self.value
    @@value
  end
end


class SomeClass
  def one
    SomeAnotherClass.value += 1
  end

  def two
    SomeAnotherClass.value += 1
  end

  def three
    SomeAnotherClass.value += 1
  end
end

########
# Spec #
########

describe SomeClass do
  set_some_value do
    it_does_one
    it_does_two
    it_does_three
  end
end
~~~

*Создать несколько макросов, использующих, предварительно созданные пользовательские методы сравнения. Перед вызовом макросов в спецификации определить субъект.*

~~~
############
# Matchers #
############

RSpec::Matchers.define :have_name do
  match do |actual|
    !actual.name.nil?
  end
end

RSpec::Matchers.define :have_age do
  match do |actual|
    !actual.age.nil?
  end
end

############
# Macroses #
############

module MyMacros
  def set_person
    subject { Person.new(example.metadata[:name], example.metadata[:age]) }
    yield
  end

  def it_has_name
    it { should have_name }
  end

  def it_has_age
    it { should have_age }
  end
end

#################
# Configuration #
#################

RSpec.configure do |config|
  config.extend(MyMacros)
end

###########
# Classes #
###########

class Person
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age  = age
  end
end

########
# Spec #
########

describe Person, name: 'Pavel', age: 31 do
  set_person do
    it_has_name
    it_has_age
  end
end
~~~

*Создать пользовательский форматировщик.*

~~~
require 'rspec/core/formatters/base_text_formatter'

class CustomFormatter < RSpec::Core::Formatters::BaseTextFormatter
  def initialize(output)
    super(output)
  end

  def start(example_count)
    output
      .<< "===============\n"
      .<< "Запуск #{example_count} тестов\n"
      .<< "===============\n"
  end

  def example_group_started(example_group)
    output
      .<< "Запуск группы #{example_group}\n"
      .<< "\n"
  end

  def example_started(example)
    output << "Запуск примера #{example}\n"
  end

  def example_passed(example)
    output
      .<< "\033[0;32;40mПройден\033[0m #{example}\n"
      .<< "\n"
  end

  def example_failed(example)
    @failed = example
    output
      .<< "\033[0;31;40mСбой\033[0m #{example}\n"
      .<< "\n"
  end

  def example_pending(example)
    @pending = example
    output
      .<< "\033[0;33;40mОтложен\033[0m #{example}\n"
      .<< "\n"
  end

  def start_dump
    output
      .<< "===============\n"
      .<< "Начало выгрузки\n"
      .<< "===============\n"
  end

  def dump_summary(duration, example_count, failure_count, pending_count)
    output
      .<< "Продолжительность: #{duration}\n"
      .<< "Количество примеров: #{example_count}\n"
      .<< "Количество сбоев: #{failure_count}\n"
      .<< "Количество отложенных примеров: #{pending_count}\n"
  end

  def dump_pending
    output
      .<< "\n"
      .<< "Выгрузка отложенных примеров #{@pending}\n"
  end

  def dump_failures
    output
      .<< "Выгрузка непройденных примеров #{@failed}\n"
      .<< "\n"
  end

  def close
    output
      .<< "\n"
      .<< "Тестирование завершено\n"
  end
end
~~~

[^1]: [let и let!](http://relishapp.com/rspec/rspec-core/v/2-6/dir/helper-methods/let-and-let)

[^2]: [RSpec::Core::RakeTask](http://rubydoc.info/gems/rspec-core/2.4.0/RSpec/Core/RakeTask#rcov_opts-instance_method)

