import 'package:cor/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

initBD() async {
   pref = await SharedPreferences.getInstance();

   await pref.setBool('initBase', true);


//====================================== 2-4 года ======================
  await pref.setStringList('2-4 года', <String>['1', '2', '3','4','5','6','7',"8"]);

  await pref.setStringList('1', <String>['В огороде Фёкла', 'Ахала и охала:', '«Уродилась свёкла','Не на грядке, около!»','Жалко Фёкле свёклу,','Жалко свёкле Фёклу.','Жаловалась Фёкла:',"«Заблудилась свёкла»."]);
  await pref.setStringList('1_info', <String>['В огороде Фёкла', '-',"90","9,2" ]);
  await pref.setStringList('1_res', <String>['-',]);

  await pref.setStringList('2', <String>['Гитара','Гитара','Гитара','Гитара','Гитара','Гитара','Гитара','Гитара','Гитара','Гитара','Гитара','Гитара','Гитара','Гитара','Гитара','Гитара']);
  await pref.setStringList('2_info', <String>['Гитара', '-',"90","9,2" ]);
  await pref.setStringList('2_res', <String>['-',]);

  await pref.setStringList('3', <String>['Гриб','Гриб','Гриб','Гриб','Гриб','Гриб','Гриб','Гриб','Гриб','Гриб','Гриб','Гриб','Гриб','Гриб','Гриб','Гриб']);
  await pref.setStringList('3_info', <String>['Гриб', '-',"90","9,2" ]);
  await pref.setStringList('3_res', <String>['-',]);

  await pref.setStringList('4', <String>['Книга','Книга','Книга','Книга','Книга','Книга','Книга','Книга','Книга','Книга','Книга','Книга','Книга','Книга','Книга','Книга']);
  await pref.setStringList('4_info', <String>['Книга', '-',"90","9,2" ]);
  await pref.setStringList('4_res', <String>['-',]);

  await pref.setStringList('5', <String>['Мак','Мак','Мак','Мак','Мак','Мак','Мак','Мак','Мак','Мак','Мак','Мак','Мак','Мак','Мак','Мак']);
  await pref.setStringList('5_info', <String>['Мак', '-',"90","9,2" ]);
  await pref.setStringList('5_res', <String>['-',]);

  await pref.setStringList('6', <String>['Мы в лес пошли,','Топор нашли,','Дрова рубили:','– Ах! Ох! Ух! Их!','Мы в лес пошли,','Топор нашли,','Дрова рубили:','– Ах! Ох! Ух! Их!']);
  await pref.setStringList('6_info', <String>['Мы в лес пошли', '-',"90","9,2" ]);
  await pref.setStringList('6_res', <String>['-',]);

  await pref.setStringList('7', <String>['Радуга','Радуга','Радуга','Радуга','Радуга','Радуга','Радуга','Радуга','Радуга','Радуга','Радуга','Радуга','Радуга','Радуга','Радуга','Радуга',]);
  await pref.setStringList('7_info', <String>['Радуга', '-',"90","9,2" ]);
  await pref.setStringList('7_res', <String>['-',]);

  await pref.setStringList('8', <String>['Роза','Роза','Роза','Роза','Роза','Роза','Роза','Роза','Роза','Роза','Роза','Роза','Роза','Роза','Роза','Роза']);
  await pref.setStringList('8_info', <String>['Роза', '-',"90","9,2" ]);
  await pref.setStringList('8_res', <String>['-',]);



  //====================================== 4-5 лет ======================
  await pref.setStringList('4-5 лет', <String>['9', '10', '11','12','13']);

  await pref.setStringList('9', <String>['Уронили мишку на пол,','Оторвали мишке лапу.','Все равно его не брошу —','Потому что он хороший.']);
  await pref.setStringList('9_info', <String>['Мишка', 'Агния Барто',"90","9,2" ]);
  await pref.setStringList('9_res', <String>['-',]);

  await pref.setStringList('10', <String>['Наша Таня громко плачет:','Уронила в речку мячик.','— Тише, Танечка, не плачь:','Не утонет в речке мяч.']);
  await pref.setStringList('10_info', <String>['Мячик (Наша Таня громко плачет)', 'Агния Барто',"90","9,2" ]);
  await pref.setStringList('10_res', <String>['-',]);

  await pref.setStringList('11', <String>['Купили в магазине','Резиновую Зину,','Резиновую Зину','В корзинке принесли.',
    'Она была разиней,','Резиновая Зина,','Упала из корзины,','Измазалась в грязи.',
    'Мы вымоем в бензине','Резиновую Зину,','Мы вымоем в бензине','И пальцем погрозим:',
    'Не будь такой разиней,','Резиновая Зина,','А то отправим Зину','Обратно в магазин.',]);
  await pref.setStringList('11_info', <String>['Резиновая Зина', 'Агния Барто',"90","9,2" ]);
  await pref.setStringList('11_res', <String>['-',]);

  await pref.setStringList('12', <String>['Жили у бабуси','Два веселых гуся:','Один серый,','Другой белый —','Два веселых гуся.',
    'Вытянули шеи —','У кого длиннее?','Один серый,','Другой белый —','У кого длиннее?',
    'Мыли гуси лапки','В луже у канавки.','Один серый,','Другой белый —','Спрятались в канавке.',
    'Вот кричит бабуся:','«Ой, пропали гуси!','Один серый,','Другой белый —','Гуси мои, гуси».',
    'Выходили гуси,','Кланялись бабусе.','Один серый,','Другой белый —','Кланялись бабусе.',]);
  await pref.setStringList('12_info', <String>['Жили у бабуси два веселых гуся', 'Русская народная песня',"90","9,2" ]);
  await pref.setStringList('12_res', <String>['-',]);

  await pref.setStringList('13', <String>[
    'Вы послушайте, ребята,','Я хочу вам рассказать;','Родились у нас котята —','Их по счету ровно пять.',
    'Мы решали, мы гадали:','Как же нам котят назвать?','Наконец мы их назвали:','Раз, Два, Три, Четыре, Пять.',
    'Раз — котенок самый белый,','Два — котенок самый смелый,','Три — котенок самый умный,','А Четыре — самый шумный.',
    'Пять — похож на Три и Два —','Тот же хвост и голова,','То же пятнышко на спинке,','Так же спит весь день в корзинке.',
    'Хороши у нас котята —','Раз, Два, Три, Четыре, Пять!','Заходите к нам, ребята,','Посмотреть и посчитать.',
  ]);
  await pref.setStringList('13_info', <String>['Котята', 'Сергей Михалков',"90","9,2" ]);
  await pref.setStringList('13_res', <String>['-',]);



  //====================================== 1 класс ======================
  await pref.setStringList('1 класс', <String>['14','15','16','17','18']);

  await pref.setStringList('14', <String>[
    'Мама с папой — моя родня,','Нет роднее родни у меня.','И сестрёнка родня, и братишка,','И щенок лопоухий Тишка.',
    'Я родных своих очень люблю.','Скоро всем подарки куплю:','Папе будет моторная лодка,','Маме в кухню волшебная щётка,',
    'Молоток настоящий братишке.','Мяч сестрёнке, конфета Тишке.','А ещё есть друг у меня,','Друг Серёжка мне тоже родня.',
    'Я к нему прибегаю с утра,','Без него мне игра не игра.','Все секреты ему говорю,','Всё на свете ему подарю.',
  ]);
  await pref.setStringList('14_info', <String>['Моя родня', 'Аким Яков',"90","9,2" ]);
  await pref.setStringList('14_res', <String>['-',]);



  await pref.setStringList('15',  <String>[
    'Травка зеленеет,','Солнышко блестит;','Ласточка с весною','В сени к нам летит.',
    'С нею солнце краше','И весна милей…','Прощебечь с дороги','Нам привет скорей!',
    'Дам тебе я зерен,','А ты песню спой,','Что из стран далеких','Принесла с собой…',
  ]);
  await pref.setStringList('15_info', <String>['Травка зеленеет, солнышко блестит', 'Алексей Плещеев',"90","9,2" ]);
  await pref.setStringList('15_res', <String>['-',]);



  await pref.setStringList('16',  <String>[
    'Мы играли в хохотушки,','Мы визжали, как свинушки,','Мы скакали, как лягушки,','Вбок и задом наперёд.',
    'Мы решили: кто захочет,','Тот нас всех перехохочет,','Всех один пересмеёт.','Мы смеялись и смеялись,',
    'Лопнуть со смеху боялись,','Даже по полу катались:','Всех нас разом смех берёт!','Я могу сказать вам честно,',
    'До сих пор нам неизвестно,','Кто сумеет, кто захочет,','Кто нас всех перехохочет,','Всех один пересмеёт?',

  ]);
  await pref.setStringList('16_info', <String>['Мы играли в хохотушки', 'И. Токмакова',"90","9,2" ]);
  await pref.setStringList('16_res', <String>['-',]);



  await pref.setStringList('17',  <String>[
    'Кулинаки-пулинаки,','Громко гавкают собаки,','Тихо тикают часы,','Чистят чижики носы.',
    'Кулинаки-пулинаки,','Тихо тикают собаки,','Громко гавкают носы,','Чистят чижики часы.',
    'Кулинаки-пулинаки,','Чистят чижиков собаки,','Тихо гавкают часы,','Громко тикают носы.',
    'Кулинаки-пулинаки,','Где часы, а где собаки?..','Только тот и разберёт,','Кто ходит задом-наперёд.',

  ]);
  await pref.setStringList('17_info', <String>['Кулинаки-пулинаки', 'Ирина Пивоварова',"90","9,2" ]);
  await pref.setStringList('17_res', <String>['-',]);



  await pref.setStringList('18',  <String>[
    'Нельзя воспитывать щенков','Посредством крика и пинков.','Щенок, воспитанный пинком,','Не будет преданным щенком.','Ты после грубого пинка','Попробуй подзови щенка!',
  ]);
  await pref.setStringList('18_info', <String>['Важный совет', 'Сергей Михалков',"90","9,2" ]);
  await pref.setStringList('18_res', <String>['-',]);



//====================================== 2 класс ======================
  await pref.setStringList('2 класс', <String>['19','20','21','22','23']);


  await pref.setStringList('19',  <String>[
    'Уж тает снег, бегут ручьи,','В окно повеяло весною…','Засвищут скоро соловьи,','И лес оденется листвою!',
    'Чиста небесная лазурь,','Теплей и ярче солнце стало,','Пора метелей злых и бурь','Опять надолго миновала.',
    'И сердце сильно так в груди','Стучит, как будто ждет чего-то,','Как будто счастье впереди','И унесла зима заботы!',
    'Все лица весело глядят.','«Весна!» — читаешь в каждом взоре;','И тот, как празднику, ей рад,','Чья жизнь — лишь тяжкий труд и горе.',
    'Но резвых деток звонкий смех','И беззаботных птичек пенье','Мне говорят — кто больше всех','Природы любит обновленье!',

  ]);
  await pref.setStringList('19_info', <String>['Весна', 'Алексей Плещеев',"90","9,2" ]);
  await pref.setStringList('19_res', <String>['-',]);



  await pref.setStringList('20',  <String>[
    'Замяукали котята:',
        '«Надоело нам мяукать!',
        'Мы хотим, как поросята,',
        'Хрюкать!»',

        'А за ними и утята:',
        '«Не желаем больше крякать!',
        'Мы хотим, как лягушата,',
        'Квакать!»',

        'Свинки замяукали:',
        'Мяу, мяу!',
        'Кошечки захрюкали:',
        'Хрю, хрю, хрю!',

        'Уточки заквакали:',
        'Ква, ква, ква!',
        'Курочки закрякали:',
        'Кря, кря, кря!',

        'Воробышек прискакал',
        'И коровой замычал:',
        'Му-у-у!',
        'Прибежал медведь',

        'И давай реветь:',
        'Ку-ка-ре-ку!',
        'Только заинька',
        'Был паинька:',

        'Не мяукал',
        'И не хрюкал —',
        'Под капустою лежал,',
        'По-заячьи лопотал',

        'И зверюшек неразумных',
        'Уговаривал:',
        '«Кому велено чирикать —',
        'Не мурлыкайте!',

        'Кому велено мурлыкать —',
        'Не чирикайте!',
        'Не бывать вороне коровою,',
        'Не летать лягушатам под облаком!»',

        'Но весёлые зверята —',
        'Поросята, медвежата —',
        'Пуще прежнего шалят,',
        'Зайца слушать не хотят.',

        'Рыбы по полю гуляют,',
        'Жабы по небу летают,',
        'Мыши кошку изловили,',
        'В мышеловку посадили.',

        'А лисички',
        'Взяли спички,',
        'К морю синему пошли,',
        'Море синее зажгли.',

        'Море пламенем горит,',
        'Выбежал из моря кит:',
        '«Эй, пожарные, бегите!',
        'Помогите, помогите!»',

        'Долго, долго крокодил',
        'Море синее тушил',
        'Пирогами, и блинами,',
        'И сушёными грибами.',

        'Прибегали два курчонка,',
        'Поливали из бочонка.',
        'Приплывали два ерша,',
        'Поливали из ковша.',

        'Прибегали лягушата,',
        'Поливали из ушата.',
        'Тушат, тушат — не потушат,',
        'Заливают — не зальют.',

        'Тут бабочка прилетала,',
        'Крылышками помахала,',
        'Стало море потухать —',
        'И потухло.',

        'Вот обрадовались звери!',
        'Засмеялись и запели,',
        'Ушками захлопали,',
        'Ножками затопали.',

        'Гуси начали опять',
        'По-гусиному кричать:',
        'Га-га-га!',
        'Кошки замурлыкали:',

        'Мур-мур-мур!',
        'Птицы зачирикали:',
        'Чик-чирик!',
        'Лошади заржали:',

        'И-и-и!',
        'Мухи зажужжали:',
        'Ж-ж-ж!',
        'Лягушата квакают:',

        'Ква-ква-ква!',
        'А утята крякают:',
        'Кря-кря-кря!',
        'Поросята хрюкают:',

        'Хрю-хрю-хрю!',
        'Мурочку баюкают',
        'Милую мою:',
        'Баюшки-баю!',

        'Баюшки-баю!'

  ]);
  await pref.setStringList('20_info', <String>['Путаница', 'Корней Чуковский',"90","9,2" ]);
  await pref.setStringList('20_res', <String>['-',]);



  await pref.setStringList('21',  <String>[
    'Попрыгунья Стрекоза',
        'Лето красное пропела;',
        'Оглянуться не успела,',
        'Как зима катит в глаза.',

        'Помертвело чисто поле;',
        'Нет уж дней тех светлых боле,',
        'Как под каждым ей листком',
        'Был готов и стол, и дом.',

        'Всё прошло: с зимой холодной',
        'Нужда, голод настает;',
        'Стрекоза уж не поет:',
        'И кому же в ум пойдет',

        'На желудок петь голодный!',
        'Злой тоской удручена,',
        'К Муравью ползёт она:',
        '«Не оставь меня, кум милой!',

        'Дай ты мне собраться с силой',
        'И до вешних только дней',
        'Прокорми и обогрей!» –',
        '«Кумушка, мне странно это:',

        'Да работала ль ты в лето?»',
        'Говорит ей Муравей.',
        '«До того ль, голубчик, было?',
        'В мягких муравах у нас',

        'Песни, резвость всякий час,',
        'Так, что голову вскружило».–',
        '«А, так ты…» – «Я без души',
        'Лето целое всё пела».–',

        '«Ты всё пела? это дело:',
        'Так поди же, попляши!»',

  ]);
  await pref.setStringList('21_info', <String>['Басня «Стрекоза и муравей»', 'Крылов Иван',"90","9,2" ]);
  await pref.setStringList('21_res', <String>['-',]);



  await pref.setStringList('22',  <String>[
 'Закружилась листва золотая',
 'В розоватой воде на пруду,',
 'Словно бабочек легкая стая',
 'С замираньем летит на звезду.',

 'Я сегодня влюблен в этот вечер,',
 'Близок сердцу желтеющий дол.',
 'Отрок-ветер по самые плечи',
 'Заголил на березке подол.',

 'И в душе и в долине прохлада,',
 'Синий сумрак как стадо овец,',
 'За калиткою смолкшего сада',
 'Прозвенит и замрет бубенец.',

 'Я еще никогда бережливо',
 'Так не слушал разумную плоть,',
 'Хорошо бы, как ветками ива,',
 'Опрокинуться в розовость вод.',

 'Хорошо бы, на стог улыбаясь,',
 'Мордой месяца сено жевать…',
 'Где ты, где, моя тихая радость —',
 'Все любя, ничего не желать?',

  ]);
  await pref.setStringList('22_info', <String>['Закружилась листва золотая…', 'Сергей Есенин',"90","9,2" ]);
  await pref.setStringList('22_res', <String>['-',]);



  await pref.setStringList('23',  <String>[
  'Чародейкою Зимою',
  'Околдован, лес стоит —',
  'И под снежной бахромою,',
  'Неподвижною, немою,',

  'Чудной жизнью он блестит.',
  'И стоит он, околдован, —',
  'Не мертвец и не живой —',
  'Сном волшебным очарован,',

  'Весь опутан, весь окован',
  'Легкой цепью пуховой…',
  'Солнце зимнее ли мещет',
  'На него свой луч косой —',

  'В нем ничто не затрепещет,',
  'Он весь вспыхнет и заблещет',
  'Ослепительной красой.',

  ]);
  await pref.setStringList('23_info', <String>['Чародейкою зимою…', 'Федор Тютчев',"90","9,2" ]);
  await pref.setStringList('23_res', <String>['-',]);

  //====================================== 3 класс ======================
  await pref.setStringList('3 класс', <String>['24','25','26','27','28']);


  await pref.setStringList('24',  <String>[
  'Мороз и солнце; день чудесный!',
  'Еще ты дремлешь, друг прелестный —',
  'Пора, красавица, проснись:',
  'Открой сомкнуты негой взоры',

  'Навстречу северной Авроры,',
  'Звездою севера явись!',
  'Вечор, ты помнишь, вьюга злилась,',
  'На мутном небе мгла носилась;',

  'Луна, как бледное пятно,',
  'Сквозь тучи мрачные желтела,',
  'И ты печальная сидела —',
  'А нынче… погляди в окно:',

  'Под голубыми небесами',
  'Великолепными коврами,',
  'Блестя на солнце, снег лежит;',
  'Прозрачный лес один чернеет,',

  'И ель сквозь иней зеленеет,',
  'И речка подо льдом блестит.',
  'Вся комната янтарным блеском',
  'Озарена. Веселым треском',

  'Трещит затопленная печь.',
  'Приятно думать у лежанки.',
  'Но знаешь: не велеть ли в санки',
  'Кобылку бурую запречь?',

  'Скользя по утреннему снегу,',
  'Друг милый, предадимся бегу',
  'Нетерпеливого коня',
  'И навестим поля пустые,',

  'Леса, недавно столь густые,',
  'И берег, милый для меня.',

  ]);
  await pref.setStringList('24_info', <String>['Зимнее утро', 'Александр Пушкин',"90","9,2" ]);
  await pref.setStringList('24_res', <String>['-',]);

  await pref.setStringList('25',  <String>[
  'Уж небо осенью дышало,',
  'Уж реже солнышко блистало,',
  'Короче становился день,',
  'Лесов таинственная сень',

  'С печальным шумом обнажалась,',
  'Ложился на поля туман,',
  'Гусей крикливых караван',
  'Тянулся к югу: приближалась',

  'Довольно скучная пора;',
  'Стоял ноябрь уж у двора.',

  ]);
  await pref.setStringList('25_info', <String>['Уж небо осенью дышало… (отрывок из «Евгения Онегина»)', 'Александр Пушкин',"90","9,2" ]);
  await pref.setStringList('25_res', <String>['-',]);

  await pref.setStringList('26',  <String>[
  'Осень обещала: » Я озолочу»',
  'А Зима сказала: «Как я захочу»',
  'А Весна сказала: «Ну-ка, ну, Зима».',
  'И Весна настала. Всюду кутерьма.',

  'Солнце золотится. Лютик — золотой.',
  'Речка серебрится и шалит водой.',
  'Родилась на воле, залила луга,',
  'Затопила поле, стёрла берега.',

  'Там, где не достала, — лютик золотой,',
  'Жёлтый одуванчик, — будет и седой.',
  'Осень обещала. Помогла Весна.',
  'Ну, Зима пропала, хоть была сильна.',

  ]);
  await pref.setStringList('26_info', <String>['Золотое слово', 'Константин Бальмонт',"90","9,2" ]);
  await pref.setStringList('26_res', <String>['-',]);

  await pref.setStringList('27',  <String>[
  'Ночевала тучка золотая',
  'На груди утеса-великана;',
  'Утром в путь она умчалась рано,',
  'По лазури весело играя;',

  'Но остался влажный след в морщине',
  'Старого утеса. Одиноко',
  'Он стоит, задумался глубоко,',
  'И тихонько плачет он в пустыне.',
  ]);
  await pref.setStringList('27_info', <String>['Утес', 'Михаил Лермонтов',"90","9,2" ]);
  await pref.setStringList('27_res', <String>['-',]);

  await pref.setStringList('28',  <String>[
  'Люблю грозу в начале мая,',
  'Когда весенний, первый гром,',
  'как бы резвяся и играя,',
  'Грохочет в небе голубом.',

  'Гремят раскаты молодые,',
  'Вот дождик брызнул, пыль летит,',
  'Повисли перлы дождевые,',
  'И солнце нити золотит.',

  'С горы бежит поток проворный,',
  'В лесу не молкнет птичий гам,',
  'И гам лесной и шум нагорный -',
  'Все вторит весело громам.',

  'Ты скажешь: ветреная Геба,',
  'Кормя Зевесова орла,',
  'Громокипящий кубок с неба,',
  'Смеясь, на землю пролила.',

  ]);
  await pref.setStringList('28_info', <String>['Весенняя гроза', 'Федор Тютчев',"90","9,2" ]);
  await pref.setStringList('28_res', <String>['-',]);


  //====================================== 4 класс ======================
  await pref.setStringList('4 класс', <String>['29','30','31','32','33']);


  await pref.setStringList('29',  <String>[
  'Подруга дней моих суровых,',
  'Голубка дряхлая моя!',
  'Одна в глуши лесов сосновых',
  'Давно, давно ты ждешь меня.',

  'Ты под окном своей светлицы',
  'Горюешь, будто на часах,',
  'И медлят поминутно спицы',
  'В твоих наморщенных руках.',

  'Глядишь в забытые вороты',
  'На черный отдаленный путь:',
  'Тоска, предчувствия, заботы',
  'Теснят твою всечасно грудь.',

  'То чудится тебе…',

  ]);
  await pref.setStringList('29_info', <String>['Няне', 'Александр Пушкин',"90","9,2" ]);
  await pref.setStringList('29_res', <String>['-',]);



  await pref.setStringList('30',  <String>[
  'Мне опять приснились дебри,',
  'Глушь пустынь, заката тишь.',
  'Желтый лев крадется к зебре',
  'Через травы и камыш.',

  'Предо мной стволы упрямо',
  'В небо ветви вознесли.',
  'Слышу шаг гиппопотама,',
  'Заросль мнущего вдали.',

  'На утесе безопасен,',
  'Весь я — зренье, весь я — слух.',
  'Но виденья старых басен',
  'Возмущают слабый дух.',

  'Крылья огненного змея',
  'Не затмят ли вдруг закат?',
  'Не взлетит ли, искры сея,',
  'Он над нами, смерти рад?',

  'Из камней не выйдет вдруг ли',
  'Племя карликов ко мне?',
  'Обращая ветки в угли,',
  'Лес не встанет ли в огне?',

  'Месяц вышел. Громче шорох.',
  'Зебра мчится вдалеке.',
  'Лев, взрывая листьев ворох,',
  'Тупо тянется к реке.',

  'Дали сумрачны и глухи.',
  'Хруст слышнее. Страшно. Ведь',
  'Кто же знает: это ль духи',
  'Иль пещеры царь — медведь!',

  ]);
  await pref.setStringList('30_info', <String>['Опять сон', 'Валерий Брюсов',"90","9,2" ]);
  await pref.setStringList('30_res', <String>['-',]);



  await pref.setStringList('31',  <String>[
  'Весна, весна! как воздух чист!',
  'Как ясен небосклон!',
  'Своей лазурию живой',
  'Слепит мне очи он.',

  'Весна, весна! как высоко',
  'На крыльях ветерка,',
  'Ласкаясь к солнечным лучам,',
  'Летают облака!',

  'Шумят ручьи! блестят ручьи!',
  'Взревев, река несет',
  'На торжествующем хребте',
  'Поднятый ею лед!',

  'Еще древа обнажены,',
  'Но в роще ветхий лист,',
  'Как прежде, под моей ногой',
  'И шумен и душист.',

  'Под солнце самое взвился',
  'И в яркой вышине',
  'Незримый жавронок поет',
  'Заздравный гимн весне.',

  'Что с нею, что с моей душой?',
  'С ручьем она ручей',
  'И с птичкой птичка! с ним журчит,',
  'Летает в небе с ней!',

  'Зачем так радует ее',
  'И солнце и весна!',
  'Ликует ли, как дочь стихий,',
  'На пире их она?',

  'Что нужды! счастлив, кто на нем',
  'Забвенье мысли пьет,',
  'Кого далёко от нее',
  'Он, дивный, унесет!',

  ]);
  await pref.setStringList('31_info', <String>['Весна, весна! как воздух чист!..', 'Евгений Баратынский',"90","9,2" ]);
  await pref.setStringList('31_res', <String>['-',]);



  await pref.setStringList('32',  <String>[
  'В зимний вечер по задворкам',
  'Разухабистой гурьбой',
  'По сугробам, по пригоркам',
  'Мы идем, бредем домой.',

  'Опостылеют салазки,',
  'И садимся в два рядка',
  'Слушать бабушкины сказки',
  'Про Ивана-дурака.',

  'И сидим мы, еле дышим.',
  'Время к полночи идет.',
  'Притворимся, что не слышим,',
  'Если мама спать зовет.',

  'Сказки все. Пора в постели…',
  'Но, а как теперь уж спать?',
  'И опять мы загалдели,',
  'Начинаем приставать.',

  'Скажет бабушка несмело:',
  '«Что ж сидеть-то до зари?»',
  'Ну, а нам какое дело, —',
  'Говори да говори.',
  ]);
  await pref.setStringList('32_info', <String>['Бабушкины сказки', 'Сергей Есенин',"90","9,2" ]);
  await pref.setStringList('32_res', <String>['-',]);



  await pref.setStringList('33',  <String>[
  'Как неожиданно и ярко,',
  'На влажной неба синеве,',
  'Воздушная воздвиглась арка',
  'В своем минутном торжестве!',

  'Один конец в леса вонзила,',
  'Другим за облака ушла —',
  'Она полнеба обхватила',
  'И в высоте изнемогла.',

  'О, в этом радужном виденье',
  'Какая нега для очей!',
  'Оно дано нам на мгновенье,',
  'Лови его — лови скорей!',

  'Смотри — оно уж побледнело,',
  'Еще минута, две — и что ж?',
  'Ушло, как-то уйдет всецело,',
  'Чем ты и дышишь и живешь.',

  ]);
  await pref.setStringList('33_info', <String>['Как неожиданно и ярко…', 'Федор Тютчев',"90","9,2" ]);
  await pref.setStringList('33_res', <String>['-',]);


  //====================================== >11 лет ======================
  await pref.setStringList('>11 лет', <String>['34','35','36','37','38']);


  await pref.setStringList('34',  <String>[
  'Унылая пора! Очей очарованье!',
  'Приятна мне твоя прощальная краса —',
  'Люблю я пышное природы увяданье,',
  'В багрец и в золото одетые леса,',

  'В их сенях ветра шум и свежее дыханье,',
  'И мглой волнистою покрыты небеса,',
  'И редкий солнца луч, и первые морозы,',
  'И отдаленные седой зимы угрозы.',

  ]);
  await pref.setStringList('34_info', <String>['Унылая пора! Очей очарованье!', 'Александр Пушкин',"90","9,2" ]);
  await pref.setStringList('34_res', <String>['-',]);


  await pref.setStringList('35',  <String>[
  '«Птичка! Нам жаль твоих песенок звонких!',
  'Не улетай от нас прочь… Подожди!»—',
  '«Милые крошки! Из вашей сторонки',
  'Гонят меня холода и дожди.',

  'Вон на деревьях, на крыше беседки',
  'Сколько меня поджидает подруг!',
  'Завтра вы спать ещё будете, детки,',
  'А уж мы все понесёмся на юг.',

  'Нет там ни стужи теперь, ни дождей,',
  'Ветер листы не срывает с ветвей,',
  'Солнышко в тучи не прячется там…»—',
  '«Скоро ли, птичка, вернёшься ты к нам?»',

  '«Я с запасом новых песен',
  'К вам вернусь, когда с полей',
  'Снег сойдёт, когда в овраге',
  'Зажурчит, блестя, ручей—',

  'И начнёт под вешним’ солнцем',
  'Вся природа оживать…',
  'Я вернусь, когда, малютки,',
  'Вы уж будете читать!»',
  ]);
  await pref.setStringList('35_info', <String>['Дети и птичка', 'Алексей Плещеев',"90","9,2" ]);
  await pref.setStringList('35_res', <String>['-',]);


  await pref.setStringList('36',  <String>[
  'Мартышка, в Зеркале увидя образ свой,',
  'Тихохонько Медведя толк ногой:',
  '«Смотри-ка»,- говорит,- «кум милый мой!',
  'Что это там за рожа?',

  'Какие у нее ужимки и прыжки!',
  'Я удавилась бы с тоски,',
  'Когда бы на нее хоть чуть была похожа.',
  'А ведь, признайся, есть',

  'Из кумушек моих таких кривляк пять-шесть:',
  'Я даже их могу по пальцам перечесть».-',
  '«Чем кумушек считать трудиться,',
  'Не лучше ль на себя, кума, оборотиться?»-',

  'Ей Мишка отвечал.',
  'Но Мишенькин совет лишь попусту пропал.',
  'Таких примеров много в мире:',
  'Не любит узнавать никто себя в сатире.',

  'Я даже видел то вчера:',
  'Что Климыч на руку нечист, все это знают;',
  'Про взятки Климычу читают,',
  'А он украдкою кивает на Петра.',

  ]);
  await pref.setStringList('36_info', <String>['Зеркало и обезьяна (Басня)', 'Иван Крылов',"90","9,2" ]);
  await pref.setStringList('36_res', <String>['-',]);


  await pref.setStringList('37',  <String>[
  'Мартышка к старости слаба глазами стала;',
  'А у людей она слыхала,',
  'Что это зло еще не так большой руки:',
  'Лишь стоит завести Очки.',

  'Очков с полдюжины себе она достала;',
  'Вертит Очками так и сяк:',
  'То к темю их прижмет, то их на хвост нанижет,',
  'То их понюхает, то их полижет;',

  'Очки не действуют никак.',
  '«Тьфу пропасть!» говорит она: «и тот дурак,',
  'Кто слушает людских всех врак:',
  'Всё про Очки лишь мне налгали;',

  'А проку на?-волос нет в них».',
  'Мартышка тут с досады и с печали',
  'О камень так хватила их,',
  'Что только брызги засверкали.',

  'К несчастью, то ж бывает у людей:',
  'Как ни полезна вещь, – цены не зная ей,',
  'Невежда про нее свой толк всё к худу клонит;',
  'А ежели невежда познатней,',

  'Так он ее еще и гонит.',

  ]);
  await pref.setStringList('37_info', <String>['Басня «Мартышка и очки»', 'Крылов Иван',"90","9,2" ]);
  await pref.setStringList('37_res', <String>['-',]);


  await pref.setStringList('38',  <String>[
  'Славная осень! Здоровый, ядреный',
  'Воздух усталые силы бодрит;',
  'Лёд неокрепший на речке студёной',
  'Словно как тающий сахар лежит;',

  'Около леса, как в мягкой постели,',
  'Выспаться можно — покой и простор!',
  'Листья поблекнуть ещё не успели,',
  'Желты и свежи лежат, как ковёр.',

  'Славная осень! Морозные ночи,',
  'Ясные, тихие дни…',
  'Нет безобразья в природе! И кочи,',
  'И моховые болота, и пни —',

  'Все хорошо под сиянием лунным,',
  'Всюду родимую Русь узнаю…',
  'Быстро лечу я по рельсам чугунным,',
  'Думаю думу свою…',

  ]);
  await pref.setStringList('38_info', <String>['Славная осень', 'Николай Некрасов',"90","9,2" ]);
  await pref.setStringList('38_res', <String>['-',]);
}

















/*
await pref.setStringList('18',  <String>[
'','','','',
'','','','',
'','','','',
'','','','',

]);
await pref.setStringList('18_info', <String>['Роза', '-',"90","9,2" ]);
await pref.setStringList('18_res', <String>['-',]);
*/





































