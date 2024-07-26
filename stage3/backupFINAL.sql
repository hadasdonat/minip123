prompt PL/SQL Developer import file
prompt Created on Thursday, July 18, 2024 by CHAYA
set feedback off
set define off
prompt Dropping ACTIVITIES...
drop table ACTIVITIES cascade constraints;
prompt Dropping REPORTS...
drop table REPORTS cascade constraints;
prompt Dropping EEVENTS...
drop table EEVENTS cascade constraints;
prompt Dropping EVENT_ACTIVITY...
drop table EVENT_ACTIVITY cascade constraints;
prompt Dropping VOLUNTEERS...
drop table VOLUNTEERS cascade constraints;
prompt Dropping ROOLES...
drop table ROOLES cascade constraints;
prompt Dropping SHIFTS...
drop table SHIFTS cascade constraints;
prompt Dropping VOLUNTEERSHIFTALLOCATION...
drop table VOLUNTEERSHIFTALLOCATION cascade constraints;
prompt Creating ACTIVITIES...
create table ACTIVITIES
(
  activity_id          NUMBER(4) not null,
  activity_name        VARCHAR2(255) not null,
  activity_description VARCHAR2(255) not null,
  activity_date        DATE not null,
  activity_start_time  VARCHAR2(255) not null,
  activity_end_time    VARCHAR2(255) not null
);
alter table ACTIVITIES
  add primary key (ACTIVITY_ID);

prompt Creating REPORTS...
create table REPORTS
(
  report_id     NUMBER(9) not null,
  creation_date DATE not null,
  report_type   VARCHAR2(255) not null,
  content       VARCHAR2(255) not null
);
alter table REPORTS
  add primary key (REPORT_ID);

prompt Creating EEVENTS...
create table EEVENTS
(
  event_id     NUMBER(4) not null,
  event_date   DATE not null,
  event_time   VARCHAR2(255) not null,
  loocation    VARCHAR2(255) not null,
  deescription VARCHAR2(255) not null,
  report_id    NUMBER(9) not null
);
alter table EEVENTS
  add primary key (EVENT_ID);
alter table EEVENTS
  add foreign key (REPORT_ID)
  references REPORTS (REPORT_ID);

prompt Creating EVENT_ACTIVITY...
create table EVENT_ACTIVITY
(
  event_id    NUMBER(4) not null,
  activity_id NUMBER(4) not null
);
alter table EVENT_ACTIVITY
  add primary key (EVENT_ID, ACTIVITY_ID);
alter table EVENT_ACTIVITY
  add foreign key (ACTIVITY_ID)
  references ACTIVITIES (ACTIVITY_ID);
alter table EVENT_ACTIVITY
  add foreign key (event_id)
  references  EEVENTS(event_id);

prompt Creating VOLUNTEERS...
create table VOLUNTEERS
(
  last_name    VARCHAR2(255) not null,
  address      VARCHAR2(255) not null,
  phone_number VARCHAR2(255) not null,
  email        VARCHAR2(255) not null,
  status       VARCHAR2(255) not null,
  volunteer_id NUMBER(9) not null,
  first_name   VARCHAR2(255) not null
);
alter table VOLUNTEERS
  add primary key (VOLUNTEER_ID);

prompt Creating ROOLES...
create table ROOLES
(
  role_id           NUMBER(1) not null,
  role_name         VARCHAR2(255) not null,
  deescription      VARCHAR2(255) not null,
  required_training NUMBER(1) not null,
  max_volunteers    NUMBER(1) not null,
  volunteer_id      NUMBER(9) not null
);
alter table ROOLES
  add primary key (ROLE_ID);
alter table ROOLES
  add foreign key (VOLUNTEER_ID)
  references VOLUNTEERS (VOLUNTEER_ID);

prompt Creating SHIFTS...
create table SHIFTS
(
  shift_id       NUMBER(4) not null,
  daate          DATE not null,
  start_time     VARCHAR2(255) not null,
  end_time       VARCHAR2(255) not null,
  shift_location VARCHAR2(255) not null,
  shift_leader   VARCHAR2(255) not null,
  event_id       NUMBER(4) not null
);
alter table SHIFTS
  add primary key (SHIFT_ID);
alter table SHIFTS
  add foreign key (EVENT_ID)
  references EEVENTS (EVENT_ID);

prompt Creating VOLUNTEERSHIFTALLOCATION...
create table VOLUNTEERSHIFTALLOCATION
(
  volunteer_id NUMBER(9) not null,
  shift_id     NUMBER(4) not null
);
alter table VOLUNTEERSHIFTALLOCATION
  add primary key (VOLUNTEER_ID, SHIFT_ID);
alter table VOLUNTEERSHIFTALLOCATION
  add foreign key (VOLUNTEER_ID)
  references VOLUNTEERS (VOLUNTEER_ID);
alter table VOLUNTEERSHIFTALLOCATION
  add foreign key (SHIFT_ID)
  references SHIFTS (SHIFT_ID);

prompt Disabling triggers for ACTIVITIES...
alter table ACTIVITIES disable all triggers;
prompt Disabling triggers for REPORTS...
alter table REPORTS disable all triggers;
prompt Disabling triggers for EEVENTS...
alter table EEVENTS disable all triggers;
prompt Disabling triggers for EVENT_ACTIVITY...
alter table EVENT_ACTIVITY disable all triggers;
prompt Disabling triggers for VOLUNTEERS...
alter table VOLUNTEERS disable all triggers;
prompt Disabling triggers for ROOLES...
alter table ROOLES disable all triggers;
prompt Disabling triggers for SHIFTS...
alter table SHIFTS disable all triggers;
prompt Disabling triggers for VOLUNTEERSHIFTALLOCATION...
alter table VOLUNTEERSHIFTALLOCATION disable all triggers;
prompt Disabling foreign key constraints for EEVENTS...
alter table EEVENTS disable constraint SYS_C007457;
prompt Disabling foreign key constraints for EVENT_ACTIVITY...
alter table EVENT_ACTIVITY disable constraint SYS_C007441;
prompt Disabling foreign key constraints for ROOLES...
alter table ROOLES disable constraint SYS_C007449;
prompt Disabling foreign key constraints for SHIFTS...
alter table SHIFTS disable constraint SYS_C007466;
prompt Disabling foreign key constraints for VOLUNTEERSHIFTALLOCATION...
alter table VOLUNTEERSHIFTALLOCATION disable constraint SYS_C007470;
alter table VOLUNTEERSHIFTALLOCATION disable constraint SYS_C007471;
prompt Loading ACTIVITIES...
insert into ACTIVITIES (activity_id, activity_name, activity_description, activity_date, activity_start_time, activity_end_time)
values (1111, 'carry', 'optio in laboris. ', to_date('12-03-2008', 'dd-mm-yyyy'), '13:6', '0:4');
insert into ACTIVITIES (activity_id, activity_name, activity_description, activity_date, activity_start_time, activity_end_time)
values (1112, 'revive', 'proident est. ', to_date('13-07-2010', 'dd-mm-yyyy'), '13:8', '12:18');
insert into ACTIVITIES (activity_id, activity_name, activity_description, activity_date, activity_start_time, activity_end_time)
values (1113, 'revive', 'sint ad. ', to_date('18-03-2005', 'dd-mm-yyyy'), '0:4', '9:2');
insert into ACTIVITIES (activity_id, activity_name, activity_description, activity_date, activity_start_time, activity_end_time)
values (1114, 'carry', 'ipsum recusandae excepteur accusamus. ', to_date('19-01-2009', 'dd-mm-yyyy'), '1:14', '18:54');
insert into ACTIVITIES (activity_id, activity_name, activity_description, activity_date, activity_start_time, activity_end_time)
values (1115, 'carry', 'ut soluta harum. ', to_date('11-05-2002', 'dd-mm-yyyy'), '2:28', '4:11');
insert into ACTIVITIES (activity_id, activity_name, activity_description, activity_date, activity_start_time, activity_end_time)
values (1116, 'revive', 'quod facere. ', to_date('06-10-2021', 'dd-mm-yyyy'), '12:30', '19:1');
insert into ACTIVITIES (activity_id, activity_name, activity_description, activity_date, activity_start_time, activity_end_time)
values (1117, 'carry', 'rerum mollit qui. ', to_date('17-02-2020', 'dd-mm-yyyy'), '7:17', '17:54');
insert into ACTIVITIES (activity_id, activity_name, activity_description, activity_date, activity_start_time, activity_end_time)
values (1118, 'mend', 'laboris repellat mollit et eligendi. ', to_date('27-11-2009', 'dd-mm-yyyy'), '20:21', '6:55');
insert into ACTIVITIES (activity_id, activity_name, activity_description, activity_date, activity_start_time, activity_end_time)
values (1119, 'carry', 'eos. ', to_date('01-01-2011', 'dd-mm-yyyy'), '13:1', '18:11');
commit;
prompt 9 records loaded
prompt Loading REPORTS...
insert into REPORTS (report_id, creation_date, report_type, content)
values (1111, to_date('13-11-2010', 'dd-mm-yyyy'), 'word', 'soluta reprehenderit repudiandae consequat iusto distinctio fugiat sunt maxime culpa.  et soluta in dolorum impedit officia qui consequat irure corrupti.  sapiente incididunt rerum et similique minim ut corrupti omnis id. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1112, to_date('24-06-2023', 'dd-mm-yyyy'), 'excel', 'occaecati lorem saepe dolorum deserunt culpa debitis molestias non commodo.  reprehenderit hic animi itaque delectus maiores saepe laborum quod omnis.  a ut consectetur non placeat quis officia id quo tenetur.  eiusmod anim expedita molestias in odio maio');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1113, to_date('06-04-2000', 'dd-mm-yyyy'), 'word', 'eligendi qui minus dolor laborum ut id incididunt expedita omnis.  hic animi ducimus nostrud ex aliquip sapiente reprehenderit do sint.  delectus rerum eiusmod ut dolore adipisicing reiciendis consequat eu amet.  eveniet et aliquip itaque est asperiores i');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1114, to_date('14-07-2022', 'dd-mm-yyyy'), 'word', 'praesentium rerum cillum consectetur anim cupidatat elit eligendi a in.  et molestiae excepturi in odio deserunt et aut. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1115, to_date('19-06-2013', 'dd-mm-yyyy'), 'excel', 'mollitia consequat itaque dignissimos itaque nobis maxime magna cumque officiis.  excepteur non maxime autem delectus non ipsum at ut alias.  ut occaecat officiis anim enim rerum dolore rerum deserunt quis.  itaque sint irure reprehenderit aut voluptate d');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1116, to_date('17-01-2001', 'dd-mm-yyyy'), 'excel', 'dignissimos culpa lorem duis sint libero ad in rerum anim.  hic ducimus culpa sunt maxime assumenda dolor incididunt deserunt non.  tenetur facere rerum anim velit id maiores sint ducimus consequatur.  deserunt velit atque asperiores distinctio in rerum m');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1117, to_date('25-08-2012', 'dd-mm-yyyy'), 'excel', 'voluptates similique est doloribus nobis veniam veniam perferendis repellendus dolore.  esse mollitia accusamus iusto non aut eiusmod sint rerum ea.  culpa delectus dignissimos saepe placeat aute et sunt assumenda nulla.  quo officia ut maxime et itaque e');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1118, to_date('18-12-2010', 'dd-mm-yyyy'), 'excel', 'sint consequatur et distinctio sint praesentium aut eveniet proident est.  officia laborum sint et debitis placeat duis omnis nihil reiciendis.  nobis elit eu et praesentium officiis iusto sit sunt et.  reprehenderit enim facilis at sint velit sunt asperi');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1119, to_date('05-12-2002', 'dd-mm-yyyy'), 'word', 'dolore repellendus incididunt sunt in in et duis dolores eveniet.  sapiente et temporibus nulla impedit quas dignissimos nostrud blanditiis facere.  quidem et nisi nulla sed veniam in et alias harum.  ullamco ad in facilis aut cupidatat cumque ipsum cillu');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1120, to_date('15-04-2019', 'dd-mm-yyyy'), 'word', 'qui distinctio reprehenderit dolore reprehenderit et consectetur sunt ducimus ut.  eu ducimus non necessitatibus dignissimos rerum eiusmod. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1121, to_date('23-02-2002', 'dd-mm-yyyy'), 'excel', 'magna accusamus debitis est anim deleniti quis facilis duis voluptate.  quis a laboris consectetur eiusmod nam autem dolore aut ea.  sapiente accusamus ut dolor optio est labore pariatur eiusmod maxime.  enim itaque a facilis aut et soluta recusandae do r');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1122, to_date('18-02-2022', 'dd-mm-yyyy'), 'pdf', 'est libero cum dolores et molestiae elit excepteur ut accusamus.  qui eveniet laboris sit fuga proident amet ut consequat ullamco.  mollitia commodo cupidatat commodo repellat voluptates assumenda necessitatibus nulla est.  duis itaque autem nobis impedit');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1123, to_date('01-11-2011', 'dd-mm-yyyy'), 'word', 'reiciendis at dolore impedit laborum deserunt aut ex sapiente veniam.  atque laboris nostrud in dolor laboris aliquip maiores occaecati necessitatibus.  officiis est adipisicing quod culpa mollitia est maxime voluptate eligendi.  et est laborum molestias ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1124, to_date('25-04-2001', 'dd-mm-yyyy'), 'word', 'ut cillum occaecat et officiis a nostrud dolore omnis quibusdam.  molestiae excepturi sit aut maiores cupiditate culpa soluta rerum cum.  doloribus nihil velit dolorum debitis dolor. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1125, to_date('04-07-2014', 'dd-mm-yyyy'), 'excel', 'quidem quo laboris proident minus dolorum anim ullamco est optio.  et repudiandae soluta cupidatat recusandae dolores esse magna sunt tenetur.  est possimus esse ducimus sunt odio blanditiis in quis voluptate.  voluptas lorem aut sint nisi cupiditate expe');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1126, to_date('09-08-2016', 'dd-mm-yyyy'), 'word', 'earum in magna molestias rerum et qui nulla id velit.  cumque repudiandae maxime eu ut fugiat qui molestias ipsum omnis.  deleniti reprehenderit proident dolore in facere rerum fuga fuga excepturi.  aute recusandae maiores anim amet iusto sed sint a venia');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1127, to_date('30-10-2012', 'dd-mm-yyyy'), 'word', 'laborum non non et nisi reiciendis placeat sapiente minus do.  nisi nam et et aliquip animi facere irure cupidatat proident.  odio nulla rerum mollitia quis pariatur sed et qui atque.  dolore rerum sunt et tenetur est minus provident qui et.  rerum quibus');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1128, to_date('09-06-2008', 'dd-mm-yyyy'), 'excel', 'qui irure optio eiusmod consequat laborum deleniti soluta delectus id.  est sunt iusto deserunt esse veniam tenetur libero est corrupti.  voluptatibus labore enim debitis aliqua molestias tempore do laborum accusamus.  est itaque labore et repudiandae non');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1129, to_date('21-06-2018', 'dd-mm-yyyy'), 'excel', 'sint lorem cupidatat occaecati in quibusdam et quidem placeat est.  non sit nobis lorem quas. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1130, to_date('25-01-2009', 'dd-mm-yyyy'), 'excel', 'necessitatibus quod amet commodo officia eos harum non est ut.  non ipsum commodo minim sint repellat adipisicing tenetur eveniet dolor.  sit irure nostrud expedita dolore commodo id nobis necessitatibus maiores.  consequat molestias voluptatum repellendu');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1131, to_date('12-12-2015', 'dd-mm-yyyy'), 'pdf', 'in omnis aut nulla iusto cumque et duis facilis in.  lorem odio dolores doloribus nostrud non esse sit animi aut.  nostrud iusto aliquip aut quos quidem facilis accusamus excepteur voluptates.  magna proident amet occaecat dolor quos debitis saepe laborum');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1132, to_date('17-04-2023', 'dd-mm-yyyy'), 'excel', 'sit placeat alias maiores necessitatibus nostrud similique deserunt impedit ipsum.  rerum expedita possimus animi ea maxime rerum ea est est.  expedita consectetur provident corrupti exercitation nobis maxime ut excepturi ipsum.  et nihil quos et molestia');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1133, to_date('24-01-2001', 'dd-mm-yyyy'), 'pdf', 'molestiae et est sint repellendus cupiditate repudiandae debitis in anim.  perferendis deserunt distinctio non deleniti excepteur reiciendis ut iusto laborum.  qui et magna est alias atque proident maxime saepe earum.  et cumque temporibus cupiditate nisi');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1134, to_date('29-06-2003', 'dd-mm-yyyy'), 'word', 'facere reprehenderit quidem atque aliquip omnis dolorum expedita veniam rerum.  asperiores velit aut voluptatum repudiandae dolor anim ut dolore temporibus.  sint sint eu officiis optio aute tempore id dolore soluta.  qui doloribus in ad deleniti id deser');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1135, to_date('01-08-2023', 'dd-mm-yyyy'), 'pdf', 'culpa ut possimus recusandae in reprehenderit in facere enim amet.  at cumque duis soluta voluptates nulla dolorum dolore ipsum qui.  esse nisi id ut et accusamus quis nostrud rerum impedit.  in in sint sunt qui ut velit et hic sint.  ut deserunt at magna');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1136, to_date('21-02-2008', 'dd-mm-yyyy'), 'word', 'proident qui officia dolor sunt odio culpa id deserunt animi.  laborum id incididunt duis earum non ut consectetur alias alias.  corrupti aliqua sint impedit eiusmod rerum repellat. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1137, to_date('08-03-2017', 'dd-mm-yyyy'), 'word', 'aut fugiat non ullamco dignissimos molestias omnis occaecat possimus non.  repudiandae elit atque qui rerum rerum odio in est nostrud.  sint aut aut cillum proident officia esse repellat repudiandae ut.  ipsum tenetur optio ut distinctio minim anim cupidi');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1138, to_date('15-11-2020', 'dd-mm-yyyy'), 'excel', 'est omnis velit voluptate cillum aut do consequat occaecati culpa.  vero aut excepteur facere harum temporibus excepteur dignissimos rerum molestiae.  nostrud praesentium culpa est est aut temporibus qui dolor non.  non in reprehenderit irure duis odio re');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1139, to_date('24-09-2000', 'dd-mm-yyyy'), 'word', 'minim do similique sit animi et qui deleniti corrupti doloribus.  soluta dolore culpa non optio saepe est quo id maxime.  consectetur libero recusandae facilis id dolor quis ullamco eiusmod distinctio.  est provident optio do reiciendis minim facilis mole');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1140, to_date('19-11-2020', 'dd-mm-yyyy'), 'word', 'asperiores in nihil aliqua reiciendis necessitatibus hic quidem ut ducimus.  id consectetur harum sed et mollitia excepteur eveniet voluptas aute.  a maiores excepturi molestias do velit nisi voluptatibus aut aut.  quidem minus repudiandae praesentium con');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1141, to_date('13-01-2009', 'dd-mm-yyyy'), 'pdf', 'in tenetur quis eiusmod veniam nisi ut dignissimos et elit.  fuga ducimus et mollit cum aliqua voluptatum et repellendus repellendus.  ducimus elit reiciendis cum cillum minus aut exercitation quas et.  ullamco ut iusto tenetur placeat mollit optio conseq');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1142, to_date('24-03-2017', 'dd-mm-yyyy'), 'excel', 'in et et hic ut in sunt amet ullamco non.  sunt incididunt elit consectetur est corrupti excepteur sunt placeat in.  molestiae officia asperiores animi eveniet fugiat quos a saepe voluptates.  sint itaque in tempor ducimus saepe ducimus minus excepturi as');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1143, to_date('18-01-2004', 'dd-mm-yyyy'), 'pdf', 'animi saepe similique proident nobis aut culpa deserunt aliquip dolores.  dolorum minim ex qui tenetur non recusandae voluptatum at consectetur.  ducimus consectetur et omnis harum cillum laborum quo et dolor.  deserunt in sapiente distinctio tenetur a na');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1144, to_date('18-11-2006', 'dd-mm-yyyy'), 'excel', 'autem commodo est asperiores tempore alias temporibus et culpa eos.  sapiente in sunt consequatur aut lorem id aut qui et.  quos voluptates eiusmod et tempor provident id quos sunt necessitatibus.  adipisicing minim duis laborum do omnis dolor commodo con');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1145, to_date('24-03-2013', 'dd-mm-yyyy'), 'word', 'quis id facere in deserunt eveniet molestias molestiae magna nostrud.  dignissimos tempor repellendus non nam et fuga excepteur culpa ut.  et atque necessitatibus est excepteur id est aliqua nihil iusto.  cupiditate et eligendi alias occaecati quas anim t');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1146, to_date('12-06-2020', 'dd-mm-yyyy'), 'word', 'consectetur omnis pariatur ut exercitation facere blanditiis quod occaecat odio.  et et praesentium dolor voluptates distinctio distinctio aut assumenda ut.  nulla earum et sint magna eos amet proident non earum.  et anim consectetur proident laborum dolo');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1147, to_date('28-10-2001', 'dd-mm-yyyy'), 'excel', 'amet excepturi esse perferendis impedit perferendis quos in id itaque.  non in et animi molestiae recusandae anim. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1148, to_date('20-02-2010', 'dd-mm-yyyy'), 'excel', 'in dolore non saepe cillum et quas hic voluptatibus et.  iusto sint est est esse consequat repudiandae sint sapiente animi.  consectetur commodo duis consequat libero similique possimus saepe in odio.  proident officia occaecat consequat dignissimos qui c');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1149, to_date('07-03-2015', 'dd-mm-yyyy'), 'word', 'minim fuga sed cumque animi irure similique est facere est.  fuga optio hic in est magna aut dolorum eiusmod in.  ducimus et officia impedit animi quibusdam optio rerum quibusdam quod.  rerum aliqua dolorum assumenda a distinctio quod qui possimus et.  no');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1150, to_date('30-11-2017', 'dd-mm-yyyy'), 'pdf', 'placeat animi non earum aute irure aut id cupidatat quibusdam.  ducimus cumque excepturi dolores nulla consequat adipisicing est ex eiusmod.  dolore odio sint nostrud placeat veniam ipsum quo dolor ad.  sunt laborum voluptatibus est dolorum aut ut labore ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1151, to_date('15-10-2017', 'dd-mm-yyyy'), 'word', 'dolores dolor optio officia praesentium odio fuga eiusmod quod repellendus.  sint facilis est veniam eos delectus blanditiis mollitia deleniti commodo.  laborum et aliquip repellat eligendi eu saepe in atque quos.  cumque eligendi dolorum eiusmod non nisi');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1152, to_date('01-09-2008', 'dd-mm-yyyy'), 'pdf', 'officia ut rerum excepteur odio culpa incididunt esse ipsum placeat.  optio iusto quas esse nam labore voluptatibus dignissimos laborum consequatur.  non saepe necessitatibus est ullamco in in nisi voluptate anim.  asperiores deserunt veniam assumenda ips');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1153, to_date('12-10-2009', 'dd-mm-yyyy'), 'excel', 'excepturi cillum ut dolorum et occaecat officia nihil ut minus.  ad quos commodo fugiat dolor voluptatum similique eu nihil nisi.  quas ut cumque aut sint excepturi animi qui libero maxime.  eligendi id dolor et molestiae harum dolore molestiae deserunt o');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1154, to_date('12-06-2021', 'dd-mm-yyyy'), 'pdf', 'impedit aut praesentium reprehenderit et dolore harum et deleniti dolores.  placeat cupidatat in facere repellendus quo. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1155, to_date('05-08-2020', 'dd-mm-yyyy'), 'excel', 'ea delectus commodo recusandae cum pariatur hic deleniti officia ullamco.  voluptates in odio impedit harum nostrud aut laborum tempor officia.  ut et officia quidem enim lorem adipisicing placeat duis nam.  voluptate iusto deleniti occaecati saepe rerum ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1156, to_date('23-05-2006', 'dd-mm-yyyy'), 'excel', 'ex exercitation consequat mollitia minim asperiores facilis cum distinctio dolorum.  rerum velit sunt ut commodo enim veniam in anim dolor.  culpa corrupti ut id accusamus irure quidem et nulla incididunt.  aut debitis et laboris dolores et mollitia tempo');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1157, to_date('12-09-2011', 'dd-mm-yyyy'), 'pdf', 'est adipisicing pariatur labore ullamco autem accusamus atque non duis.  corrupti magna repellendus id. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1158, to_date('15-12-2003', 'dd-mm-yyyy'), 'word', 'qui enim debitis aut id officia animi praesentium dolores ipsum.  aut distinctio deserunt officiis ad temporibus mollit soluta sint aut.  ut maxime soluta est reiciendis nulla sunt enim facilis ullamco.  quod nisi velit alias tempore odio pariatur consequ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1159, to_date('01-09-2004', 'dd-mm-yyyy'), 'pdf', 'nostrud do qui officia dolor non rerum debitis rerum necessitatibus.  ipsum et ut assumenda earum eu expedita qui itaque eiusmod.  blanditiis lorem ut debitis in sit sit laborum impedit recusandae.  in praesentium repudiandae tempore impedit officiis prov');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1160, to_date('07-06-2012', 'dd-mm-yyyy'), 'word', 'sapiente. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1161, to_date('11-02-2018', 'dd-mm-yyyy'), 'pdf', 'aut necessitatibus debitis qui aut ut esse ut dolorum culpa.  quas veniam quas dolorum id animi in dolor voluptate est.  tempor est sapiente ducimus tenetur aliqua minus eu delectus sint.  ut optio voluptatibus aliquip eu aut saepe distinctio veniam non. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1162, to_date('27-03-2013', 'dd-mm-yyyy'), 'pdf', 'exercitation nulla blanditiis et hic. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1163, to_date('27-05-2019', 'dd-mm-yyyy'), 'word', 'et eu provident exercitation cum necessitatibus dolor quo sed laboris.  ipsum ullamco rerum sed reprehenderit nihil sint hic est tempor.  est in impedit dignissimos atque labore pariatur enim consequat possimus.  eos officia id ullamco dolorum praesentium');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1164, to_date('12-06-2023', 'dd-mm-yyyy'), 'pdf', 'libero veniam dolorum quo voluptates facilis facilis necessitatibus officiis asperiores.  reprehenderit quidem eveniet mollitia libero possimus molestiae nisi sit impedit.  exercitation et harum in sint aut dolor laborum culpa atque.  commodo eveniet ea l');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1165, to_date('15-04-2009', 'dd-mm-yyyy'), 'pdf', 'distinctio adipisicing voluptatibus non occaecati quidem nostrud ut cupiditate sint.  exercitation incididunt et irure sapiente consectetur nam repellendus officia rerum.  repudiandae assumenda assumenda fugiat sapiente. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1166, to_date('10-08-2013', 'dd-mm-yyyy'), 'pdf', 'reprehenderit est atque eos temporibus possimus occaecati aut culpa ut.  laborum ut cupidatat exercitation facere fuga magna laboris consectetur in.  magna. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1167, to_date('22-04-2017', 'dd-mm-yyyy'), 'excel', 'aut labore id sint fuga odio excepturi magna debitis sint.  fuga temporibus occaecat aut officiis rerum repellat dolorum commodo consectetur.  dolor labore vero sint optio accusamus cupidatat laboris animi tenetur.  temporibus delectus nulla eu maxime vel');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1168, to_date('21-11-2008', 'dd-mm-yyyy'), 'excel', 'ea officiis ducimus officiis et aut eu in aut excepteur.  a cillum et sunt asperiores eveniet autem repellendus id ducimus.  eveniet dolor debitis ducimus aut fugiat qui duis exercitation tempore.  voluptatibus praesentium in in duis quo optio facilis ame');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1169, to_date('27-05-2006', 'dd-mm-yyyy'), 'word', 'harum quod non sapiente reiciendis ut occaecati repudiandae tenetur sint.  dolor culpa soluta minus soluta officia recusandae ex dolorum provident.  aut dolor occaecat qui itaque maiores dolore similique dolorum est.  incididunt maiores dolor esse cupidit');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1170, to_date('18-09-2022', 'dd-mm-yyyy'), 'word', 'deserunt provident et a dolore facere velit quis sapiente ut.  sit possimus sit in et aute provident veniam sint duis.  facilis perferendis ut amet cupiditate minus ut distinctio est assumenda.  quis ut maiores possimus et amet consequat itaque delectus r');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1171, to_date('08-08-2001', 'dd-mm-yyyy'), 'pdf', 'sint a possimus sunt et duis voluptas quo dolor et.  ut in sit est qui impedit. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1172, to_date('24-02-2011', 'dd-mm-yyyy'), 'word', 'sint impedit exercitation dignissimos maiores odio dolores in et delectus.  alias laborum repellendus ullamco qui dolorum tenetur aut consectetur perferendis.  perferendis quis laborum veniam debitis labore facere laborum cumque cillum.  optio provident m');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1173, to_date('31-05-2017', 'dd-mm-yyyy'), 'excel', 'id deleniti odio lorem exercitation eos dolores reprehenderit cillum temporibus.  culpa magna sint mollitia non aut ut magna similique facilis.  a placeat proident nostrud et aute ullamco necessitatibus perferendis dolore.  quidem laboris voluptate dignis');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1174, to_date('04-10-2004', 'dd-mm-yyyy'), 'excel', 'ut duis ut aut deserunt harum asperiores tempor adipisicing irure.  itaque dolore magna nobis fugiat aut cupidatat et deserunt et.  fuga officia proident itaque rerum perferendis expedita lorem ipsum sit.  laborum enim deserunt in fugiat maiores recusanda');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1175, to_date('08-11-2023', 'dd-mm-yyyy'), 'excel', 'sunt eu et officiis sunt ipsum nulla autem duis quod.  omnis impedit molestiae tempore consectetur ut placeat iusto dolore aut.  et quas dolor corrupti mollit debitis voluptas commodo in proident.  in non sunt cum qui debitis facilis proident maiores labo');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1176, to_date('21-09-2001', 'dd-mm-yyyy'), 'excel', 'et velit assumenda cupiditate similique commodo occaecati et rerum repudiandae.  corrupti delectus perferendis nihil recusandae in consequat consequatur ex aliquip.  aliqua optio alias eos sapiente repellendus facilis dolor lorem incididunt.  laboris labo');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1177, to_date('14-03-2008', 'dd-mm-yyyy'), 'pdf', 'debitis quibusdam quas sunt cillum deserunt animi qui aut et.  accusamus facilis et fuga et nisi minim provident minus. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1178, to_date('13-04-2011', 'dd-mm-yyyy'), 'word', 'molestiae saepe nobis est cum dolore et id et et.  dolores in aute nam harum sunt. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1179, to_date('21-09-2017', 'dd-mm-yyyy'), 'excel', 'ut expedita consequat blanditiis minus ut labore cupiditate maxime est.  dolor irure repudiandae laborum voluptas non et eu ex qui.  sint et sunt et atque duis nostrud corrupti iusto tempore.  sunt adipisicing incididunt omnis doloribus expedita recusanda');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1180, to_date('13-11-2003', 'dd-mm-yyyy'), 'word', 'nam sunt est voluptates ducimus fugiat ut cupiditate elit omnis.  nisi cillum laboris itaque irure hic corrupti reprehenderit tempore qui.  qui officia deserunt eligendi similique excepteur cillum autem officiis voluptas.  et quibusdam tempor nam eiusmod ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1181, to_date('07-06-2009', 'dd-mm-yyyy'), 'excel', 'ut amet harum et aut deserunt optio nam consectetur distinctio.  lorem necessitatibus ut rerum praesentium praesentium. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1182, to_date('03-04-2000', 'dd-mm-yyyy'), 'pdf', 'et ex nulla similique ex occaecati quibusdam sunt qui anim.  ut fugiat iusto omnis ut aliqua aliqua at molestias id.  excepturi aliqua magna duis nam tenetur minim vero aliqua culpa.  velit et necessitatibus at pariatur qui impedit placeat occaecat omnis.');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1183, to_date('21-05-2012', 'dd-mm-yyyy'), 'word', 'ut vero ea veniam est ut dolor omnis excepteur in.  quas cillum autem rerum a aliqua non deserunt ipsum non.  repellat laborum est dolor cillum tenetur ducimus aliquip laboris pariatur.  commodo ut debitis sint excepturi aliqua aut occaecat et reprehender');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1184, to_date('26-05-2023', 'dd-mm-yyyy'), 'word', 'similique rerum molestias repellat eu aut nihil dolores cupidatat voluptate.  eligendi saepe sit dolore molestiae qui eiusmod reprehenderit sapiente nihil.  occaecat sint fuga enim est proident qui minim distinctio et.  velit eligendi laboris voluptas dol');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1185, to_date('01-02-2022', 'dd-mm-yyyy'), 'pdf', 'proident sapiente iusto adipisicing odio rerum est voluptatum id qui.  distinctio et optio quo itaque sint atque est est dolore.  cillum aliqua similique id fuga dolorum voluptatum repellat amet at.  rerum est voluptatibus ut cum qui magna a adipisicing o');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1186, to_date('26-12-2002', 'dd-mm-yyyy'), 'excel', 'sed nisi officia et blanditiis officia delectus cillum irure aut.  excepteur quibusdam dolor deserunt accusamus qui ipsum et labore accusamus.  distinctio cupiditate ut animi eligendi nihil maiores fugiat tempor tempor.  et veniam magna nam alias et irure');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1187, to_date('22-04-2001', 'dd-mm-yyyy'), 'pdf', 'cillum dolor consectetur. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1188, to_date('09-08-2019', 'dd-mm-yyyy'), 'word', 'dolor repellendus cumque aut rerum possimus possimus laborum exercitation sapiente.  mollitia est id sunt quod et sed deleniti eiusmod recusandae.  distinctio repellat at quo excepturi consequatur rerum magna voluptatibus. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1189, to_date('11-08-2011', 'dd-mm-yyyy'), 'excel', 'et officiis et non deleniti qui quo adipisicing aut dolore.  deserunt occaecat maxime repudiandae provident provident quis voluptas et aut.  nobis nobis commodo et ullamco blanditiis omnis delectus minus voluptas.  exercitation repudiandae veniam elit com');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1190, to_date('21-10-2001', 'dd-mm-yyyy'), 'pdf', 'quis officia enim atque vero id tempor placeat harum omnis.  ut mollitia culpa deserunt ad voluptatibus occaecat est et labore.  dolorum exercitation in proident cillum dolor excepteur eveniet necessitatibus atque. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1191, to_date('02-06-2015', 'dd-mm-yyyy'), 'word', 'nam maxime repudiandae animi ea excepturi vero harum minus similique.  recusandae harum elit perferendis et cillum cillum fuga et pariatur.  voluptatibus omnis nostrud maiores recusandae vero et cumque aut cupiditate.  ut et do expedita id est reiciendis ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1192, to_date('22-07-2013', 'dd-mm-yyyy'), 'word', 'rerum mollitia voluptate facilis a similique in enim dignissimos facilis.  elit saepe est aut harum debitis rerum veniam occaecati et.  est at officiis nulla et quo dolor dolores culpa praesentium.  fugiat praesentium eligendi veniam perferendis impedit a');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1193, to_date('05-08-2006', 'dd-mm-yyyy'), 'excel', 'laborum enim itaque consectetur voluptate quod vero proident consectetur aut.  ad eos et facilis laborum eveniet a incididunt aut sint.  delectus officia id deserunt elit eveniet et deserunt aut necessitatibus.  ut occaecat quidem optio libero elit rerum ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1194, to_date('04-12-2016', 'dd-mm-yyyy'), 'excel', 'aut in cillum cupiditate et soluta nobis voluptatum repellendus lorem.  nobis in qui reprehenderit elit rerum ut excepturi eos alias.  harum cupiditate expedita quis repellat amet fugiat et consequatur et.  eveniet cillum aut reprehenderit sint qui quod d');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1195, to_date('25-08-2010', 'dd-mm-yyyy'), 'excel', 'non eu facere maiores eiusmod consequatur voluptas ad soluta tenetur.  laboris cupidatat non expedita omnis repellat anim officia proident maxime.  accusamus sunt at earum culpa mollit est sint et cillum.  eu placeat ea ut hic fugiat fuga dolor qui ea.  o');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1196, to_date('05-05-2021', 'dd-mm-yyyy'), 'excel', 'maxime molestiae dolor ad distinctio sunt nobis fugiat cillum repellat.  deleniti possimus et aliqua nulla ut alias placeat maxime eos.  quod a impedit officia itaque quo mollitia esse sint et.  aliquip eveniet est animi cupiditate commodo maiores cum atq');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1197, to_date('15-05-2022', 'dd-mm-yyyy'), 'pdf', 'laborum et soluta molestiae elit ut dolor aut possimus dolor.  a delectus maxime nam nobis sunt eiusmod fuga quo pariatur.  fugiat autem quis amet expedita nisi. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1198, to_date('21-10-2007', 'dd-mm-yyyy'), 'excel', 'quibusdam ad aut soluta doloribus repellat consequatur sunt a dolor.  cumque sunt voluptates veniam velit non ea in cupiditate est.  dolore nulla nobis proident et voluptatibus blanditiis est debitis omnis.  voluptatum nam sunt optio minim molestias aut a');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1199, to_date('26-03-2005', 'dd-mm-yyyy'), 'pdf', 'ad ducimus officia aute velit itaque culpa et est optio.  eveniet occaecat irure commodo ea in mollit et aliqua ut.  ut do deserunt nostrud quas perferendis ut qui quo temporibus.  eos et itaque rerum in cupidatat possimus quod sint amet.  itaque maiores ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1200, to_date('12-11-2015', 'dd-mm-yyyy'), 'excel', 'non praesentium quas temporibus nihil omnis soluta odio culpa at.  placeat molestias ut id. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1201, to_date('23-06-2017', 'dd-mm-yyyy'), 'excel', 'qui fugiat hic atque ea ut perferendis similique accusamus iusto.  alias dolor ut atque maxime iusto ut nam omnis in.  ad anim amet omnis assumenda laborum sapiente id quibusdam iusto.  ipsum ipsum qui facere distinctio non recusandae aut et perferendis. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1202, to_date('13-02-2018', 'dd-mm-yyyy'), 'pdf', 'iusto esse aliquip voluptas laboris optio cupiditate pariatur consectetur anim.  at anim consequatur duis facere in aut id saepe facilis.  sint et hic minus atque rerum dolores tempor. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1203, to_date('30-09-2011', 'dd-mm-yyyy'), 'pdf', 'et nam anim debitis asperiores hic maxime quibusdam iusto elit.  veniam fugiat minim praesentium libero tempore harum harum et et.  laborum elit culpa lorem laborum deserunt molestias quos ut et.  sapiente et cum dolorum aut pariatur laborum tempore moles');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1204, to_date('30-09-2009', 'dd-mm-yyyy'), 'pdf', 'deleniti officia omnis libero autem qui et soluta cum qui.  quos omnis delectus pariatur impedit harum in. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1205, to_date('16-02-2001', 'dd-mm-yyyy'), 'word', 'consequatur dolorum iusto accusamus dolorum qui libero cupidatat reiciendis aut.  maxime necessitatibus odio culpa quo alias rerum sunt expedita quidem.  dolorum et eveniet duis odio aut repellat do ullamco cupidatat.  molestiae temporibus et soluta eos a');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1206, to_date('28-12-2002', 'dd-mm-yyyy'), 'excel', 'sapiente deleniti odio amet nobis aliqua eligendi quod maiores rerum.  sunt occaecat eveniet in sit optio optio. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1207, to_date('28-05-2021', 'dd-mm-yyyy'), 'excel', 'et temporibus quas molestiae. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1208, to_date('27-11-2021', 'dd-mm-yyyy'), 'word', 'dolore lorem. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1209, to_date('04-08-2010', 'dd-mm-yyyy'), 'pdf', 'perferendis ex mollit optio et assumenda distinctio nam sapiente praesentium.  distinctio rerum eu cumque aliquip dignissimos debitis placeat adipisicing cupiditate.  sint do nostrud anim deserunt ut atque sapiente nostrud quo.  debitis rerum adipisicing ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1210, to_date('20-05-2010', 'dd-mm-yyyy'), 'pdf', 'maiores tempore aut sunt eos molestias occaecati atque rerum ut.  minus irure est reiciendis in accusamus nulla culpa provident excepturi.  ut dignissimos aut occaecati veniam culpa eos. ');
commit;
prompt 100 records committed...
insert into REPORTS (report_id, creation_date, report_type, content)
values (1211, to_date('26-11-2007', 'dd-mm-yyyy'), 'pdf', 'perferendis ut similique exercitation et irure autem qui facere. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1212, to_date('06-04-2010', 'dd-mm-yyyy'), 'word', 'id et vero magna mollit est reiciendis aute delectus expedita.  enim et adipisicing libero tenetur a possimus sunt dolorum in.  non labore cupidatat duis ducimus fugiat nisi commodo nisi rerum.  veniam proident tempore sunt repellendus repudiandae est est');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1213, to_date('01-03-2001', 'dd-mm-yyyy'), 'pdf', 'temporibus et aut et ad dolor est atque laborum esse.  assumenda aut odio possimus distinctio saepe odio et rerum culpa.  ea in minus aut est tempore sint laborum soluta lorem.  facilis facere et facere et sint quibusdam repudiandae dignissimos consequat.');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1214, to_date('17-09-2007', 'dd-mm-yyyy'), 'word', 'ut aliquip voluptatum qui culpa est dolor ipsum et animi.  in tempor est laborum sint minus ducimus exercitation excepturi sint.  debitis consequatur quas deserunt tenetur voluptas in lorem lorem expedita.  non expedita ut irure quibusdam dolor deleniti f');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1215, to_date('15-02-2002', 'dd-mm-yyyy'), 'excel', 'est alias laborum alias necessitatibus impedit sit tempore exercitation aute.  culpa nam sit hic ut distinctio eos ut ut laborum.  ullamco in quibusdam autem qui autem omnis occaecat et pariatur.  facilis in est quas maiores deserunt voluptate optio amet ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1216, to_date('21-10-2004', 'dd-mm-yyyy'), 'word', 'itaque mollitia eos aliquip repellendus ipsum aut qui est rerum.  officiis consectetur fuga facilis blanditiis necessitatibus tempor reiciendis voluptas et.  maxime culpa odio culpa sint iusto eu. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1217, to_date('02-06-2022', 'dd-mm-yyyy'), 'pdf', 'a nostrud. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1218, to_date('13-10-2001', 'dd-mm-yyyy'), 'word', 'et optio in nam omnis in est facere delectus minim.  dolor ea reiciendis quibusdam et repellat maiores non iusto molestias.  tempor ad consequatur nisi aliquip incididunt repudiandae. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1219, to_date('02-07-2021', 'dd-mm-yyyy'), 'pdf', 'est placeat sapiente provident recusandae exercitation atque labore dolorum voluptatum.  culpa consequatur facere laborum delectus lorem animi aliquip consectetur aliqua.  non laborum laborum aut voluptates dolores in tenetur occaecat at.  voluptatibus mo');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1220, to_date('05-04-2008', 'dd-mm-yyyy'), 'word', 'similique rerum accusamus nam in asperiores expedita saepe ullamco consectetur.  est et earum et excepturi et officia est sint sunt.  ex perferendis ducimus dolor et possimus animi quos id repellat.  distinctio nihil expedita et autem mollitia maxime occa');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1221, to_date('02-07-2002', 'dd-mm-yyyy'), 'word', 'minim in aut excepteur vero quis aut labore facilis quis.  fugiat quo eos non voluptate nihil ut ad ut ut.  libero consequat qui a elit facilis est eligendi amet sint.  similique labore perferendis duis magna et at et dolore provident.  molestias delectus');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1222, to_date('01-08-2017', 'dd-mm-yyyy'), 'excel', 'mollit. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1223, to_date('02-12-2010', 'dd-mm-yyyy'), 'word', 'blanditiis in optio praesentium odio nobis debitis quo anim est.  quos corrupti fuga animi id debitis ad nulla qui cumque.  est deleniti eos id irure dolore dolore deserunt elit soluta.  amet et sit necessitatibus qui a repellat necessitatibus id blanditi');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1224, to_date('12-10-2017', 'dd-mm-yyyy'), 'word', 'et provident doloribus non officia molestias blanditiis consequat praesentium fugiat.  et lorem eos mollitia autem et reiciendis harum eiusmod deserunt.  et reiciendis accusamus ut cum molestias omnis nobis maiores nulla.  tempor sapiente optio sint nostr');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1225, to_date('25-03-2001', 'dd-mm-yyyy'), 'excel', 'in id occaecat repudiandae tenetur autem atque accusamus nostrud est.  ex deserunt assumenda maxime est quis rerum quibusdam iusto irure.  libero commodo pariatur commodo culpa qui assumenda aut voluptas autem.  est voluptatum rerum cupiditate dignissimos');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1226, to_date('20-12-2006', 'dd-mm-yyyy'), 'pdf', 'vero tempore cum et lorem proident sint dolor repellat est.  occaecati eos id ut deserunt dignissimos aliquip fugiat ea pariatur.  a magna voluptates vero exercitation sint sed facilis quo est.  atque non consequat aut minim occaecati voluptates soluta. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1227, to_date('29-09-2000', 'dd-mm-yyyy'), 'word', 'ipsum ea veniam. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1228, to_date('13-11-2023', 'dd-mm-yyyy'), 'word', 'expedita aliqua consequat tempor pariatur pariatur. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1229, to_date('26-08-2009', 'dd-mm-yyyy'), 'pdf', 'tenetur tempor at asperiores rerum deleniti dolores quibusdam repellendus. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1230, to_date('24-05-2012', 'dd-mm-yyyy'), 'excel', 'nisi quod et delectus amet sed maxime et dolore possimus.  id rerum placeat eu anim mollit rerum repellat consequat aut.  omnis non soluta elit quibusdam voluptates aut odio dolor id.  eu in laboris hic est dolor cupiditate dignissimos quis ullamco.  dolo');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1231, to_date('26-05-2003', 'dd-mm-yyyy'), 'pdf', 'deserunt in a et earum dolore quo eligendi repudiandae a.  quidem in et culpa enim aut aut repellat consectetur itaque.  blanditiis odio asperiores quibusdam quos maiores culpa ut placeat quos.  ducimus officiis repellendus harum reiciendis sint ea offici');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1232, to_date('06-04-2023', 'dd-mm-yyyy'), 'pdf', 'consectetur perferendis autem aliqua esse alias nisi esse do dignissimos.  et possimus hic nostrud distinctio mollit rerum dolor cillum at.  est in id maxime deleniti ut. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1233, to_date('27-11-2020', 'dd-mm-yyyy'), 'pdf', 'repudiandae tenetur repellat occaecat maiores quas est perferendis proident earum.  cupiditate nam excepturi rerum sint dolor quidem sint occaecati itaque.  officia ex proident excepteur aut cupiditate mollitia possimus officiis sint.  duis saepe nihil de');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1234, to_date('01-03-2001', 'dd-mm-yyyy'), 'pdf', 'aut in laborum nulla libero et recusandae anim odio possimus.  ad facere enim dolorum elit ut. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1235, to_date('23-01-2008', 'dd-mm-yyyy'), 'excel', 'esse ea vero harum enim ullamco eu esse est maxime.  qui consectetur magna recusandae nostrud velit assumenda non nostrud id.  ullamco corrupti deserunt quo possimus et ut cum eos eligendi.  eiusmod eligendi necessitatibus ut facere ex omnis et praesentiu');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1236, to_date('08-04-2009', 'dd-mm-yyyy'), 'excel', 'asperiores rerum excepteur et itaque et cum similique non debitis.  dolor aut voluptate officia nobis molestiae magna nostrud ullamco itaque.  officia eveniet do eu deleniti qui qui voluptate voluptates ullamco.  id doloribus cumque possimus mollitia dese');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1237, to_date('17-08-2014', 'dd-mm-yyyy'), 'excel', 'id magna excepteur nisi a irure recusandae impedit enim hic.  non excepteur exercitation molestias non impedit dolorum minim ut blanditiis.  blanditiis rerum sint vero deleniti culpa earum dignissimos dolor iusto.  delectus molestias quis commodo ut qui r');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1238, to_date('17-06-2019', 'dd-mm-yyyy'), 'word', 'vero et labore praesentium aut pariatur accusamus id fuga dolores.  libero culpa facere sit id minim proident et ullamco maxime.  proident eveniet sit expedita non minim atque est ex quas.  reiciendis distinctio sed proident in quos at sunt sapiente moles');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1239, to_date('05-06-2022', 'dd-mm-yyyy'), 'word', 'in debitis maiores hic est repellat nihil et qui cillum.  esse qui culpa omnis excepturi ullamco aute sint et blanditiis.  est ipsum nisi culpa sint repellendus est est duis voluptas.  reprehenderit eveniet. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1240, to_date('24-10-2016', 'dd-mm-yyyy'), 'pdf', 'et praesentium quis repellat reprehenderit incididunt sint fugiat aute repudiandae.  id possimus in mollit quo sint dolorum est corrupti labore.  commodo harum laborum aut voluptates in provident in tenetur ut.  fuga nobis provident cum cum culpa ut accus');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1241, to_date('26-02-2000', 'dd-mm-yyyy'), 'word', 'repellat nulla dolor sunt aliquip est odio odio dolor voluptate.  eveniet qui occaecat aliquip vero atque et fugiat rerum aut.  quas mollitia est consectetur tempore elit proident dolore tempor doloribus.  saepe et temporibus in amet possimus mollit repel');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1242, to_date('20-01-2005', 'dd-mm-yyyy'), 'excel', 'dignissimos et doloribus deserunt sunt alias voluptas impedit culpa et.  mollit est proident deserunt dolore quas ut dolores deserunt ut.  velit nam in quo itaque perferendis libero est vero nulla.  excepturi sint ea et dolorum et occaecat consequatur cil');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1243, to_date('04-06-2015', 'dd-mm-yyyy'), 'excel', 'quos voluptates cupiditate cupidatat tempor repudiandae a anim est eveniet.  dolor velit non labore in cillum dolore aut culpa animi.  earum eveniet minus ut sint quibusdam eos maiores culpa dignissimos.  enim fugiat atque ut accusamus magna quis occaecat');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1244, to_date('24-07-2011', 'dd-mm-yyyy'), 'excel', 'nam tempore sunt in est deserunt id minus non dignissimos.  dolores alias dignissimos et praesentium et occaecati rerum voluptate aut.  non omnis sunt duis eiusmod hic ut harum. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1245, to_date('25-09-2022', 'dd-mm-yyyy'), 'excel', 'sint praesentium ut ex hic tenetur odio amet sunt ea.  culpa similique in rerum rerum delectus provident repellat facere sint.  sit culpa ut consequatur qui incididunt et id iusto eveniet.  dignissimos nam minim asperiores rerum cum irure ut id duis.  qui');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1246, to_date('10-10-2021', 'dd-mm-yyyy'), 'excel', 'officia necessitatibus saepe excepturi soluta. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1247, to_date('10-09-2002', 'dd-mm-yyyy'), 'word', 'et lorem deleniti eiusmod sunt irure alias dolorum eu id.  dolor earum consequat dignissimos et repellendus distinctio aut in in.  in expedita dolorum blanditiis dignissimos cumque assumenda hic dolorum delectus.  sunt corrupti enim possimus est at dolor ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1248, to_date('14-08-2007', 'dd-mm-yyyy'), 'excel', 'praesentium eveniet et deleniti quo atque ut omnis est non.  et et repellendus nisi lorem quod asperiores non omnis laborum.  repellat recusandae asperiores aliquip et distinctio tempor fugiat lorem ut.  distinctio voluptate provident sit voluptate occaec');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1249, to_date('30-09-2020', 'dd-mm-yyyy'), 'excel', 'et reiciendis dignissimos in temporibus et harum sunt et alias.  voluptates molestias dolore velit fuga cupidatat iusto cillum eligendi culpa.  rerum distinctio sunt consequatur blanditiis dolore tenetur praesentium voluptatum omnis.  tempore omnis nam et');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1250, to_date('22-06-2011', 'dd-mm-yyyy'), 'pdf', 'enim exercitation consequatur perferendis esse ut molestiae impedit rerum ad.  est labore facilis elit et repellendus laborum distinctio et id.  quidem eu do duis maxime sint qui ullamco sit ut.  in temporibus sint sit maiores cumque et quo praesentium du');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1251, to_date('03-05-2023', 'dd-mm-yyyy'), 'pdf', 'nisi non occaecat mollitia dolore sit dolore et ut deserunt.  cupiditate occaecat expedita eveniet dolor voluptate voluptatibus iusto doloribus tenetur.  consequat occaecat tenetur non repellendus amet ea nostrud ipsum ut.  cupidatat amet excepteur deseru');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1252, to_date('20-07-2018', 'dd-mm-yyyy'), 'excel', 'in quas ipsum occaecati dolores aliqua molestias tempor quo occaecat.  assumenda proident qui et qui accusamus dignissimos et ut amet.  aut consectetur officiis fugiat mollitia cillum quos incididunt officia perferendis.  nam aut ut ducimus est debitis om');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1253, to_date('12-09-2021', 'dd-mm-yyyy'), 'pdf', 'et in ut non do repellat dolor cupidatat aliqua ut.  aut hic mollitia id tempor et amet. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1254, to_date('08-06-2017', 'dd-mm-yyyy'), 'excel', 'est optio non elit corrupti exercitation qui cupidatat laboris rerum.  eiusmod officiis qui rerum culpa cupidatat qui eos qui doloribus.  nam culpa ut officia id et iusto nostrud dolorum repellendus.  fuga ut est odio facere provident et voluptas sit nam.');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1255, to_date('28-03-2013', 'dd-mm-yyyy'), 'word', 'qui cupiditate hic laborum impedit a amet provident qui ut.  eiusmod aut dolore velit soluta soluta animi sint ad dignissimos.  nam fuga nisi rerum in tempor maxime et mollit sapiente.  alias minim aliquip labore laboris earum est et culpa iusto.  tempori');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1256, to_date('02-05-2007', 'dd-mm-yyyy'), 'word', 'culpa debitis consequatur quos ut et doloribus ducimus duis sed.  rerum voluptatibus et earum repellat cillum anim deleniti aliqua duis.  est voluptatum earum cupidatat nisi incididunt possimus tenetur qui adipisicing.  et est laborum voluptate impedit al');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1257, to_date('30-12-2008', 'dd-mm-yyyy'), 'excel', 'est molestiae culpa ipsum nobis et laborum in est in.  iusto voluptate placeat et culpa non provident est deserunt dolor.  quo soluta sunt ut excepteur quo possimus magna et ut.  excepturi tempore distinctio deleniti reiciendis repudiandae amet quibusdam ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1258, to_date('04-09-2011', 'dd-mm-yyyy'), 'excel', 'consectetur itaque pariatur vero qui ut deserunt sapiente consectetur ut.  cupidatat qui eveniet mollit sit enim exercitation occaecati aut ad.  excepteur ad deleniti ut cillum id placeat facilis et a.  et reiciendis non occaecat aliqua eos occaecat omnis');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1259, to_date('24-01-2002', 'dd-mm-yyyy'), 'pdf', 'dolor dolor cum nostrud aut omnis sit quibusdam veniam omnis.  at cupiditate enim tempore possimus. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1260, to_date('23-12-2009', 'dd-mm-yyyy'), 'pdf', 'similique deserunt aliqua repellendus sunt tempore omnis laborum provident irure.  quidem deleniti sint in nihil vero ullamco minim tempor libero.  et blanditiis maiores et et eligendi libero libero ut occaecati.  iusto voluptate doloribus est rerum aut d');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1261, to_date('25-03-2002', 'dd-mm-yyyy'), 'excel', 'cillum delectus labore dolore minim placeat placeat non assumenda molestiae.  proident et recusandae in assumenda molestiae voluptates sed magna aliqua.  officia ex laborum in necessitatibus id pariatur possimus aliquip autem.  sint expedita labore evenie');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1262, to_date('27-10-2017', 'dd-mm-yyyy'), 'excel', 'enim repudiandae eiusmod cupiditate mollit molestias tempore do nobis eveniet.  et cupidatat molestiae quis dolore voluptates veniam quis eiusmod quas.  anim qui expedita dolore exercitation occaecati ad duis rerum blanditiis.  id sit eu accusamus iusto d');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1263, to_date('07-12-2010', 'dd-mm-yyyy'), 'word', 'quos et consectetur nam aliqua nisi aut dolorum accusamus libero.  eiusmod officiis repellat deleniti perferendis officiis voluptatibus deserunt rerum consectetur.  nulla in reprehenderit. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1264, to_date('27-06-2006', 'dd-mm-yyyy'), 'pdf', 'assumenda lorem maxime sunt facilis ut sunt in earum omnis.  ea eligendi et pariatur possimus necessitatibus temporibus quidem et minim.  ut ad omnis sapiente deserunt hic animi libero et repudiandae.  proident voluptatibus placeat dolores quibusdam cillu');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1265, to_date('02-08-2020', 'dd-mm-yyyy'), 'pdf', 'voluptas magna id cupiditate mollit placeat ut et iusto esse.  sapiente voluptatibus esse est ipsum itaque tempor proident doloribus laborum.  assumenda dolorum qui doloribus aut dolor aliquip voluptate dolor cupidatat.  recusandae nulla atque est pariatu');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1266, to_date('05-11-2007', 'dd-mm-yyyy'), 'pdf', 'eos at dignissimos officia rerum et provident voluptatibus veniam commodo.  ut aliquip consequat repellendus cum reprehenderit eos labore quas cillum.  anim labore repellat aut nihil asperiores assumenda maxime non dolore.  est soluta necessitatibus asper');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1267, to_date('22-11-2022', 'dd-mm-yyyy'), 'pdf', 'officia officia iusto voluptates asperiores soluta ut vero eiusmod est.  sit esse magna at corrupti deleniti laborum aut eiusmod aut.  id sunt deleniti doloribus eveniet expedita quidem sint assumenda optio.  nostrud ut esse esse magna eveniet cupiditate ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1268, to_date('12-08-2003', 'dd-mm-yyyy'), 'pdf', 'est cupiditate consectetur aut culpa alias dignissimos reprehenderit repudiandae recusandae.  omnis consectetur praesentium necessitatibus ullamco. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1269, to_date('20-04-2017', 'dd-mm-yyyy'), 'pdf', 'et incididunt laboris ex qui et qui esse cillum iusto.  dignissimos provident minus dolore aute facere et duis voluptatum praesentium.  quis nulla ut cum consectetur alias irure dignissimos vero et.  placeat proident dolor occaecat nisi alias minim labore');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1270, to_date('16-03-2022', 'dd-mm-yyyy'), 'pdf', 'non in exercitation est quod culpa reiciendis laborum et distinctio.  rerum dolores ut similique sed minim praesentium temporibus tenetur a.  occaecati veniam vero maiores non repellat officia itaque officiis sint.  harum consectetur placeat sint et ut no');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1272, to_date('14-04-2023', 'dd-mm-yyyy'), 'excel', 'consectetur alias ut quibusdam ut et amet enim repellat optio.  nisi repudiandae molestias quidem quibusdam et sint. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1273, to_date('17-03-2023', 'dd-mm-yyyy'), 'excel', 'omnis voluptas fuga est officia debitis ut laboris blanditiis adipisicing.  alias rerum facere deserunt cum eveniet assumenda soluta assumenda cillum.  voluptate id veniam voluptatibus ut at anim et et quis.  occaecat sunt delectus aut quis quibusdam quis');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1274, to_date('01-02-2004', 'dd-mm-yyyy'), 'pdf', 'consectetur expedita culpa dolor qui et laborum nostrud repudiandae corrupti.  dolorum atque libero placeat enim debitis eveniet elit quos recusandae.  id repellat facere elit et laboris et dolorum cupidatat quod.  in nisi sunt aute eligendi voluptatum et');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1275, to_date('13-11-2003', 'dd-mm-yyyy'), 'pdf', 'dolor expedita repellat voluptatibus id aliqua facere et et sunt.  accusamus praesentium et anim culpa sapiente aliquip nobis et rerum.  sit dolor odio labore reprehenderit anim facilis cupiditate culpa accusamus.  id a aut blanditiis dolore eos duis et r');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1276, to_date('01-06-2012', 'dd-mm-yyyy'), 'excel', 'iusto in in est a omnis assumenda et in ipsum.  soluta mollitia qui accusamus ipsum deserunt repellat tenetur expedita anim.  nihil eiusmod possimus ut harum quos non officia dignissimos omnis.  vero tenetur dignissimos in tenetur in voluptas cumque sunt ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1277, to_date('10-05-2009', 'dd-mm-yyyy'), 'word', 'at reprehenderit et perferendis dolores commodo repellendus dolor saepe provident.  libero esse magna repellat eveniet irure nisi a in ducimus.  debitis occaecat reiciendis tempor sunt officia atque magna optio et.  quas cum repudiandae reprehenderit volu');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1278, to_date('24-03-2023', 'dd-mm-yyyy'), 'word', 'hic ut dolorum veniam id maxime et amet accusamus voluptate.  rerum ipsum eu consequatur provident aut molestiae qui aut atque.  occaecati atque minim fuga elit ipsum expedita sunt veniam minus.  rerum optio iusto saepe rerum necessitatibus id tempor aut ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1279, to_date('01-01-2006', 'dd-mm-yyyy'), 'excel', 'qui et eu excepturi lorem dolor sint dolorum expedita sint.  blanditiis aliquip rerum provident et asperiores molestiae et ea cupidatat.  nobis provident nihil dolor temporibus vero distinctio maiores cillum iusto.  mollitia sit fuga dolor omnis animi at ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1280, to_date('04-11-2023', 'dd-mm-yyyy'), 'word', 'asperiores aliqua non nisi ducimus qui incididunt cupidatat id maiores.  cillum maxime cumque et do necessitatibus sit ut anim sunt.  qui ad molestiae sint ducimus et deleniti similique officiis reprehenderit.  excepturi do quis reiciendis in lorem nisi l');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1281, to_date('04-06-2017', 'dd-mm-yyyy'), 'excel', 'tenetur commodo necessitatibus minim necessitatibus iusto laborum tempor reprehenderit consequatur.  libero cumque tempor ut culpa similique fugiat exercitation id optio.  est exercitation tempor hic facere quibusdam consectetur duis sit consequat.  digni');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1282, to_date('09-01-2018', 'dd-mm-yyyy'), 'pdf', 'tempore et sint accusamus culpa omnis et tenetur occaecat minim.  at necessitatibus doloribus officia aliqua sint officiis voluptatum id molestiae.  officiis dolores et facilis cupidatat corrupti excepteur cupidatat aliqua laboris.  aliqua ut eos hic moll');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1283, to_date('12-11-2011', 'dd-mm-yyyy'), 'word', 'autem sapiente anim aut minus laborum aut id incididunt sapiente.  mollit veniam nihil est reiciendis dolore ut pariatur culpa lorem.  dignissimos itaque eiusmod eos qui officia omnis maiores voluptas ut.  officia et recusandae sapiente maxime saepe ad su');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1284, to_date('07-12-2014', 'dd-mm-yyyy'), 'excel', 'voluptate minus tempor laborum omnis veniam commodo impedit similique cupiditate.  ea nihil molestiae deserunt culpa in magna commodo et accusamus.  corrupti saepe nobis placeat facere culpa cillum nulla deleniti aut.  in do eveniet sit dolor laborum ut v');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1285, to_date('28-05-2015', 'dd-mm-yyyy'), 'word', 'in culpa in mollitia praesentium assumenda exercitation cupidatat cupiditate animi.  blanditiis labore fugiat do libero veniam et aliquip quidem dolor.  placeat alias occaecat culpa in soluta et et in ut.  asperiores perferendis culpa in necessitatibus do');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1286, to_date('19-03-2005', 'dd-mm-yyyy'), 'pdf', 'fugiat in provident culpa commodo distinctio labore nisi sapiente omnis.  voluptas itaque deserunt dolore magna et maiores temporibus blanditiis tenetur.  consectetur occaecat labore officiis et ipsum non doloribus labore nihil.  nulla ut recusandae simil');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1287, to_date('06-04-2023', 'dd-mm-yyyy'), 'word', 'culpa enim eos itaque voluptates aut odio aut id elit.  ut dignissimos deserunt voluptatibus deleniti exercitation do perferendis aliqua fugiat.  deserunt in fuga possimus aut et nam dolor id nisi.  voluptates dolore dolores occaecati anim quis. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1288, to_date('23-12-2023', 'dd-mm-yyyy'), 'word', 'sint et dolor lorem mollitia et eu ad culpa autem.  proident rerum possimus aut deleniti distinctio et elit omnis laborum.  in dolores excepteur soluta non et elit ut debitis atque.  et rerum proident vero dolores dolore voluptatum nihil est dolor.  incid');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1289, to_date('11-08-2012', 'dd-mm-yyyy'), 'pdf', 'ut at sunt tenetur et cupiditate dolore hic. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1290, to_date('16-04-2017', 'dd-mm-yyyy'), 'excel', 'anim non quis perferendis et facere commodo et qui ut.  tempor consequatur reiciendis occaecat esse provident et aut et labore.  excepturi facere dignissimos voluptatibus ex mollitia ut vero qui enim.  nulla laboris veniam dolor voluptatibus corrupti cons');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1291, to_date('30-03-2008', 'dd-mm-yyyy'), 'excel', 'dolor sint anim officia aut repellat id corrupti in laborum.  necessitatibus non in aliqua repellendus irure amet asperiores ducimus voluptas.  commodo. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1292, to_date('28-10-2003', 'dd-mm-yyyy'), 'word', 'culpa anim quas sit est distinctio dignissimos ut cumque sunt.  velit dolorum laborum non sint molestiae et dolor expedita ad.  excepturi animi amet dolore mollit voluptatum molestias consequat dolore non.  culpa provident debitis quod excepteur voluptate');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1293, to_date('26-07-2015', 'dd-mm-yyyy'), 'pdf', 'distinctio expedita aut voluptates do duis nobis sit consequat repudiandae.  et in dolores amet deleniti nulla odio dolor soluta molestiae.  blanditiis. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1294, to_date('24-09-2014', 'dd-mm-yyyy'), 'pdf', 'ducimus itaque lorem quas aut mollit qui voluptatum et earum.  voluptatibus magna blanditiis facilis molestias facilis odio consectetur odio ut.  tempor saepe excepteur at blanditiis omnis dolor amet omnis recusandae.  est nihil enim voluptates aliqua ani');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1295, to_date('21-10-2017', 'dd-mm-yyyy'), 'excel', 'qui quibusdam blanditiis aut similique cupidatat animi in incididunt rerum.  dolore lorem nulla aut voluptatibus cumque culpa eveniet earum ex.  voluptatibus eiusmod repudiandae facere est est qui placeat sint sunt.  et et dolorum incididunt aute atque do');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1296, to_date('13-01-2018', 'dd-mm-yyyy'), 'pdf', 'ea rerum in corrupti similique temporibus omnis a. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1297, to_date('18-02-2001', 'dd-mm-yyyy'), 'word', 'magna mollit exercitation velit dignissimos assumenda. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1298, to_date('26-12-2013', 'dd-mm-yyyy'), 'excel', 'praesentium anim sed do ut praesentium officia et pariatur doloribus.  expedita deserunt quidem velit quis rerum consectetur ut ut culpa.  quos dolor recusandae dolor atque deserunt nulla harum impedit culpa.  lorem consequat reiciendis eiusmod necessitat');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1299, to_date('07-11-2005', 'dd-mm-yyyy'), 'word', 'est quibusdam minim ea corrupti hic repellendus ut soluta rerum.  anim id occaecati id cum quas proident et sint alias.  nostrud officia reiciendis fuga facilis voluptatum recusandae cillum quod tempor.  tempore et itaque pariatur consequat id est at duis');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1300, to_date('10-09-2019', 'dd-mm-yyyy'), 'pdf', 'quidem impedit adipisicing maxime quo repudiandae et qui. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1301, to_date('01-02-2018', 'dd-mm-yyyy'), 'word', 'incididunt omnis mollitia assumenda nam dolor et excepturi accusamus adipisicing.  et dolores est voluptatum sint elit id incididunt non minus.  id exercitation et et elit rerum a et occaecat occaecati.  ea blanditiis omnis elit ea qui. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1302, to_date('05-07-2000', 'dd-mm-yyyy'), 'pdf', 'placeat accusamus excepteur laborum molestias ullamco earum quas est cillum.  voluptatum iusto a minus laborum ea aut corrupti sapiente harum.  repudiandae deserunt dignissimos ullamco minus harum quidem voluptates aut et.  et eligendi mollit at non rerum');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1303, to_date('14-02-2009', 'dd-mm-yyyy'), 'pdf', 'ut hic quas vero ipsum commodo voluptate et sint eveniet.  deserunt animi est facilis ex lorem repellat magna alias est.  cumque aut consequat in quas quas temporibus libero omnis perferendis.  aut in officia velit id dolore sed est consequat saepe.  cons');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1304, to_date('23-03-2022', 'dd-mm-yyyy'), 'word', 'exercitation dolore tempore voluptates blanditiis aliqua incididunt a est doloribus.  debitis laboris libero mollit dignissimos impedit deserunt omnis voluptas ut.  velit incididunt culpa amet irure ut minim et voluptas voluptates.  occaecat molestias lor');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1305, to_date('25-01-2022', 'dd-mm-yyyy'), 'word', 'sunt cum nobis qui nobis eu aliquip commodo ut placeat.  deleniti provident in id assumenda dolore sint anim et mollit.  dolor recusandae dolor fugiat et velit rerum sed expedita qui.  voluptate est mollit aliqua do perferendis aute in et minus.  omnis of');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1306, to_date('17-11-2005', 'dd-mm-yyyy'), 'excel', 'culpa voluptatum repellat rerum voluptas temporibus ipsum autem in culpa.  dolores est laborum in officia nisi maxime officia eos ut.  laborum tempor sunt ut cupidatat et ex deserunt et voluptates.  optio omnis ipsum aute dolorum ex blanditiis cum veniam ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1307, to_date('24-06-2001', 'dd-mm-yyyy'), 'pdf', 'repellat ipsum nulla minus id expedita dolorum sint veniam quod.  non sint non hic molestias voluptate nam commodo est elit.  et reiciendis aut et molestiae deleniti sed ducimus mollit anim.  alias ex consequatur aut consequatur recusandae fuga sint maxim');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1308, to_date('13-01-2012', 'dd-mm-yyyy'), 'pdf', 'maxime in. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1309, to_date('16-12-2004', 'dd-mm-yyyy'), 'word', 'voluptas lorem nihil tempor debitis nihil sint recusandae et lorem.  maiores asperiores rerum molestias harum tempore officia amet officiis provident.  et asperiores sint lorem libero officiis voluptatum ut iusto elit.  quis dolor consequatur. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (1310, to_date('10-06-2000', 'dd-mm-yyyy'), 'pdf', 'nisi est cumque anim incididunt quos excepturi facilis cillum cupidatat.  ea alias perferendis distinctio in et culpa duis nihil sint.  consequatur esse officia qui eveniet in officia sapiente lorem quis.  aliqua est commodo accusamus voluptates minus ips');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2222, to_date('25-01-2023', 'dd-mm-yyyy'), 'excel', 'officia et hic velit exercitation et rerum qui fugiat culpa.  enim et nam libero ut id minus deserunt est. ');
commit;
prompt 200 records committed...
insert into REPORTS (report_id, creation_date, report_type, content)
values (2223, to_date('04-09-2011', 'dd-mm-yyyy'), 'word', 'atque necessitatibus tenetur praesentium temporibus molestiae id ducimus atque et.  aut. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2224, to_date('29-05-2008', 'dd-mm-yyyy'), 'pdf', 'occaecat consequatur nam rerum assumenda labore et molestias id non.  nam ut debitis est lorem sint impedit accusamus dignissimos qui.  id sint nulla facere dignissimos id et qui id esse.  tempore nam et delectus et. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2225, to_date('30-08-2017', 'dd-mm-yyyy'), 'word', 'non eiusmod nam. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2226, to_date('10-05-2018', 'dd-mm-yyyy'), 'word', 'debitis possimus quas perferendis id et voluptatum voluptate blanditiis praesentium.  duis eu possimus dolorum libero alias sunt commodo provident in.  quos. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2227, to_date('09-03-2002', 'dd-mm-yyyy'), 'excel', 'qui rerum non quas anim necessitatibus ut repellat accusamus consequatur.  sint dolore dolor ut alias voluptatum recusandae ducimus occaecat ut.  temporibus soluta elit distinctio excepturi soluta rerum laborum id fugiat.  qui culpa est excepturi culpa ut');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2228, to_date('06-11-2015', 'dd-mm-yyyy'), 'pdf', 'officia ad anim aliqua adipisicing delectus exercitation cupidatat non dolor.  ut consectetur qui et autem rerum et perferendis elit repellendus.  voluptas occaecat hic sint temporibus pariatur dolore animi aut rerum.  quas perferendis a dolor et sint non');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2229, to_date('20-10-2008', 'dd-mm-yyyy'), 'excel', 'deserunt cumque sapiente mollit repudiandae eos sed tempor temporibus mollitia.  qui dolore est in deleniti ullamco voluptatibus deserunt blanditiis enim.  veniam aute et et repellendus et atque temporibus expedita eligendi.  minim provident optio debitis');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2230, to_date('18-08-2005', 'dd-mm-yyyy'), 'pdf', 'dolore laborum sunt. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2231, to_date('14-02-2003', 'dd-mm-yyyy'), 'word', 'hic omnis vero quis repellendus aut soluta non labore enim.  aliqua provident dolore ut corrupti anim et et cum amet.  reprehenderit odio do voluptatibus nisi saepe dolores repellendus harum voluptatibus.  et deserunt molestias omnis quas minus et asperio');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2232, to_date('10-06-2000', 'dd-mm-yyyy'), 'pdf', 'rerum doloribus dolore minim assumenda consequat ut corrupti ullamco itaque.  est aute reprehenderit aute sapiente deserunt est rerum maiores ut.  id et quidem ullamco itaque dolore non velit necessitatibus voluptate.  reiciendis. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2233, to_date('06-09-2019', 'dd-mm-yyyy'), 'word', 'alias qui anim eos aute provident repellat officia et ea.  labore reiciendis nihil eveniet dolorum ut provident sunt sint accusamus.  maxime delectus animi repudiandae et veniam qui ea cum ducimus.  esse aut eos cumque ex impedit dolores occaecat voluptat');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2234, to_date('20-10-2001', 'dd-mm-yyyy'), 'word', 'maiores voluptas voluptate est deserunt ipsum harum duis elit delectus.  maiores et ullamco aut alias in occaecat sit accusamus officiis.  soluta cillum dolore tempor et incididunt dolor excepteur aut cillum.  id reiciendis autem sit necessitatibus aut re');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2235, to_date('25-06-2012', 'dd-mm-yyyy'), 'pdf', 'repudiandae deserunt et enim culpa minim sunt dolor excepturi officia.  officia asperiores placeat et repellendus sunt et sapiente assumenda fugiat.  eu placeat commodo officia dolore qui non eos. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2236, to_date('02-03-2017', 'dd-mm-yyyy'), 'word', 'soluta consequat occaecat et id adipisicing mollitia quidem consectetur tempore.  vero facilis commodo deserunt qui culpa nostrud nihil cupiditate placeat.  laborum irure excepteur sapiente distinctio vero sit reiciendis facere non.  sed sint pariatur ut ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2237, to_date('26-12-2010', 'dd-mm-yyyy'), 'excel', 'dolor libero dolor consequatur sed placeat cumque officia assumenda rerum.  et quidem officia incididunt assumenda laborum odio et recusandae blanditiis.  dolore saepe rerum et autem distinctio sint dolor earum dolorum.  tempore nulla aliqua quis optio ni');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2238, to_date('20-04-2004', 'dd-mm-yyyy'), 'pdf', 'et delectus enim laborum repudiandae vero ad officia fuga consequat.  labore amet excepturi adipisicing eu iusto quos et autem at.  voluptates elit dolor cupidatat nihil qui sint eiusmod dolorum et.  alias ut qui sapiente repellendus enim omnis quod volup');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2239, to_date('19-11-2009', 'dd-mm-yyyy'), 'pdf', 'vero et dolorum voluptas deserunt hic repellendus tempor et sint.  omnis elit cillum provident est nisi aut id iusto deserunt.  est incididunt voluptas fugiat ullamco excepteur voluptas rerum quod id.  maxime similique consectetur quas ullamco ut atque de');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2240, to_date('15-11-2017', 'dd-mm-yyyy'), 'pdf', 'expedita exercitation corrupti eu blanditiis laborum eligendi doloribus qui incididunt.  sit ducimus possimus exercitation officia minim exercitation tempore mollit aut.  fugiat harum eu amet repudiandae ut voluptatibus id in irure.  at facilis dolore lab');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2241, to_date('03-05-2014', 'dd-mm-yyyy'), 'pdf', 'molestiae aut rerum minim itaque molestias ducimus occaecati in et.  pariatur eiusmod recusandae corrupti nam saepe accusamus animi sint cupiditate.  mollitia quod dolorum sint id soluta ducimus saepe provident aut.  pariatur est nobis quis ut expedita ha');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2242, to_date('30-01-2002', 'dd-mm-yyyy'), 'word', 'sint odio reiciendis facere aliqua odio in non. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2243, to_date('14-05-2009', 'dd-mm-yyyy'), 'pdf', 'et laborum et dolor nihil provident est voluptates mollit occaecat.  quos id harum est voluptates quas saepe est veniam iusto.  deserunt voluptates exercitation dolores deserunt do ut est aut iusto.  et praesentium cillum itaque qui in ea cum hic minus.  ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2244, to_date('06-06-2011', 'dd-mm-yyyy'), 'pdf', 'elit provident commodo id aut nobis quas molestiae eligendi irure.  tempore maiores facilis saepe rerum ex provident doloribus similique sint.  quo non fuga assumenda dolor voluptates sapiente dolor dignissimos et.  et aut vero sunt labore eos non similiq');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2245, to_date('04-01-2023', 'dd-mm-yyyy'), 'pdf', 'laborum ducimus excepteur eveniet aliquip et sunt dolorum anim laborum.  deserunt dolor voluptatum culpa in in deserunt et assumenda deserunt.  rerum minus non elit est atque deserunt debitis anim perferendis.  culpa est sit soluta eligendi aut consequatu');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2246, to_date('22-02-2023', 'dd-mm-yyyy'), 'word', 'cumque voluptatum aut soluta in quo consectetur qui et id.  provident veniam qui aut est non consequat deleniti facere saepe.  cumque eiusmod sint sunt nam in quos expedita possimus est.  cumque cumque repellat alias irure fugiat necessitatibus non occaec');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2247, to_date('27-06-2020', 'dd-mm-yyyy'), 'pdf', 'sint molestiae occaecati officiis officia assumenda consectetur sunt et id.  pariatur consequat et recusandae mollit asperiores. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2248, to_date('09-09-2013', 'dd-mm-yyyy'), 'word', 'ut blanditiis et possimus sint cillum quis non reprehenderit labore.  aute facere recusandae sapiente aut laborum id proident autem hic.  aut voluptate mollitia eveniet saepe cum mollitia autem tenetur nulla.  saepe dolor. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2249, to_date('08-03-2003', 'dd-mm-yyyy'), 'excel', 'et quibusdam et possimus officiis rerum consectetur consequatur ducimus molestias.  ut et itaque laborum ut debitis dolor minim fuga saepe.  animi fuga rerum rerum tenetur dolor est eos sapiente et.  dolor est voluptatum at aut qui et voluptates est occae');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2251, to_date('10-10-2011', 'dd-mm-yyyy'), 'excel', 'in libero ad molestias impedit repellat quidem temporibus recusandae et.  occaecati omnis esse cupiditate assumenda proident est occaecati impedit aut.  est do itaque dolor minus et dolores corrupti occaecat deleniti.  non eiusmod ut voluptate eveniet del');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2252, to_date('03-09-2012', 'dd-mm-yyyy'), 'excel', 'rerum assumenda et eos delectus irure similique anim rerum veniam.  soluta laborum deserunt excepturi excepteur. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2253, to_date('04-07-2021', 'dd-mm-yyyy'), 'excel', 'laboris ut rerum recusandae sapiente cillum temporibus impedit officia voluptatibus.  cupidatat dignissimos accusamus quis consectetur ad lorem animi rerum velit.  sunt voluptatum dignissimos consequat aut nihil minus mollit. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2254, to_date('05-02-2018', 'dd-mm-yyyy'), 'pdf', 'id consequatur nihil saepe animi duis qui placeat nostrud labore.  esse saepe consequat adipisicing repellat non est minim culpa nam.  minim exercitation atque hic minus id magna in consectetur cillum.  voluptatibus anim et non culpa perferendis pariatur ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2255, to_date('07-07-2010', 'dd-mm-yyyy'), 'word', 'incididunt et do doloribus facilis asperiores et omnis dignissimos eligendi.  et enim officia iusto sint in reiciendis impedit tempor debitis.  adipisicing ea in dolor consequatur. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2256, to_date('31-12-2000', 'dd-mm-yyyy'), 'pdf', 'dolores cupidatat in excepturi et dolore accusamus mollitia nostrud ut.  non rerum est dolore est sunt perferendis maiores ad voluptas.  aliquip molestias earum et perferendis harum cupiditate et voluptate dolor.  sint pariatur fuga voluptate cumque tempo');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2257, to_date('10-08-2005', 'dd-mm-yyyy'), 'word', 'officia facere esse excepteur dolores sint fuga non esse quidem.  saepe consectetur libero nam et in ut sunt occaecati iusto.  similique tenetur maxime ut eveniet accusamus id nobis sunt et.  doloribus harum saepe cupidatat fugiat dolores eos non minim ma');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2258, to_date('09-11-2008', 'dd-mm-yyyy'), 'word', 'placeat aut voluptate et sapiente et repudiandae nam aut cillum.  recusandae in soluta et id a officia dolore hic occaecati.  omnis ducimus aliqua et rerum ullamco dignissimos nam ex consequatur.  hic est irure quo sunt et ullamco ut rerum voluptatibus.  ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2259, to_date('16-06-2001', 'dd-mm-yyyy'), 'excel', 'delectus excepturi nulla qui alias recusandae officia voluptatibus eiusmod recusandae.  culpa rerum aut incididunt voluptate sunt. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2260, to_date('24-01-2006', 'dd-mm-yyyy'), 'excel', 'in ut sint est sunt ex ea consectetur mollitia cumque.  dolor odio quas ex. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2261, to_date('02-08-2008', 'dd-mm-yyyy'), 'pdf', 'quod adipisicing voluptatibus non nam anim reprehenderit sit nobis et.  deserunt quos cillum sint velit molestiae fugiat perferendis omnis libero.  ducimus officia enim magna dolores deserunt ex reiciendis a est.  ut qui laboris corrupti nulla mollit et o');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2262, to_date('25-07-2014', 'dd-mm-yyyy'), 'word', 'quidem quod nulla duis qui iusto atque veniam voluptate in.  recusandae et et eu est tempor iusto aut cillum labore.  id elit proident ullamco culpa ut fugiat accusamus proident fugiat.  dolores ullamco consequatur nulla rerum sunt ducimus veniam reprehen');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2263, to_date('14-03-2013', 'dd-mm-yyyy'), 'excel', 'dolores facere et ea qui dolor tempor fugiat atque autem.  omnis laborum distinctio eligendi deleniti aute id odio ut in.  iusto hic cillum a aliquip sit qui a hic quibusdam.  et irure dolore quas temporibus harum ut lorem repellat possimus.  quas accusam');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2264, to_date('13-03-2006', 'dd-mm-yyyy'), 'word', 'eveniet est eveniet dolor fugiat consectetur vero assumenda voluptate dolore.  in nulla proident a dolore possimus sed earum dolor incididunt.  alias est dolore deserunt et eligendi reprehenderit culpa nostrud eveniet.  aliqua rerum voluptas officia qui e');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2265, to_date('27-07-2010', 'dd-mm-yyyy'), 'excel', 'nihil officiis molestias sint esse voluptate quos rerum deserunt fugiat.  et hic magna anim omnis laboris voluptatum et dolor aut.  voluptatibus tenetur quas voluptates est quis quis rerum officia excepteur.  aut et impedit pariatur dolore elit quod sunt ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2266, to_date('03-03-2014', 'dd-mm-yyyy'), 'excel', 'minus laborum sunt adipisicing quidem dolores doloribus deserunt maxime provident.  excepteur ex est et quibusdam in ducimus tempore fuga cupiditate.  assumenda repellendus commodo fugiat reiciendis quo dolore quis repellat sint.  itaque deserunt cum plac');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2267, to_date('20-02-2009', 'dd-mm-yyyy'), 'word', 'dolor et doloribus dolore et ut laborum aute iusto eos.  odio ea odio tenetur minus repellat voluptate et voluptatum pariatur.  aliqua non cumque non aut cupidatat excepteur dolorum esse optio.  atque fuga dolorum maiores nobis et animi laborum id aut.  a');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2268, to_date('16-01-2000', 'dd-mm-yyyy'), 'pdf', 'amet quas est saepe tempor nobis magna hic blanditiis autem.  dignissimos earum sed est proident est facilis ut quo laborum.  est distinctio molestiae repellat facere repellat debitis animi voluptate incididunt.  debitis nostrud consequatur elit repellend');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2269, to_date('31-05-2018', 'dd-mm-yyyy'), 'pdf', 'tenetur sunt et dolor laborum ipsum provident harum repudiandae sunt.  anim hic blanditiis nobis earum mollit ducimus dolor et est.  similique voluptas commodo velit fugiat nihil incididunt sint rerum et.  lorem cum sed veniam qui eveniet nam pariatur nis');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2270, to_date('14-05-2009', 'dd-mm-yyyy'), 'pdf', 'et et consequat dolorum ut et qui voluptas provident repudiandae.  nisi cum laborum tempor maiores eos aut aut et est.  placeat cum tenetur nulla temporibus deleniti dolor mollitia rerum aut.  esse eveniet ea delectus deserunt libero voluptatibus cillum a');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2271, to_date('11-10-2021', 'dd-mm-yyyy'), 'word', 'aute sunt quibusdam rerum quibusdam nostrud quibusdam veniam sunt libero.  nihil dolorum eligendi sint cupidatat irure eiusmod temporibus sint enim.  eos laboris est culpa aut culpa aut eos et dolores.  occaecat deserunt placeat quibusdam minus sint nulla');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2272, to_date('26-11-2003', 'dd-mm-yyyy'), 'pdf', 'minus exercitation culpa quibusdam consequat sunt atque eveniet est do.  pariatur velit molestias id cillum eu voluptas placeat possimus in.  adipisicing placeat maiores animi molestias qui occaecati dolores rerum hic.  minim ducimus harum sunt mollit omn');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2273, to_date('08-08-2012', 'dd-mm-yyyy'), 'word', 'tenetur et lorem et consectetur aut voluptates sunt nihil ut.  doloribus nostrud hic laboris do quidem mollitia culpa autem veniam. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2274, to_date('24-03-2006', 'dd-mm-yyyy'), 'excel', 'nostrud recusandae tempor temporibus libero minim adipisicing pariatur fugiat qui.  molestiae eveniet adipisicing deleniti nisi dolorum accusamus omnis pariatur rerum.  sunt a dolore qui officia distinctio dolor eveniet cillum proident.  excepturi laboris');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2275, to_date('16-05-2018', 'dd-mm-yyyy'), 'pdf', 'nam qui laborum quo dolor ad ut exercitation est necessitatibus.  dolorum deserunt proident. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2276, to_date('17-10-2023', 'dd-mm-yyyy'), 'excel', 'ducimus ut in non est doloribus excepteur occaecati atque nobis.  deleniti esse doloribus aut est ut dolores pariatur voluptatibus nostrud.  sunt ex vero sapiente qui do perferendis est a in.  perferendis ex alias provident ullamco mollitia id aut possimu');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2277, to_date('21-12-2001', 'dd-mm-yyyy'), 'word', 'ut repellendus quo harum et in impedit et soluta aliquip.  dolore omnis in at eos mollit molestias id sapiente a.  minus rerum corrupti qui ducimus id veniam autem dolor tempore.  id irure voluptate non voluptatum quis rerum repellendus dignissimos quod. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2278, to_date('22-06-2003', 'dd-mm-yyyy'), 'excel', 'ea et corrupti et nulla recusandae maxime cupidatat voluptates aliqua.  consectetur deserunt id accusamus possimus alias ut eu culpa ullamco.  mollitia fugiat occaecati nostrud rerum voluptates corrupti repellat facilis magna.  ut est delectus qui repudia');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2279, to_date('03-01-2001', 'dd-mm-yyyy'), 'pdf', 'omnis proident rerum et voluptates do impedit dolore consequat ut.  mollitia delectus et rerum fugiat repudiandae voluptate accusamus dolorum velit. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2280, to_date('30-04-2011', 'dd-mm-yyyy'), 'pdf', 'dolore soluta deserunt nam quos culpa cupiditate officia dolor assumenda.  non id velit possimus dignissimos facere blanditiis et repellat hic.  dolore asperiores occaecat molestiae dignissimos culpa dolore provident et sunt.  iusto dolor deserunt distinc');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2281, to_date('29-09-2023', 'dd-mm-yyyy'), 'excel', 'dolore rerum irure repellendus non ex sint cumque quidem praesentium.  omnis pariatur officiis fuga dolore assumenda commodo in repudiandae. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2282, to_date('03-05-2007', 'dd-mm-yyyy'), 'pdf', 'dolore nam quos et facilis voluptatum non laborum nostrud dolore.  ea reprehenderit irure proident rerum tempor dolore quibusdam facere et.  ut repudiandae ullamco consectetur tenetur ut fuga elit est et.  at libero labore non ut excepteur praesentium et ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2283, to_date('27-01-2008', 'dd-mm-yyyy'), 'pdf', 'non sunt voluptas incididunt delectus in repudiandae ducimus delectus aut.  molestias voluptas deleniti sed irure praesentium id mollitia odio placeat.  rerum cupidatat quas autem irure omnis in dignissimos eligendi et.  non omnis consequat ipsum dolores ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2284, to_date('01-07-2021', 'dd-mm-yyyy'), 'excel', 'facilis eveniet elit deserunt irure officia sunt sapiente temporibus in.  sint et libero ducimus ut dignissimos laborum ducimus eveniet et.  reiciendis et reiciendis eiusmod harum vero ut facilis eveniet recusandae.  molestiae esse excepteur earum harum l');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2285, to_date('09-01-2006', 'dd-mm-yyyy'), 'excel', 'sunt sit labore blanditiis mollitia quas deleniti reprehenderit qui quod.  impedit anim et at atque eu distinctio quis praesentium ex.  est laborum et sed similique cillum earum saepe. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2286, to_date('07-03-2018', 'dd-mm-yyyy'), 'pdf', 'dolore distinctio repellendus sit fugiat doloribus excepturi harum libero in.  repellendus commodo distinctio atque possimus consequat eos mollit cillum excepturi.  qui corrupti et ducimus ipsum sint excepteur deleniti dolor quibusdam.  officia ullamco ha');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2287, to_date('06-11-2011', 'dd-mm-yyyy'), 'pdf', 'commodo odio odio cum repudiandae animi molestiae ut occaecati aut.  molestias nulla ullamco id est accusamus irure dolor deserunt blanditiis.  laboris excepteur excepturi exercitation iusto rerum est consequat cumque deserunt.  occaecat fuga omnis labore');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2288, to_date('06-12-2011', 'dd-mm-yyyy'), 'word', 'in qui dolor incididunt cupiditate veniam dolorum provident sit non.  consequatur cum reiciendis ullamco fuga blanditiis et quod laborum eu.  saepe et labore est consequatur officia minim sed debitis quas.  qui ea duis deleniti. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2289, to_date('31-01-2019', 'dd-mm-yyyy'), 'pdf', 'aut blanditiis minus excepturi ex possimus dignissimos ducimus possimus quos.  maxime est assumenda officia aut ullamco quos cupidatat et incididunt.  ut facere ea voluptatibus quibusdam. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2290, to_date('06-01-2007', 'dd-mm-yyyy'), 'excel', 'voluptate laborum voluptas vero dolor delectus et id culpa ad.  officiis alias ut et occaecati animi voluptas ut quis anim.  do earum hic eu excepteur quo quis soluta est ut.  omnis est eu et distinctio et do sint dolor sint.  labore voluptates ea sint de');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2291, to_date('02-12-2005', 'dd-mm-yyyy'), 'pdf', 'exercitation dolores voluptas et mollit fuga deleniti ad voluptas id.  dolor consectetur est in corrupti proident commodo temporibus laboris blanditiis.  rerum ut sunt cum occaecat culpa fugiat officiis hic dolore.  optio occaecati nobis alias officia lor');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2292, to_date('24-11-2005', 'dd-mm-yyyy'), 'pdf', 'ducimus ut iusto occaecat adipisicing minus pariatur cupidatat repellendus voluptatum.  itaque sint eiusmod blanditiis ad quibusdam vero tempor in culpa.  irure et repellat voluptates ad aut sunt quod ut distinctio.  ad qui rerum ut excepteur officia id e');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2293, to_date('19-01-2011', 'dd-mm-yyyy'), 'pdf', 'harum maxime magna in lorem voluptate sunt nobis dolor id.  odio quas cupiditate sunt ullamco facere hic perferendis commodo quos.  quis ex voluptate iusto consectetur fuga omnis incididunt amet id.  est irure laborum expedita possimus expedita ea enim in');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2294, to_date('17-11-2022', 'dd-mm-yyyy'), 'excel', 'enim non repudiandae deserunt quo mollit a voluptatum occaecati similique.  doloribus ea a culpa id doloribus at aut est est.  deserunt aliquip est quos qui doloribus et ut quo ut.  autem incididunt sint soluta non id quos aliqua ullamco et.  provident od');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2295, to_date('20-02-2015', 'dd-mm-yyyy'), 'excel', 'mollit aute sint culpa consequat molestiae possimus animi tenetur corrupti.  dignissimos ut id perferendis qui qui rerum ducimus rerum quod.  esse vero tenetur saepe facere eos et alias incididunt dolore.  officia expedita quo voluptatum et dolores irure ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2296, to_date('09-06-2018', 'dd-mm-yyyy'), 'word', 'est aut sunt aut non repudiandae culpa necessitatibus voluptas sunt.  proident occaecati sit earum et odio corrupti ut consequat provident.  culpa sunt dolore distinctio cumque mollitia rerum dolore id repellat.  distinctio recusandae pariatur blanditiis ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2297, to_date('14-09-2005', 'dd-mm-yyyy'), 'word', 'hic qui id in cumque impedit ut et non rerum.  quidem similique deserunt id non in aliqua facere mollit est.  dolor iusto eiusmod reprehenderit magna rerum sunt molestiae ea consequat.  hic sunt quibusdam ut in repudiandae laboris id facere vero.  et elit');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2298, to_date('20-02-2007', 'dd-mm-yyyy'), 'excel', 'aliqua. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2299, to_date('11-01-2022', 'dd-mm-yyyy'), 'word', 'dolore debitis est sunt tempore dignissimos molestiae odio non quod.  ipsum mollitia laborum aut optio repellat sit. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2300, to_date('09-12-2020', 'dd-mm-yyyy'), 'word', 'minim occaecati a voluptates sunt nostrud dolorum officiis aut ut.  voluptatum mollitia maiores voluptatum enim in repudiandae molestias qui. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2301, to_date('23-01-2022', 'dd-mm-yyyy'), 'pdf', 'libero et nostrud tempor deserunt exercitation odio asperiores minus reiciendis.  aut quod lorem non est est eos et qui omnis.  aliquip saepe laborum dolor qui sint reprehenderit harum voluptas in.  excepteur nulla iusto dolores at a aliqua repellendus ip');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2302, to_date('23-02-2022', 'dd-mm-yyyy'), 'excel', 'deleniti delectus facere nam non laborum nam molestias sapiente optio.  in autem harum tempor et dignissimos excepturi perferendis rerum mollitia.  qui qui id tenetur ut placeat similique sint ullamco officia.  eos odio in velit quos itaque dolor. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2303, to_date('24-12-2014', 'dd-mm-yyyy'), 'excel', 'facere occaecat elit et odio saepe dolor iusto elit animi.  provident consequat do asperiores voluptas itaque dolor nostrud quos dignissimos.  corrupti aut culpa rerum sunt maiores nihil est rerum quis.  cumque non in dolore aut omnis amet excepturi paria');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2304, to_date('22-02-2011', 'dd-mm-yyyy'), 'excel', 'in distinctio aut in irure alias et consectetur nihil atque.  irure molestiae odio adipisicing mollit voluptas laborum libero incididunt tempore.  excepturi voluptas cumque reiciendis officiis culpa consequatur ut assumenda consectetur.  et perferendis ma');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2305, to_date('13-06-2001', 'dd-mm-yyyy'), 'pdf', 'harum repellat occaecat molestias et vero nam iusto consequat rerum.  nostrud qui proident itaque excepteur sint accusamus et aut dolore.  est voluptates hic velit et ipsum id voluptas sit anim.  sint quo laboris dolor placeat officiis. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2306, to_date('13-12-2005', 'dd-mm-yyyy'), 'excel', 'culpa recusandae possimus eu delectus dolor laboris et est aut.  aliquip non ducimus reprehenderit voluptatum officiis quis asperiores eveniet itaque.  excepturi voluptatibus aut quos fuga saepe labore ut irure lorem.  officiis aliqua sit nihil voluptates');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2307, to_date('05-11-2016', 'dd-mm-yyyy'), 'excel', 'sapiente expedita asperiores labore cupiditate provident et excepteur est omnis.  quibusdam id recusandae non voluptate alias cillum incididunt fugiat nulla.  accusamus voluptatum veniam officiis et facere placeat et nisi ut.  est placeat et aliquip elige');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2308, to_date('23-03-2005', 'dd-mm-yyyy'), 'pdf', 'eu tenetur fugiat officia dolore est qui perferendis dolores omnis.  in iusto cillum anim optio deserunt deleniti autem officiis odio.  praesentium voluptatibus cupiditate et officia debitis fugiat excepturi sit reprehenderit.  laborum deserunt et ducimus');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2309, to_date('08-06-2014', 'dd-mm-yyyy'), 'pdf', 'consectetur dolore distinctio aliquip aut commodo praesentium asperiores ut possimus.  sint nihil deserunt a occaecat quidem dolore et possimus pariatur.  ut et est repudiandae eiusmod est voluptates velit qui harum.  atque quo est aut quo voluptatibus bl');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2310, to_date('02-02-2002', 'dd-mm-yyyy'), 'word', 'est itaque eligendi sed et culpa commodo dolore quod mollitia.  quas sunt excepteur eveniet est quis dolor fuga facere ea.  id est elit delectus at distinctio nobis nihil soluta enim.  quo. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2311, to_date('04-07-2007', 'dd-mm-yyyy'), 'pdf', 'dolore voluptatum rerum labore dolores voluptatum dolor iusto eos eveniet.  asperiores dolores proident in corrupti est anim ea est exercitation.  lorem amet harum cumque animi proident quod et tempore. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2312, to_date('18-01-2009', 'dd-mm-yyyy'), 'word', 'omnis voluptatibus non tempore voluptatibus ut culpa sint rerum mollit.  id sint debitis commodo libero corrupti occaecat officia duis nobis.  est deserunt proident optio officiis at officia minus id necessitatibus.  iusto assumenda dolor soluta harum rer');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2313, to_date('01-01-2014', 'dd-mm-yyyy'), 'excel', 'quis voluptatibus voluptates velit ut cupiditate sint eos nisi harum.  eiusmod tenetur in possimus temporibus in ut adipisicing ea expedita.  in officia itaque nam adipisicing nam irure optio ut odio. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2314, to_date('26-03-2015', 'dd-mm-yyyy'), 'excel', 'consectetur optio molestiae praesentium est tempore veniam id tempor placeat.  et ut facilis mollitia recusandae ut impedit harum necessitatibus repellat.  et et distinctio dolorum id elit libero duis libero perferendis.  voluptates eos laborum enim rerum');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2315, to_date('26-03-2019', 'dd-mm-yyyy'), 'pdf', 'aliqua officiis est ea fugiat at a perferendis voluptatibus ut.  ut consequat dolore blanditiis quas eiusmod tempore provident omnis minim.  laboris consequatur nostrud consequatur cupidatat elit non omnis ducimus eos.  hic minus quas repudiandae ullamco ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2316, to_date('30-06-2022', 'dd-mm-yyyy'), 'word', 'proident et sed non odio distinctio sit laboris assumenda cum.  labore distinctio mollit adipisicing ducimus lorem qui sunt ducimus dolor.  alias tenetur perferendis ut asperiores sint et eu officia deserunt.  tempor nihil est laborum deleniti non ut labo');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2317, to_date('19-06-2011', 'dd-mm-yyyy'), 'pdf', 'possimus occaecati id omnis soluta officia tenetur ad voluptates magna.  occaecati do ad distinctio laboris nostrud recusandae nulla aute cupiditate.  temporibus occaecati excepturi impedit quas laboris ex eu in eos.  itaque distinctio mollit id dolores n');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2318, to_date('12-01-2016', 'dd-mm-yyyy'), 'word', 'est ea pariatur et cillum in eligendi facilis commodo ea.  ullamco atque laborum sit est maxime a dolores ut sint.  aut quidem libero praesentium ut minim sint quod nihil et.  minim rerum sed proident tempor consectetur nulla sunt mollitia facere.  debiti');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2319, to_date('14-08-2014', 'dd-mm-yyyy'), 'word', 'quod possimus tenetur adipisicing quis harum dolor fuga praesentium. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2320, to_date('18-10-2005', 'dd-mm-yyyy'), 'excel', 'alias exercitation earum similique molestias eveniet sapiente ducimus officia ea.  qui tempore aut id ducimus excepturi qui laboris repellat similique.  asperiores impedit tempor repellat eos facilis magna proident harum deserunt.  minus duis molestiae re');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2321, to_date('27-02-2009', 'dd-mm-yyyy'), 'excel', 'ducimus dolor ut officia sit voluptatibus voluptate. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2322, to_date('14-03-2012', 'dd-mm-yyyy'), 'pdf', 'reiciendis in in optio cupidatat eligendi provident corrupti quis minim.  dolor exercitation commodo sint ut aliquip aliqua praesentium soluta doloribus.  voluptatibus delectus alias officia culpa aute occaecati omnis reiciendis et.  laboris aut mollitia ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2323, to_date('19-11-2006', 'dd-mm-yyyy'), 'word', 'non et dolores consequat dolore consequat est officiis cillum quas.  dolor mollit libero sunt at nihil et voluptas est et.  et earum reprehenderit voluptatum occaecati rerum soluta in sunt debitis.  et temporibus voluptatum in quas incididunt dolor aut at');
commit;
prompt 300 records committed...
insert into REPORTS (report_id, creation_date, report_type, content)
values (2324, to_date('26-11-2009', 'dd-mm-yyyy'), 'excel', 'labore id non tempore mollit in ipsum veniam maxime duis.  amet ullamco non accusamus id mollitia qui excepturi iusto nulla.  esse. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2325, to_date('31-12-2008', 'dd-mm-yyyy'), 'word', 'praesentium asperiores corrupti est mollit cum do et voluptatibus fugiat.  consequat laborum aliquip minim laborum in excepturi voluptatum non necessitatibus.  enim et similique cupiditate asperiores itaque tempor asperiores et et.  perferendis sunt delen');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2326, to_date('21-06-2000', 'dd-mm-yyyy'), 'word', 'consequat optio dolor in sed ut nulla deserunt dolore itaque.  cupiditate blanditiis sint cum ex mollit deserunt laboris commodo ullamco.  officia aute mollitia anim occaecati molestiae quis irure magna et.  sint reiciendis exercitation nobis. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2327, to_date('24-03-2020', 'dd-mm-yyyy'), 'pdf', 'excepteur molestiae sint iusto qui dolore voluptatum aut lorem maiores.  proident voluptatibus ullamco veniam consequat consequatur excepturi sapiente tenetur et.  facere velit rerum eveniet anim occaecat et nisi doloribus dolore.  autem est dolor nulla l');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2328, to_date('02-09-2023', 'dd-mm-yyyy'), 'excel', 'sit adipisicing nobis assumenda molestiae fuga et aute itaque soluta.  elit nisi exercitation repellendus est laborum officiis soluta labore in.  in ut possimus aut consectetur quod consectetur et odio elit.  iusto aut non maxime ad eu soluta ullamco quib');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2329, to_date('15-10-2015', 'dd-mm-yyyy'), 'excel', 'distinctio veniam enim culpa velit in molestiae voluptates nobis officiis.  quo ut accusamus culpa culpa quibusdam velit quas perferendis expedita.  aut culpa non anim molestiae quidem odio qui cum ut.  quibusdam deserunt laborum nostrud consequat volupta');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2330, to_date('26-11-2010', 'dd-mm-yyyy'), 'word', 'deleniti id quis lorem incididunt est consequatur consequat amet ut.  officia atque possimus laboris reiciendis perferendis non nihil amet id.  eligendi quis id nobis consequatur excepteur consequatur delectus ut recusandae.  a consequatur et praesentium ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2331, to_date('24-06-2007', 'dd-mm-yyyy'), 'word', 'tenetur expedita omnis molestias et et earum debitis pariatur dolor.  laborum at deleniti aute minus dolorum est provident a laborum.  atque perferendis sunt libero pariatur reiciendis non sapiente corrupti ut.  nulla lorem asperiores fuga duis dolores in');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2332, to_date('18-09-2023', 'dd-mm-yyyy'), 'word', 'repellendus in ut eiusmod officiis laboris molestiae et est dolorum.  occaecat velit tempor animi cum qui ullamco dolor eiusmod non.  dolor reiciendis velit in repellat aut dolor et facilis qui.  et maiores cumque dolor quas dolorum dolores excepturi aut ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2333, to_date('17-03-2022', 'dd-mm-yyyy'), 'excel', 'eveniet et in culpa id cumque hic possimus ipsum qui.  deserunt quas sunt quod doloribus adipisicing sint odio adipisicing dolor.  ex dolor enim voluptates tempor saepe proident et est mollit.  possimus proident possimus et commodo saepe deleniti culpa do');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2334, to_date('06-06-2006', 'dd-mm-yyyy'), 'pdf', 'ex sint provident rerum in elit culpa eiusmod mollit autem.  culpa voluptatum et est nisi animi cum est delectus veniam.  nobis id temporibus et eiusmod officiis est libero in in.  officia quod sint sunt saepe temporibus voluptatibus amet ex officia.  ven');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2335, to_date('02-03-2022', 'dd-mm-yyyy'), 'pdf', 'omnis deserunt amet maxime a magna ut excepturi rerum autem.  repellendus irure aut voluptatum labore nihil nostrud excepturi a officiis.  esse asperiores dolor cumque enim possimus id animi magna eos.  incididunt sint quos voluptas dignissimos sed culpa ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2336, to_date('11-06-2020', 'dd-mm-yyyy'), 'excel', 'pariatur molestias cupiditate cumque temporibus ut itaque quibusdam est qui.  atque et tempore quis id. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2337, to_date('19-06-2021', 'dd-mm-yyyy'), 'excel', 'aliqua eveniet nisi minus expedita et culpa dolore consequatur repellat.  minus maiores qui deleniti libero est fuga et et non.  amet voluptate doloribus corrupti sint rerum et mollitia cumque et.  et magna quo lorem consectetur dolor doloribus eiusmod ac');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2338, to_date('10-11-2021', 'dd-mm-yyyy'), 'excel', 'aliquip cillum dignissimos corrupti laboris ut assumenda ad in sunt.  vero fugiat qui facere doloribus minim ea necessitatibus recusandae vero.  et ut quis provident occaecati necessitatibus irure blanditiis et maiores.  sit deserunt possimus ut enim ex a');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2339, to_date('21-12-2004', 'dd-mm-yyyy'), 'pdf', 'commodo et velit omnis magna atque do id officia eligendi.  sunt eveniet reprehenderit necessitatibus eos repudiandae sint culpa possimus consequatur.  repellendus autem accusamus ex accusamus ex sint non expedita excepturi.  irure enim ipsum aliqua corru');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2340, to_date('26-12-2017', 'dd-mm-yyyy'), 'word', 'et deserunt distinctio atque laboris nisi praesentium sed anim veniam.  non odio eiusmod eligendi blanditiis reprehenderit excepturi quas hic eveniet.  eos aut aut culpa qui voluptas tenetur in possimus blanditiis.  fugiat alias possimus aliquip elit cons');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2341, to_date('12-05-2018', 'dd-mm-yyyy'), 'excel', 'est amet temporibus rerum quod eiusmod esse dolorum id recusandae.  irure autem voluptatibus ad facere quas quibusdam repellendus provident harum.  ut facere qui quo consequat harum et in pariatur officiis.  tempor omnis quibusdam laborum animi possimus a');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2342, to_date('24-11-2019', 'dd-mm-yyyy'), 'excel', 'culpa quibusdam et ut aut lorem cupiditate occaecat blanditiis quis.  sint id reprehenderit non hic dolor ea consequatur ex voluptates.  repellendus et repellat officia sint ut odio velit non occaecati.  mollitia dolor mollitia debitis a nihil rerum cillu');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2343, to_date('20-12-2007', 'dd-mm-yyyy'), 'pdf', 'ut cum reiciendis iusto id aut velit aute nostrud culpa.  at expedita quod nostrud possimus ut aliquip fugiat pariatur deserunt.  quidem dolor deserunt occaecat consequat praesentium tempore recusandae mollitia voluptas.  doloribus non fugiat sit et corru');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2344, to_date('06-05-2022', 'dd-mm-yyyy'), 'word', 'id est amet impedit officia ducimus perferendis quod ut quidem.  ad et sint itaque recusandae voluptates veniam id libero culpa.  accusamus sed harum quod delectus perferendis aute aute cupiditate occaecat.  rerum quos quidem dolor proident mollitia dolor');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2345, to_date('12-09-2007', 'dd-mm-yyyy'), 'excel', 'delectus omnis molestias dolor officia laborum ut dolor dolor culpa.  praesentium dolore aliqua autem necessitatibus excepteur qui id exercitation laborum.  dolores dolor ducimus velit blanditiis laborum a veniam similique provident.  sit quos laborum nam');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2346, to_date('06-03-2005', 'dd-mm-yyyy'), 'word', 'ut recusandae consectetur quidem expedita et et fugiat consequat officia.  et et sunt pariatur officiis officia. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2347, to_date('27-06-2017', 'dd-mm-yyyy'), 'pdf', 'consectetur voluptatibus et et distinctio duis enim distinctio at quidem.  aute repudiandae corrupti ea sapiente eiusmod quo dolore repellendus nostrud.  velit sunt a cillum autem rerum id in officia fuga.  tenetur qui ullamco amet doloribus quis proident');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2348, to_date('30-09-2013', 'dd-mm-yyyy'), 'word', 'reprehenderit id libero ex cum at do doloribus placeat laborum.  vero repudiandae non sunt ut fuga voluptas aut et irure.  adipisicing harum dolor repudiandae qui aute aut. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2349, to_date('09-07-2003', 'dd-mm-yyyy'), 'excel', 'hic in est nostrud sed dignissimos maxime et officiis molestias.  ut est perferendis elit enim cillum in quod excepteur sunt.  tempore asperiores in cum aut rerum et aliqua repellat similique.  proident possimus excepteur repellendus molestias sed dolor i');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2350, to_date('25-07-2002', 'dd-mm-yyyy'), 'word', 'quod deleniti ducimus facere sit qui voluptatum sint tenetur nihil.  elit molestias itaque id commodo harum dolorum cum ipsum in.  maiores reprehenderit odio do culpa sunt id rerum excepturi cillum.  hic qui dolor rerum in cupidatat tempore ad voluptates ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2351, to_date('10-04-2015', 'dd-mm-yyyy'), 'pdf', 'alias fuga dolores officia soluta dolor corrupti ut in dolore.  in dolore ex a consectetur dolores fuga ut impedit accusamus.  et asperiores provident laboris temporibus id cupiditate itaque est aut.  repudiandae non saepe temporibus eligendi quas esse la');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2352, to_date('29-08-2016', 'dd-mm-yyyy'), 'word', 'qui dolore nulla alias cum in dolore non nam a.  praesentium id sunt dolore deserunt cupiditate est commodo maxime occaecat.  id lorem aut ad aut officiis consectetur vero reprehenderit aut.  voluptatibus facilis ut autem voluptas nobis ut debitis occaeca');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2353, to_date('22-04-2016', 'dd-mm-yyyy'), 'pdf', 'esse nulla odio laborum pariatur adipisicing voluptate dolores molestias earum.  aut eos est sapiente similique sint corrupti eligendi ut delectus.  impedit dolor ut soluta anim est eos culpa commodo aut.  autem voluptatibus rerum iusto nisi vero dolore f');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2354, to_date('03-04-2000', 'dd-mm-yyyy'), 'excel', 'magna possimus irure recusandae quibusdam anim blanditiis id doloribus ut.  at cumque hic reprehenderit elit dolor excepturi aliquip sapiente est.  sapiente cupiditate et quidem veniam do aute non assumenda et.  itaque sint a elit do cupidatat assumenda a');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2355, to_date('16-03-2005', 'dd-mm-yyyy'), 'word', 'est rerum vero id laborum fuga tempor est irure quo.  maiores qui blanditiis omnis eos rerum earum maxime dolorum quod.  blanditiis eu excepturi deleniti ullamco in culpa voluptatibus sunt consequat.  delectus earum officiis eligendi et ut non nostrud dol');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2356, to_date('02-01-2014', 'dd-mm-yyyy'), 'excel', 'soluta reprehenderit sed distinctio et et id consequatur provident in.  minim dolore dolor fugiat assumenda praesentium ullamco elit asperiores necessitatibus.  dolor ipsum velit provident officiis non aut molestias qui delectus.  doloribus eos deserunt u');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2357, to_date('21-10-2011', 'dd-mm-yyyy'), 'excel', 'nulla nobis perferendis ullamco omnis enim molestias minim officia facere.  animi sint tempore veniam irure laboris sapiente ut expedita sunt.  est rerum qui cumque aut alias id similique similique ex.  quibusdam doloribus eiusmod adipisicing do in nobis ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2358, to_date('16-10-2009', 'dd-mm-yyyy'), 'pdf', 'id eveniet reiciendis omnis est aute cillum non id repellat.  adipisicing cum distinctio ut occaecat sunt optio id do ex.  impedit cum reprehenderit deserunt nisi voluptate aut id excepturi cum.  laborum ex odio sapiente proident. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2359, to_date('25-08-2001', 'dd-mm-yyyy'), 'excel', 'aliqua consequat ex consectetur laboris corrupti ut praesentium quidem non.  rerum rerum mollit perferendis culpa dolore consequatur quod est sunt.  id repudiandae saepe quas. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2360, to_date('01-06-2001', 'dd-mm-yyyy'), 'word', 'aut quod accusamus itaque autem quo excepturi incididunt placeat irure.  reiciendis et dolor laborum irure eiusmod eos eligendi voluptatibus officia.  doloribus eiusmod aliqua reiciendis aliqua ipsum fugiat impedit in est.  elit commodo reprehenderit sunt');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2361, to_date('16-08-2018', 'dd-mm-yyyy'), 'word', 'do ducimus in tempor ipsum in id aliqua est nihil.  possimus aut molestiae in ad consequatur ut dolor et dolorum.  saepe earum sint soluta dolorum non culpa quibusdam debitis non.  occaecati sint ullamco in tenetur et ipsum labore voluptates soluta.  volu');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2362, to_date('15-01-2009', 'dd-mm-yyyy'), 'excel', 'expedita minus et ullamco voluptas itaque deserunt facilis laboris doloribus.  repellat consequat accusamus excepturi voluptate ullamco id laborum at ullamco.  alias voluptas eligendi molestiae cillum eligendi laborum repudiandae mollit enim.  deserunt ut');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2363, to_date('08-06-2011', 'dd-mm-yyyy'), 'excel', 'molestias et id est tempore asperiores praesentium assumenda dolores cupidatat.  mollit pariatur maxime sint. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2364, to_date('18-06-2007', 'dd-mm-yyyy'), 'word', 'eos officiis et itaque deserunt esse itaque repellat ut dolores.  lorem qui facilis libero sed rerum aliqua est ut pariatur.  sint et expedita dignissimos aute cupiditate tempor autem sint velit.  omnis minim molestiae nisi commodo repudiandae omnis asper');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2365, to_date('10-10-2010', 'dd-mm-yyyy'), 'pdf', 'sint quis velit laborum eu et minus non delectus deleniti.  ea id tenetur dolor ipsum aut nostrud debitis est atque.  cillum provident assumenda sint ut harum sint incididunt in irure.  labore consectetur incididunt magna quidem qui lorem omnis ut molliti');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2366, to_date('11-05-2001', 'dd-mm-yyyy'), 'pdf', 'anim mollitia nobis ducimus id assumenda cupidatat voluptates harum amet.  libero nam animi asperiores quos odio laborum et sint. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2367, to_date('09-03-2002', 'dd-mm-yyyy'), 'pdf', 'soluta quos ut quis officia non temporibus in qui adipisicing.  dolorum officiis repudiandae quis at tempor repellat id cupidatat placeat.  consequatur quo mollitia harum impedit officiis a dolorum et minus.  exercitation eligendi do quidem consectetur it');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2368, to_date('31-01-2004', 'dd-mm-yyyy'), 'excel', 'elit labore ut et deleniti accusamus id accusamus voluptatibus omnis.  incididunt consequatur ut. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2369, to_date('21-03-2007', 'dd-mm-yyyy'), 'pdf', 'soluta molestiae ipsum do qui repellat deserunt deleniti qui ipsum.  mollit alias eos id do molestias at et ut praesentium.  voluptatibus sunt dolor assumenda. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2370, to_date('13-07-2013', 'dd-mm-yyyy'), 'excel', 'laborum commodo iusto sit in et consectetur. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2371, to_date('14-09-2018', 'dd-mm-yyyy'), 'word', 'pariatur asperiores quod veniam asperiores asperiores hic irure laborum perferendis.  id voluptatibus et sapiente eos nihil minim est deleniti dolore.  et sit facilis delectus eiusmod eu quos in ad mollit.  laborum qui et ut fuga atque dolores rerum nisi ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2372, to_date('09-11-2013', 'dd-mm-yyyy'), 'pdf', 'accusamus anim elit nostrud quidem facere mollitia dolor voluptate ullamco.  anim proident lorem incididunt culpa at cupiditate ipsum qui placeat.  elit temporibus laboris dolores occaecati ullamco reiciendis et qui possimus.  quod qui harum recusandae ex');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2373, to_date('11-09-2008', 'dd-mm-yyyy'), 'pdf', 'et tenetur incididunt quis qui ad libero vero id non.  laborum rerum repellendus et fugiat vero magna similique et ullamco.  et deserunt veniam similique aut adipisicing autem molestiae reprehenderit eu.  recusandae anim qui harum ullamco pariatur repella');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2374, to_date('09-03-2008', 'dd-mm-yyyy'), 'word', 'rerum ut quo eligendi alias alias cum rerum cupiditate perferendis.  occaecat aut non est sit ducimus nisi excepturi sapiente maxime.  id cupidatat molestias amet dolore est sint odio do minim.  nobis accusamus fugiat quos hic debitis voluptates omnis ani');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2375, to_date('25-03-2015', 'dd-mm-yyyy'), 'word', 'nisi similique alias necessitatibus et necessitatibus odio quis et at.  lorem in maiores aliqua proident eveniet occaecat possimus autem est.  quas id quidem anim corrupti quod vero occaecati occaecati voluptatum.  eligendi soluta proident labore assumend');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2376, to_date('25-06-2022', 'dd-mm-yyyy'), 'excel', 'voluptas exercitation labore non distinctio asperiores laborum cillum minim laborum.  consequat earum cumque magna iusto soluta quis et minim ut.  in ea occaecat pariatur dolor do ullamco cupiditate ut proident.  magna anim autem quos et et cumque laborum');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2377, to_date('21-11-2001', 'dd-mm-yyyy'), 'pdf', 'ea in ut voluptate sint laboris nulla velit velit dolore.  voluptate aut at et ducimus molestias et impedit harum corrupti.  perferendis saepe cupiditate id aute reprehenderit est et facere aliqua.  sit minus eu ad mollit dolore animi sunt tempore harum. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2378, to_date('13-09-2001', 'dd-mm-yyyy'), 'pdf', 'occaecat excepturi saepe ut cumque fuga delectus lorem qui cillum.  nulla aut elit nam sunt deleniti dolor est omnis voluptatum.  incididunt molestias nisi officiis distinctio veniam dolores aut facere autem.  in officia deserunt id nobis dolor aut atque ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2379, to_date('12-08-2005', 'dd-mm-yyyy'), 'pdf', 'dignissimos et rerum amet maiores cillum sint aliquip consectetur praesentium.  quibusdam nulla culpa cumque officia libero ut consectetur at irure.  consectetur et optio culpa proident ducimus tempor id earum voluptate.  possimus. ');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2380, to_date('25-08-2019', 'dd-mm-yyyy'), 'word', 'consequat officiis qui dignissimos sint optio cumque placeat laborum reiciendis.  at et ut debitis recusandae occaecati id quod omnis aut.  dolore consequatur fuga culpa quas veniam voluptatibus omnis nisi ea.  non vero eu assumenda repellendus sint cillu');
insert into REPORTS (report_id, creation_date, report_type, content)
values (2381, to_date('26-08-2020', 'dd-mm-yyyy'), 'pdf', 'occaecat blanditiis impedit amet labore quis praesentium ex. ');
commit;
prompt 358 records loaded
prompt Loading EEVENTS...
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1111, to_date('09-06-2007', 'dd-mm-yyyy'), '7:14', 'Jun-nam', 'libero optio aute reprehenderit id.  exercitation a minim cumque aut.  quas in consectetur. ', 1234);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1112, to_date('09-03-2014', 'dd-mm-yyyy'), '5:20', 'Laurel', 'mollit. ', 1237);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1113, to_date('21-08-2019', 'dd-mm-yyyy'), '19:1', 'Pacific Grove', 'quod officia saepe est commodo.  tempor at mollit excepturi ullamco.  nihil. ', 1249);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1114, to_date('18-08-2011', 'dd-mm-yyyy'), '19:28', 'Ft. Lauderdale', 'tempor odio delectus similique do.  quidem placeat laborum placeat dignissimos.  non. ', 2291);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1115, to_date('30-05-2019', 'dd-mm-yyyy'), '0:45', 'Hochwald', 'distinctio distinctio provident qui. ', 2314);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1116, to_date('19-05-2022', 'dd-mm-yyyy'), '10:10', 'Gummersbach', 'tempore et non tenetur omnis.  ut ex exercitation sint labore. ', 1265);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1117, to_date('22-10-2016', 'dd-mm-yyyy'), '0:30', 'Thames Ditton', 'amet est perferendis in et.  autem nisi quod. ', 2337);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1118, to_date('06-01-2007', 'dd-mm-yyyy'), '14:11', 'Oshawa', 'corrupti occaecati perferendis exercitation hic.  autem mollitia. ', 1164);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1119, to_date('22-04-2002', 'dd-mm-yyyy'), '15:9', 'Zaandam', 'proident provident cillum blanditiis culpa.  ut tempore sit. ', 1116);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1120, to_date('17-09-2003', 'dd-mm-yyyy'), '9:29', 'Paço de Arcos', 'maiores mollit et cumque ducimus.  ipsum itaque dolor hic sint.  alias proident. ', 2341);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1121, to_date('25-02-2013', 'dd-mm-yyyy'), '4:51', 'Oshawa', 'et doloribus aut et voluptatum.  optio. ', 1148);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1122, to_date('01-12-2006', 'dd-mm-yyyy'), '22:15', 'Recife', 'aut alias nulla praesentium non.  sunt saepe maiores commodo qui.  ut aut atque et. ', 2346);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1123, to_date('14-12-2007', 'dd-mm-yyyy'), '21:20', 'Hässleholm', 'atque quos culpa et occaecat.  consectetur proident. ', 2341);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1124, to_date('15-06-2007', 'dd-mm-yyyy'), '0:58', 'Velizy Villacoublay', 'commodo ducimus eligendi ut dolore.  ut eiusmod reiciendis minim est.  et. ', 1240);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1125, to_date('05-01-2012', 'dd-mm-yyyy'), '0:13', 'Glen Cove', 'sint optio adipisicing. ', 1180);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1126, to_date('10-11-2018', 'dd-mm-yyyy'), '0:21', 'Solon', 'dolore vero quidem itaque. ', 1182);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1127, to_date('24-03-2018', 'dd-mm-yyyy'), '19:12', 'Thames Ditton', 'consequatur. ', 1252);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1128, to_date('26-04-2014', 'dd-mm-yyyy'), '21:8', 'Ljubljana', 'commodo itaque ex et. ', 1175);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1129, to_date('19-01-2008', 'dd-mm-yyyy'), '21:58', 'Peine', 'officiis pariatur eiusmod praesentium eu.  anim irure maxime nostrud. ', 2329);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1133, to_date('07-06-2004', 'dd-mm-yyyy'), '10:11', 'Jerusalem', 'perferendis quidem perferendis est animi.  aliquip ut anim. ', 1113);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1134, to_date('07-05-2022', 'dd-mm-yyyy'), '10:30', 'Washington', 'accusamus nulla repellat minus officia.  nobis expedita autem exercitation minim.  voluptatibus. ', 1212);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1135, to_date('16-12-2002', 'dd-mm-yyyy'), '3:1', 'Tilburg', 'officia consequat similique maxime nobis.  veniam. ', 1247);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1136, to_date('18-10-2001', 'dd-mm-yyyy'), '20:10', 'Wakayama', 'dolores enim ad soluta officia. ', 2298);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1137, to_date('15-03-2004', 'dd-mm-yyyy'), '2:54', 'Magstadt', 'omnis eveniet quas in sint.  et ducimus. ', 2354);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1138, to_date('07-07-2003', 'dd-mm-yyyy'), '10:28', 'Tilst', 'maiores cum et in. ', 2353);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1139, to_date('12-01-2012', 'dd-mm-yyyy'), '1:51', 'Frankfurt am Main', 'praesentium nihil aut rerum rerum.  cum. ', 1250);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1140, to_date('09-11-2009', 'dd-mm-yyyy'), '0:31', 'Tlalpan', 'nihil officia reprehenderit sunt atque.  aut maiores. ', 2274);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1141, to_date('24-04-2013', 'dd-mm-yyyy'), '13:33', 'Caguas', 'molestiae officia id ut ad.  molestias id rerum mollitia dolore. ', 1170);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1142, to_date('21-05-2011', 'dd-mm-yyyy'), '13:42', 'Lublin', 'repudiandae aut dolore occaecati. ', 2240);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1143, to_date('28-04-2009', 'dd-mm-yyyy'), '5:54', 'Portsmouth', 'quibusdam aliqua ut ut dolore.  id est molestiae cupidatat et.  ipsum est rerum. ', 2313);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1144, to_date('21-02-2001', 'dd-mm-yyyy'), '9:54', 'Bloomington', 'expedita enim velit officia tenetur.  in id id quibusdam hic.  assumenda aliqua laborum ut alias. ', 2335);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1145, to_date('14-08-2009', 'dd-mm-yyyy'), '14:17', 'Austin', 'rerum deserunt odio et tenetur.  libero eiusmod. ', 2351);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1146, to_date('27-08-2022', 'dd-mm-yyyy'), '3:50', 'Saint Paul', 'alias consectetur et proident deleniti. ', 2355);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1147, to_date('29-05-2020', 'dd-mm-yyyy'), '14:2', 'Nara', 'et deserunt veniam a aut.  culpa officia repudiandae fuga sunt.  in repellat. ', 1189);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1148, to_date('03-04-2008', 'dd-mm-yyyy'), '19:20', 'Trenton', 'id ducimus doloribus quis duis. ', 2275);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1149, to_date('19-02-2022', 'dd-mm-yyyy'), '2:42', 'Ebersberg', 'quod omnis perferendis nam. ', 2349);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1150, to_date('14-10-2017', 'dd-mm-yyyy'), '21:37', 'Ludbreg', 'fuga amet provident rerum veniam.  minus expedita voluptatum anim aliqua. ', 2223);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1151, to_date('03-07-2013', 'dd-mm-yyyy'), '16:55', 'Saint-vincent-de-dur', 'dolore deserunt deserunt. ', 1159);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1152, to_date('11-12-2016', 'dd-mm-yyyy'), '17:28', 'Köln', 'perferendis saepe deserunt fuga tempore.  id aut ducimus sint et. ', 2289);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1153, to_date('01-04-2016', 'dd-mm-yyyy'), '11:51', 'Verdun', 'anim quibusdam eos excepturi eu.  rerum nihil. ', 1188);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1154, to_date('09-09-2015', 'dd-mm-yyyy'), '18:42', 'San Dimas', 'cupidatat eu mollit sapiente quibusdam.  odio nostrud irure dolore recusandae. ', 1179);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1155, to_date('04-07-2003', 'dd-mm-yyyy'), '23:48', 'Peterborough', 'eos nulla exercitation cupiditate a.  optio voluptate qui deserunt. ', 2304);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1156, to_date('14-05-2018', 'dd-mm-yyyy'), '2:42', 'Dunn loring', 'culpa assumenda molestias reiciendis soluta.  sint ut repudiandae velit elit.  sit sint. ', 1190);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1157, to_date('25-04-2005', 'dd-mm-yyyy'), '7:25', 'Koppl', 'culpa voluptates in reiciendis dolorum.  deserunt eveniet in. ', 2290);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1158, to_date('04-02-2008', 'dd-mm-yyyy'), '11:53', 'Kochi', 'voluptate aliqua veniam eu non.  aute odio impedit sint. ', 2319);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1159, to_date('17-02-2015', 'dd-mm-yyyy'), '16:4', 'Greenville', 'delectus et minus in sapiente.  deleniti harum cupiditate. ', 1284);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1160, to_date('04-11-2015', 'dd-mm-yyyy'), '3:57', 'Hong Kong', 'magna sunt sint hic libero.  aliquip distinctio est harum et.  veniam hic maxime optio. ', 2288);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1161, to_date('11-09-2011', 'dd-mm-yyyy'), '6:43', 'Dreieich', 'eveniet et ducimus et similique.  repellendus do ipsum laborum laborum.  deserunt ea. ', 2242);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1162, to_date('21-01-2003', 'dd-mm-yyyy'), '23:45', 'Livermore', 'in laborum duis consectetur rerum.  deserunt deleniti dolor possimus optio. ', 2238);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1163, to_date('06-12-2012', 'dd-mm-yyyy'), '1:12', 'Paal Beringen', 'in et eligendi id non.  laborum officia. ', 1143);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1164, to_date('19-02-2008', 'dd-mm-yyyy'), '16:35', 'Breda', 'eiusmod officiis maiores nulla earum.  culpa in cumque provident est.  id hic. ', 1148);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1165, to_date('19-11-2012', 'dd-mm-yyyy'), '4:1', 'Herzlia', 'ut aute quas adipisicing tempore.  magna. ', 2305);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1166, to_date('12-06-2020', 'dd-mm-yyyy'), '1:52', 'Stuttgart', 'esse eos et. ', 2344);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1167, to_date('05-05-2023', 'dd-mm-yyyy'), '2:30', 'Coimbra', 'minim nulla id officia alias.  magna repellendus officiis et nam.  sint a quos. ', 1135);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1168, to_date('21-12-2018', 'dd-mm-yyyy'), '19:5', 'Eindhoven', 'est et. ', 2306);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1169, to_date('11-03-2011', 'dd-mm-yyyy'), '16:11', 'Swannanoa', 'rerum officiis culpa sint id.  autem animi aute amet. ', 1283);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1170, to_date('10-08-2022', 'dd-mm-yyyy'), '12:59', 'Kozani', 'sint dignissimos officia eveniet id.  cupidatat recusandae cumque commodo mollit.  non. ', 1273);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1171, to_date('27-06-2007', 'dd-mm-yyyy'), '12:5', 'Saudarkrokur', 'excepteur facilis fugiat voluptates officiis.  voluptates soluta consequat. ', 2306);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1172, to_date('09-09-2022', 'dd-mm-yyyy'), '16:15', 'Pompton Plains', 'earum dolor culpa saepe recusandae.  fugiat esse dolore lorem cumque.  dolor. ', 1281);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1173, to_date('14-02-2001', 'dd-mm-yyyy'), '2:8', 'New York', 'odio aut a. ', 2224);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1174, to_date('06-09-2013', 'dd-mm-yyyy'), '2:5', 'Wavre', 'ad ut et quos. ', 2253);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1175, to_date('15-04-2008', 'dd-mm-yyyy'), '10:40', 'Bern', 'sit temporibus odio autem. ', 2317);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1176, to_date('12-11-2013', 'dd-mm-yyyy'), '10:56', 'Durban', 'nam amet id ut recusandae.  blanditiis quibusdam ut impedit officia.  reiciendis aut reprehenderit. ', 2326);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1178, to_date('15-12-2005', 'dd-mm-yyyy'), '14:4', 'Buenos Aires', 'esse consectetur cillum minus assumenda.  magna perferendis distinctio quibusdam. ', 1295);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1179, to_date('12-10-2001', 'dd-mm-yyyy'), '23:51', 'Fairborn', 'tempor sapiente optio. ', 1287);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1180, to_date('19-03-2019', 'dd-mm-yyyy'), '1:56', 'Algermissen', 'asperiores in molestiae tempore consequatur.  voluptate enim non atque. ', 1244);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1130, to_date('25-06-2003', 'dd-mm-yyyy'), '4:53', 'Ithaca', 'aut eos. ', 1284);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1131, to_date('06-06-2013', 'dd-mm-yyyy'), '22:44', 'Vilnius', 'deserunt earum hic. ', 2361);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1132, to_date('07-11-2021', 'dd-mm-yyyy'), '9:43', 'Kerava', 'et quidem impedit et quibusdam.  velit culpa aliqua possimus et.  voluptas. ', 2361);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1177, to_date('21-04-2008', 'dd-mm-yyyy'), '17:59', 'Blacksburg', 'rerum deserunt repellendus distinctio. ', 1242);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1181, to_date('03-07-2014', 'dd-mm-yyyy'), '16:20', 'Goslar', 'dolores et maxime deserunt anim.  vero fugiat sapiente. ', 2231);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1182, to_date('21-03-2011', 'dd-mm-yyyy'), '9:45', 'Sao roque', 'amet tenetur sapiente animi perferendis. ', 2225);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1183, to_date('09-03-2010', 'dd-mm-yyyy'), '3:7', 'Naestved', 'cumque ut ex ut dolor.  et quidem dolore et eveniet. ', 2222);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1184, to_date('31-10-2022', 'dd-mm-yyyy'), '7:57', 'Bedfordshire', 'quis et officia magna consequatur.  aut et irure aut sint.  consequatur cum ipsum dolor non. ', 2301);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1185, to_date('11-08-2022', 'dd-mm-yyyy'), '18:1', 'Ringwood', 'adipisicing ad rerum aliquip in.  in rerum consequatur dolore veniam. ', 2364);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1186, to_date('19-06-2023', 'dd-mm-yyyy'), '22:28', 'Oldham', 'quod alias id qui qui.  nulla temporibus minim in mollit. ', 1185);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1187, to_date('07-12-2016', 'dd-mm-yyyy'), '12:51', 'Kagoshima', 'impedit consequatur et. ', 2274);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1188, to_date('25-08-2011', 'dd-mm-yyyy'), '0:38', 'Mönchengladbach', 'id repellendus cupidatat eligendi recusandae.  culpa placeat deserunt. ', 1199);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1189, to_date('04-07-2014', 'dd-mm-yyyy'), '14:2', 'Köln', 'sint et a ipsum occaecat.  mollit non fuga nihil est. ', 2222);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1190, to_date('14-05-2003', 'dd-mm-yyyy'), '20:19', 'Gauteng', 'magna delectus fugiat delectus. ', 1295);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1191, to_date('18-12-2007', 'dd-mm-yyyy'), '15:45', 'Long Island City', 'mollitia deserunt nobis qui voluptatibus. ', 2310);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1192, to_date('06-08-2014', 'dd-mm-yyyy'), '11:33', 'St Jean de Soudain', 'ut impedit hic consectetur mollit. ', 2330);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1193, to_date('03-09-2012', 'dd-mm-yyyy'), '19:56', 'Bretzfeld-Waldbach', 'enim ut aut quo consectetur.  commodo earum cupiditate possimus ea.  excepturi a. ', 1297);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1195, to_date('23-08-2004', 'dd-mm-yyyy'), '20:20', 'Toledo', 'est impedit molestias exercitation sed.  aut ut. ', 2324);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1196, to_date('10-04-2006', 'dd-mm-yyyy'), '3:36', 'Bkk', 'elit debitis labore provident eiusmod.  et ullamco ipsum ipsum fuga.  corrupti culpa. ', 2354);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1197, to_date('16-11-2002', 'dd-mm-yyyy'), '18:36', 'Bedford', 'consequatur tenetur et amet. ', 1191);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1198, to_date('18-11-2013', 'dd-mm-yyyy'), '15:25', 'Bruneck', 'fugiat nobis et sunt. ', 2365);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1199, to_date('16-06-2007', 'dd-mm-yyyy'), '10:8', 'Chicago', 'repudiandae distinctio id amet culpa.  atque tempore sunt optio optio.  ex non libero saepe. ', 1238);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1200, to_date('08-06-2012', 'dd-mm-yyyy'), '20:36', 'Horsham', 'tempor quo temporibus et quod.  non quo vero ut. ', 2269);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1201, to_date('18-01-2017', 'dd-mm-yyyy'), '14:36', 'Vienna', 'et ullamco quidem earum excepteur.  deserunt blanditiis minus aut ullamco.  magna. ', 1117);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1202, to_date('17-06-2023', 'dd-mm-yyyy'), '7:41', 'Bethesda', 'possimus aliquip est est excepturi.  ex eligendi aut. ', 1265);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1203, to_date('25-01-2015', 'dd-mm-yyyy'), '23:6', 'Fornacette', 'sint itaque libero ex est.  et. ', 1119);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1204, to_date('09-02-2018', 'dd-mm-yyyy'), '17:21', 'Annandale', 'nobis. ', 1146);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1205, to_date('24-09-2000', 'dd-mm-yyyy'), '11:8', 'Tilst', 'eos sit pariatur non tempore.  cupiditate maiores in. ', 2275);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1206, to_date('13-08-2004', 'dd-mm-yyyy'), '14:18', 'Berkeley', 'repudiandae quo. ', 1235);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1207, to_date('06-02-2003', 'dd-mm-yyyy'), '9:16', 'Westfield', 'rerum similique iusto maxime expedita.  voluptas omnis atque et anim.  quo lorem. ', 1289);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1208, to_date('08-07-2017', 'dd-mm-yyyy'), '12:23', 'Lahr', 'et dolor eiusmod animi praesentium.  nostrud. ', 1240);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1209, to_date('06-03-2021', 'dd-mm-yyyy'), '13:20', 'Sarasota', 'quos irure incididunt non excepteur.  consectetur sunt reprehenderit. ', 2234);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1210, to_date('11-09-2012', 'dd-mm-yyyy'), '23:30', 'Shizuoka', 'vero doloribus id quis. ', 1125);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1211, to_date('27-08-2018', 'dd-mm-yyyy'), '3:33', 'Berwyn', 'do sint facere mollit ut. ', 2276);
commit;
prompt 100 records committed...
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1212, to_date('20-02-2003', 'dd-mm-yyyy'), '16:0', 'Altamonte Springs', 'hic libero sed rerum facere.  voluptatum repellat consequat ut iusto. ', 1231);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1213, to_date('02-10-2004', 'dd-mm-yyyy'), '3:32', 'Salt Lake City', 'fuga voluptas aliquip odio sit.  eiusmod earum excepturi nobis ad.  debitis aliqua. ', 1135);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1214, to_date('07-09-2000', 'dd-mm-yyyy'), '18:31', 'Gothenburg', 'lorem minus temporibus sunt hic.  laboris cupiditate. ', 1119);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1215, to_date('30-01-2009', 'dd-mm-yyyy'), '16:39', 'Chicago', 'animi est facilis. ', 1185);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1216, to_date('25-03-2006', 'dd-mm-yyyy'), '3:28', 'Shenzhen', 'saepe elit est ut accusamus.  minim non itaque rerum ducimus.  ea tenetur. ', 1139);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1217, to_date('12-06-2009', 'dd-mm-yyyy'), '9:10', 'Chaam', 'ullamco et non saepe est.  deleniti corrupti sed harum provident. ', 2309);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1218, to_date('19-06-2013', 'dd-mm-yyyy'), '19:50', 'Daejeon', 'facere minus culpa sit sint.  maiores necessitatibus placeat eveniet dolor.  fuga. ', 2364);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1219, to_date('21-11-2022', 'dd-mm-yyyy'), '14:24', 'Offenburg', 'est optio irure rerum deserunt. ', 2313);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1220, to_date('14-11-2004', 'dd-mm-yyyy'), '7:35', 'Borger', 'aut et quas vero velit.  omnis do placeat aut alias.  nostrud est incididunt facere id.  in. ', 2255);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1221, to_date('04-05-2023', 'dd-mm-yyyy'), '19:12', 'Lehi', 'odio. ', 2222);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1222, to_date('22-02-2015', 'dd-mm-yyyy'), '20:31', 'Shenzhen', 'irure quos cumque quos. ', 2225);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1223, to_date('07-10-2005', 'dd-mm-yyyy'), '22:34', 'Milsons Point', 'dolor cum irure nulla occaecat.  eu nihil ut ut eos.  dolor enim voluptate est. ', 1193);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1224, to_date('17-03-2007', 'dd-mm-yyyy'), '23:30', 'Ricardson', 'ea duis mollitia tempor consequatur.  aute deserunt facilis id possimus. ', 2328);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1225, to_date('13-03-2010', 'dd-mm-yyyy'), '3:26', 'Oshawa', 'elit qui ea veniam. ', 2376);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1226, to_date('01-04-2012', 'dd-mm-yyyy'), '14:44', 'Berlin', 'rerum quis et atque temporibus.  atque cillum necessitatibus magna accusamus.  possimus nisi. ', 1205);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1227, to_date('23-06-2009', 'dd-mm-yyyy'), '12:1', 'Manaus', 'do dolor quis tenetur sapiente.  adipisicing occaecat non delectus. ', 2325);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1228, to_date('08-03-2009', 'dd-mm-yyyy'), '23:34', 'Jerusalem', 'corrupti odio quas ut officia. ', 2361);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1230, to_date('09-03-2015', 'dd-mm-yyyy'), '12:15', 'Ettlingen', 'sapiente duis et et mollit.  eu et consectetur veniam molestiae.  ad aut anim occaecat. ', 1171);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1231, to_date('28-04-2013', 'dd-mm-yyyy'), '2:27', 'Shreveport', 'non magna quidem sunt. ', 1224);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1232, to_date('06-11-2023', 'dd-mm-yyyy'), '9:57', 'Chennai', 'ea. ', 1188);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1233, to_date('06-11-2011', 'dd-mm-yyyy'), '5:58', 'Fairborn', 'placeat. ', 2233);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1234, to_date('20-10-2006', 'dd-mm-yyyy'), '2:46', 'Juneau', 'non dolor non placeat reiciendis.  perferendis elit voluptas eligendi duis.  et rerum. ', 1242);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1235, to_date('15-06-2010', 'dd-mm-yyyy'), '2:4', 'Solon', 'odio aut maxime facilis deserunt.  eu excepteur duis aute. ', 2258);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1236, to_date('01-05-2002', 'dd-mm-yyyy'), '10:57', 'Dublin', 'repudiandae tempore est ut deserunt.  velit doloribus deserunt enim cupidatat. ', 2327);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1237, to_date('19-06-2010', 'dd-mm-yyyy'), '18:26', 'Purley', 'ipsum consequat est tempore eu.  temporibus nulla. ', 2368);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1238, to_date('26-12-2022', 'dd-mm-yyyy'), '19:4', 'Nicosia', 'eiusmod laborum dolor et quidem. ', 1192);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1239, to_date('24-05-2013', 'dd-mm-yyyy'), '5:40', 'Utrecht', 'occaecati qui tenetur itaque consectetur.  a. ', 2270);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1240, to_date('07-05-2011', 'dd-mm-yyyy'), '0:54', 'Runcorn', 'facere itaque voluptates rerum omnis.  deleniti delectus et sint rerum.  et fugiat laborum. ', 2300);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1241, to_date('23-05-2010', 'dd-mm-yyyy'), '5:21', 'Columbus', 'aut et quo eos dolor.  excepteur. ', 1257);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1242, to_date('13-06-2021', 'dd-mm-yyyy'), '5:11', 'Reading', 'occaecati dolor et anim. ', 2320);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1244, to_date('11-01-2023', 'dd-mm-yyyy'), '21:5', 'Montréal', 'occaecat sint aut elit accusamus.  et dolor anim atque et.  recusandae sapiente. ', 2237);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1245, to_date('03-07-2012', 'dd-mm-yyyy'), '9:52', 'Wuerzburg', 'praesentium est nostrud necessitatibus est. ', 1121);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1248, to_date('11-02-2003', 'dd-mm-yyyy'), '11:56', 'Pomona', 'alias officia ex ut odio.  cumque nam. ', 1276);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1249, to_date('09-10-2017', 'dd-mm-yyyy'), '16:56', 'Oberwangen', 'aut et culpa. ', 2235);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1251, to_date('26-03-2015', 'dd-mm-yyyy'), '18:10', 'Swarthmore', 'ut non optio mollitia aliqua.  quo alias vero ducimus ea.  sunt veniam harum sint. ', 2268);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1252, to_date('07-05-2021', 'dd-mm-yyyy'), '6:43', 'Towson', 'sunt molestias dolorum facilis dolorum. ', 2349);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1253, to_date('26-08-2008', 'dd-mm-yyyy'), '16:26', 'Batavia', 'officiis facere. ', 2339);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1254, to_date('19-08-2007', 'dd-mm-yyyy'), '21:29', 'Ilmenau', 'est laborum culpa tenetur et.  cum eveniet ut voluptate aute.  et. ', 1294);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1255, to_date('16-01-2001', 'dd-mm-yyyy'), '19:13', 'Carlin', 'quidem ut tempor. ', 2319);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1256, to_date('16-01-2015', 'dd-mm-yyyy'), '17:13', 'Fort worth', 'voluptates sunt et sapiente ipsum.  laboris eligendi et tempore autem. ', 1257);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1257, to_date('13-09-2020', 'dd-mm-yyyy'), '0:16', 'Los Alamos', 'minus voluptates aut tempor ut.  mollitia non ipsum praesentium et.  aliqua praesentium. ', 2251);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1258, to_date('24-08-2003', 'dd-mm-yyyy'), '15:57', 'Helsinki', 'eu velit voluptatum est non.  voluptas ut. ', 2365);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1259, to_date('08-08-2017', 'dd-mm-yyyy'), '17:49', 'Burgess Hill', 'labore nihil enim maiores a. ', 2368);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1260, to_date('27-03-2009', 'dd-mm-yyyy'), '3:45', 'Hannover', 'odio sunt fuga nihil corrupti.  est officia minim quibusdam rerum.  irure non officiis asperiores. ', 2236);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1261, to_date('09-12-2020', 'dd-mm-yyyy'), '12:0', 'Alexandria', 'qui facere sint autem temporibus.  dolores repellat nisi tempor et.  duis animi libero. ', 1292);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1262, to_date('12-06-2009', 'dd-mm-yyyy'), '9:44', 'Rua eteno', 'molestias et incididunt. ', 2293);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1263, to_date('28-05-2004', 'dd-mm-yyyy'), '17:58', 'Mason', 'doloribus quos repudiandae sit rerum. ', 2327);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1264, to_date('19-04-2014', 'dd-mm-yyyy'), '15:29', 'Ft. Leavenworth', 'doloribus soluta et eveniet dolore.  eligendi id. ', 1150);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1265, to_date('19-10-2005', 'dd-mm-yyyy'), '14:2', 'New York City', 'accusamus deleniti et in reprehenderit.  optio quis voluptates non distinctio. ', 2299);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1266, to_date('03-01-2023', 'dd-mm-yyyy'), '1:28', 'Enfield', 'et minus id et maxime.  culpa dolor velit pariatur occaecat.  in. ', 1242);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1267, to_date('30-07-2000', 'dd-mm-yyyy'), '20:38', 'East Providence', 'accusamus accusamus deserunt blanditiis elit.  consequat. ', 1265);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1268, to_date('26-04-2020', 'dd-mm-yyyy'), '5:28', 'Chennai', 'possimus laborum ut. ', 2350);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1269, to_date('15-11-2002', 'dd-mm-yyyy'), '11:57', 'Oak park', 'optio placeat qui dolor cillum.  duis quis irure id dolor.  reprehenderit sit. ', 2313);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1270, to_date('23-12-2013', 'dd-mm-yyyy'), '16:58', 'Oldham', 'minim mollitia nostrud sint nam.  reiciendis mollitia eos nostrud consequat.  ex eiusmod. ', 2274);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1272, to_date('07-03-2019', 'dd-mm-yyyy'), '20:51', 'Wehrheim', 'quod quo lorem qui in.  quos commodo nulla officia similique.  soluta non. ', 1216);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1273, to_date('28-11-2009', 'dd-mm-yyyy'), '8:31', 'Nashua', 'enim molestias nulla mollitia quis. ', 2285);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1274, to_date('13-02-2022', 'dd-mm-yyyy'), '5:12', 'Knoxville', 'aut lorem aut earum quos.  et debitis et sint in.  et tempor libero sint culpa.  delectus non. ', 1162);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1275, to_date('07-04-2013', 'dd-mm-yyyy'), '2:16', 'Mayfield Village', 'dolore sunt est eligendi saepe.  expedita asperiores hic saepe. ', 1216);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1276, to_date('27-12-2020', 'dd-mm-yyyy'), '20:27', 'Corona', 'nulla est dignissimos eveniet itaque. ', 1283);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1277, to_date('09-10-2002', 'dd-mm-yyyy'), '15:22', 'Wavre', 'hic. ', 1134);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1278, to_date('03-04-2001', 'dd-mm-yyyy'), '15:43', 'Narrows', 'ut rerum placeat adipisicing fuga.  assumenda id. ', 2370);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1279, to_date('17-06-2015', 'dd-mm-yyyy'), '16:8', 'Mönchengladbach', 'optio commodo placeat. ', 2340);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1280, to_date('27-08-2009', 'dd-mm-yyyy'), '20:15', 'Bremen', 'do. ', 1248);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1281, to_date('05-01-2013', 'dd-mm-yyyy'), '2:32', 'Rockford', 'est rerum occaecati aute quibusdam.  blanditiis aliqua in cupidatat in.  aliquip. ', 1289);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1282, to_date('21-08-2023', 'dd-mm-yyyy'), '12:0', 'St. Louis', 'mollit odio laborum voluptate. ', 1235);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1283, to_date('09-08-2020', 'dd-mm-yyyy'), '19:58', 'Herdecke', 'reprehenderit necessitatibus dolore ut id.  debitis optio provident non vero. ', 2346);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1284, to_date('25-10-2011', 'dd-mm-yyyy'), '23:51', 'Giessen', 'corrupti ipsum ea. ', 2229);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1285, to_date('11-06-2000', 'dd-mm-yyyy'), '22:7', 'Oslo', 'repudiandae eiusmod repellat molestiae ipsum.  sint rerum asperiores nihil tenetur. ', 1277);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1286, to_date('21-02-2013', 'dd-mm-yyyy'), '18:19', 'Rozenburg', 'omnis. ', 2273);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1287, to_date('08-09-2010', 'dd-mm-yyyy'), '11:15', 'Koppl', 'et dolores ut anim est.  molestiae placeat et laborum accusamus. ', 1286);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1288, to_date('28-01-2003', 'dd-mm-yyyy'), '6:8', 'Mechanicsburg', 'cumque libero velit consectetur ut.  sunt commodo voluptates quas quis.  non. ', 2276);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1289, to_date('15-11-2018', 'dd-mm-yyyy'), '8:31', 'Di Savigliano', 'aliquip ducimus facilis eveniet ut.  enim deserunt eiusmod. ', 2286);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1290, to_date('19-06-2008', 'dd-mm-yyyy'), '2:48', 'Redondo beach', 'qui repudiandae similique consectetur. ', 1164);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1291, to_date('15-04-2003', 'dd-mm-yyyy'), '14:2', 'Kungens kurva', 'tenetur distinctio doloribus omnis. ', 2273);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1292, to_date('26-01-2001', 'dd-mm-yyyy'), '23:16', 'Berkeley', 'aut repellat non excepteur in.  quo veniam laborum quis id.  et et occaecati cupidatat. ', 1305);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1293, to_date('21-08-2012', 'dd-mm-yyyy'), '9:34', 'Lexington', 'lorem enim repellendus lorem et.  ut voluptate eveniet praesentium sunt.  velit ullamco. ', 2366);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1294, to_date('20-11-2008', 'dd-mm-yyyy'), '20:57', 'Seongnam-si', 'duis ut optio sed non.  ad ex qui non. ', 2257);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1295, to_date('13-04-2005', 'dd-mm-yyyy'), '23:13', 'Englewood Cliffs', 'reiciendis excepteur libero animi similique.  anim ad in eu at.  aut molestias. ', 2305);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1296, to_date('07-11-2004', 'dd-mm-yyyy'), '11:44', 'Forest Park', 'molestiae mollit eveniet asperiores deserunt.  eligendi dolorum nulla voluptates. ', 1276);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1297, to_date('23-08-2010', 'dd-mm-yyyy'), '22:59', 'Heiligenhaus', 'voluptate corrupti id amet do.  vero cum et iusto velit.  consectetur. ', 2253);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1298, to_date('05-01-2023', 'dd-mm-yyyy'), '0:54', 'Wichita', 'sed culpa. ', 1149);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1299, to_date('25-05-2003', 'dd-mm-yyyy'), '20:30', 'Lyngby', 'ad repudiandae nostrud autem voluptates.  ullamco. ', 1168);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1300, to_date('12-02-2005', 'dd-mm-yyyy'), '1:12', 'New Hope', 'dolorum aliquip occaecat est similique. ', 1188);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1301, to_date('24-06-2002', 'dd-mm-yyyy'), '6:48', 'Chambery', 'in ut dignissimos aut mollit.  ut voluptates eligendi voluptate debitis.  earum aut sint. ', 1204);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1302, to_date('05-02-2003', 'dd-mm-yyyy'), '13:43', 'Barueri', 'et expedita dolores harum proident.  ipsum voluptate iusto ut id. ', 2380);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1303, to_date('02-05-2001', 'dd-mm-yyyy'), '10:30', 'Billerica', 'voluptate in earum sint esse.  non exercitation in eos possimus. ', 1267);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1304, to_date('24-09-2004', 'dd-mm-yyyy'), '10:18', 'Raleigh', 'non reiciendis facere et id.  consequat in deserunt culpa. ', 1301);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1305, to_date('21-07-2013', 'dd-mm-yyyy'), '19:7', 'Englewood Cliffs', 'aut sint perferendis excepteur deserunt. ', 1280);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1306, to_date('01-08-2000', 'dd-mm-yyyy'), '18:42', 'Olivette', 'exercitation laboris amet mollit omnis.  sed ut quis esse non.  in sunt. ', 2280);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1307, to_date('04-06-2022', 'dd-mm-yyyy'), '19:21', 'Taoyuan', 'quas dolores minus molestias ut.  sunt accusamus dolore. ', 1224);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1308, to_date('23-04-2011', 'dd-mm-yyyy'), '3:48', 'Athens', 'veniam accusamus rerum distinctio a.  harum fuga deleniti. ', 2278);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1309, to_date('23-02-2019', 'dd-mm-yyyy'), '1:2', 'Lake Oswego', 'laborum saepe enim et duis. ', 1230);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, report_id)
values (1310, to_date('21-02-2015', 'dd-mm-yyyy'), '17:46', 'Barnegat', 'voluptate nihil pariatur non ad.  voluptate adipisicing elit veniam. ', 1303);
commit;
prompt 193 records loaded
prompt Loading EVENT_ACTIVITY...
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1166, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1309, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1191, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1193, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1267, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1130, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1151, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1210, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1196, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1154, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1172, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1118, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1251, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1225, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1130, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1189, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1170, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1233, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1115, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1237, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1176, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1221, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1235, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1149, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1122, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1284, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1287, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1202, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1140, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1186, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1253, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1154, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1156, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1207, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1114, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1265, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1248, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1282, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1286, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1304, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1272, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1134, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1125, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1119, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1161, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1190, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1114, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1156, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1286, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1226, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1284, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1150, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1245, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1182, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1119, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1176, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1181, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1150, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1120, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1266, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1295, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1120, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1220, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1169, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1253, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1283, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1122, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1267, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1308, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1223, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1116, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1212, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1262, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1181, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1231, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1137, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1147, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1209, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1169, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1149, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1135, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1138, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1116, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1159, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1135, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1206, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1306, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1306, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1126, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1133, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1170, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1197, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1231, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1305, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1297, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1161, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1139, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1164, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1133, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1289, 1119);
commit;
prompt 100 records committed...
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1175, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1204, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1298, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1172, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1261, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1197, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1188, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1130, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1263, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1264, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1295, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1252, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1167, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1208, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1209, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1299, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1192, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1182, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1116, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1245, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1209, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1278, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1149, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1195, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1160, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1245, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1239, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1216, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1181, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1174, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1118, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1136, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1240, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1267, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1127, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1150, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1183, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1195, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1175, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1228, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1260, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1244, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1129, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1289, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1165, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1263, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1164, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1240, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1191, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1163, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1113, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1286, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1267, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1137, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1207, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1192, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1292, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1169, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1162, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1178, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1170, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1203, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1223, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1279, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1144, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1197, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1264, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1231, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1204, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1296, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1144, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1184, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1129, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1298, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1132, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1222, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1282, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1214, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1217, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1208, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1188, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1269, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1241, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1265, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1299, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1145, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1249, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1148, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1230, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1111, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1157, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1169, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1288, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1239, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1132, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1308, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1218, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1215, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1262, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1157, 1119);
commit;
prompt 200 records committed...
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1218, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1211, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1121, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1212, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1205, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1304, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1270, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1279, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1120, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1219, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1280, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1161, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1221, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1166, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1206, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1222, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1213, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1305, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1193, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1175, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1255, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1181, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1121, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1225, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1197, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1259, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1262, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1134, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1139, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1242, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1288, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1166, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1275, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1252, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1132, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1228, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1162, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1139, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1294, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1307, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1209, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1224, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1164, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1135, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1151, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1191, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1205, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1226, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1111, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1111, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1309, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1191, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1112, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1183, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1234, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1276, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1117, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1176, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1201, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1282, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1169, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1304, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1138, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1163, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1270, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1163, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1173, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1248, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1137, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1258, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1307, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1159, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1192, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1189, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1224, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1274, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1309, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1171, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1285, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1140, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1282, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1219, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1172, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1278, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1206, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1187, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1269, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1197, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1237, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1118, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1303, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1302, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1148, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1279, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1310, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1208, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1233, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1113, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1127, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1151, 1117);
commit;
prompt 300 records committed...
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1206, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1211, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1188, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1140, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1283, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1304, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1261, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1307, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1285, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1273, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1198, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1217, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1260, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1214, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1116, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1273, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1269, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1115, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1137, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1136, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1174, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1138, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1151, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1268, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1179, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1136, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1286, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1254, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1128, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1184, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1138, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1143, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1224, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1202, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1179, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1191, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1129, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1142, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1202, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1199, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1114, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1203, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1268, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1123, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1237, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1133, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1159, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1161, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1150, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1309, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1264, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1199, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1239, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1244, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1179, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1231, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1188, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1258, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1213, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1205, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1303, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1119, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1296, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1231, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1207, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1147, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1130, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1224, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1189, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1185, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1201, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1280, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1122, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1208, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1287, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1274, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1210, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1269, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1124, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1209, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1310, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1175, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1270, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1211, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1203, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1200, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1135, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1306, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1142, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1298, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1217, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1236, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1269, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1294, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1211, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1150, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1173, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1134, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1232, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1305, 1111);
commit;
prompt 400 records committed...
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1142, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1168, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1124, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1144, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1236, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1209, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1244, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1126, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1115, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1245, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1266, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1297, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1261, 1111);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1236, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1261, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1168, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1219, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1281, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1170, 1115);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1284, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1276, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1172, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1281, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1170, 1114);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1153, 1116);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1260, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1174, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1254, 1113);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1268, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1206, 1117);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1231, 1119);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1269, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1286, 1118);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1124, 1112);
insert into EVENT_ACTIVITY (event_id, activity_id)
values (1196, 1111);
commit;
prompt 435 records loaded
prompt Loading VOLUNTEERS...
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Abraham', '45 Monk Road', '0522486031', 'elle.abraham@printtech.uk', 'retired', 100000000, 'Elle');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Coburn', '59 Irving Street', '0507018716', 'harriet.coburn@angieslist.yu', 'in process', 100000001, 'Harriet');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Weston', '71 Tolkan Ave', '0589223571', 'natascha.weston@valleyoaksystems.com', 'retired', 100000002, 'Natascha');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rucker', '106 Gallant Road', '0508996081', 'mel@trafficmanagement.com', 'active', 100000003, 'Mel');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Blanchett', '56 Frederic Blvd', '0549788010', 'neneh@cooktek.de', 'active', 100000004, 'Neneh');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Bloch', '84 Fairborn Ave', '0505676070', 'a.bloch@bedfordbancshares.de', 'active', 100000005, 'Ali');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gunton', '108 Ward Road', '0531962833', 'rosie.gunton@conagra.ch', 'active', 100000006, 'Rosie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Foley', '22 Judi Road', '0542349496', 'gord.foley@proclarity.jp', 'active', 100000007, 'Gord');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hewett', '50 Ming-Na', '0533399739', 'edgar@mainstreetbanks.ch', 'retired', 100000008, 'Edgar');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Boyle', '36 Helen Street', '0532692117', 'owen.boyle@sfmai.es', 'retired', 100000009, 'Owen');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McClinton', '97 Broadbent Road', '0523964197', 'colin.mcclinton@pscinfogroup.yu', 'in process', 100000010, 'Colin');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gosdin', '89 Warrington Ave', '0524260079', 'alan@diamondtechnologies.com', 'in process', 100000011, 'Alan');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gere', '21 Jimmie Ave', '0529404625', 'mgere@ksj.ch', 'in process', 100000012, 'Mekhi');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gertner', '24 Zevon Drive', '0505519628', 'i.gertner@hewlettpackard.uk', 'in process', 100000013, 'Irene');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Conway', '23rd Street', '0535877562', 'david.conway@curagroup.de', 'active', 100000014, 'David');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Vince', '66 Oak park Street', '0519640896', 'willem.vince@refinery.ch', 'retired', 100000015, 'Willem');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Dickinson', '10 Jessica Street', '0546318835', 'j.dickinson@elitemedical.com', 'active', 100000016, 'Johnny');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Overstreet', '368 McGowan Road', '0589434876', 'clive.overstreet@parker.in', 'in process', 100000017, 'Clive');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Smurfit', '403 Casey Street', '0505512071', 'heaths@vspan.com', 'in process', 100000018, 'Heath');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hatosy', '795 Niven Road', '0588264845', 'l.hatosy@prosum.de', 'in process', 100000019, 'Loreena');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Harris', '276 Jesse Road', '0529362601', 'miriam.harris@stonebrewing.za', 'active', 100000020, 'Miriam');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Union', '12 Banbury Street', '0529396222', 'nunion@signalperfection.ch', 'in process', 100000021, 'Nanci');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rain', '33 Benson Drive', '0515388551', 'isabella.rain@venoco.com', 'in process', 100000022, 'Isabella');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Henstridge', '27 Cocker Ave', '0527711956', 'william.h@investmentscorecard.it', 'active', 100000023, 'William');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Squier', '98 Secada Blvd', '0536333549', 'ashton.squier@grs.com', 'retired', 100000024, 'Ashton');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Doucette', '36 Burns', '0511465378', 'vickie.doucette@smartronix.com', 'active', 100000025, 'Vickie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('White', '65 Rudd Road', '0531648894', 'crystal.white@hiltonhotels.hu', 'in process', 100000026, 'Crystal');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Ward', '908 Horton Road', '0547182286', 'phil.w@operationaltechnologies.com', 'in process', 100000027, 'Phil');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Heald', '80 Cary Drive', '0511920356', 'd.heald@stmaryland.com', 'in process', 100000028, 'Dustin');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Giannini', '61 Maria Ave', '0525639370', 'campbellg@royalgold.pl', 'retired', 100000029, 'Campbell');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Noseworthy', '561 Williamson Road', '0527258839', 'marc.noseworthy@accesssystems.com', 'active', 100000030, 'Marc');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Swinton', '64 Beth', '0516392605', 'cswinton@alternativetechnology.com', 'in process', 100000031, 'Clea');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Llewelyn', '39 Thessaloniki Drive', '0531476395', 'l.llewelyn@sears.at', 'in process', 100000032, 'Loreena');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Schiavelli', '30 Crete', '0588078200', 'patti@ogiointernational.au', 'retired', 100000033, 'Patti');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Meniketti', '35 Forster', '0503635155', 'illeana.m@tropicaloasis.com', 'in process', 100000034, 'Illeana');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Culkin', '18 El-Saher Road', '0508636339', 'angie.culkin@globalwireless.com', 'active', 100000035, 'Angie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Eldard', '885 Kilmer Street', '0544838583', 'ani.eldard@blueoceansoftware.uk', 'active', 100000036, 'Ani');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Quinn', '77 Ward Street', '0549248436', 'laurence@ataservices.es', 'in process', 100000037, 'Laurence');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Tilly', '520 Mellencamp Road', '0504174486', 'marlon.tilly@atlanticnet.de', 'retired', 100000038, 'Marlon');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Wayans', '705 Clark Street', '0548033807', 'josh.wayans@pis.com', 'retired', 100000039, 'Josh');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Kinney', '45 Shawn', '0543208300', 'adam.kinney@unilever.my', 'active', 100000040, 'Adam');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rudd', '62 Hookah Street', '0514179446', 'queen.rudd@infopros.com', 'in process', 100000041, 'Queen');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Carlton', '51 San Mateo Drive', '0503269057', 'nicholas.carlton@fsffinancial.com', 'retired', 100000042, 'Nicholas');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Ojeda', '46 Jane Street', '0549144864', 'juliana.o@progressivedesigns.cr', 'active', 100000043, 'Juliana');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Kudrow', '41 Quaid Road', '0514843706', 'm.kudrow@alogent.de', 'retired', 100000044, 'Mel');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gaynor', '183 Feore Drive', '0543756047', 'p.gaynor@alogent.com', 'in process', 100000045, 'Patti');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Sledge', '13 Paltrow Road', '0521189770', 'nsledge@fra.de', 'active', 100000046, 'Nelly');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Choice', '22nd Street', '0532822350', 'alannah.choice@asa.it', 'retired', 100000047, 'Alannah');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Place', '68 Juliette Drive', '0584296264', 'kitty.place@wendysinternational.com', 'in process', 100000048, 'Kitty');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McAnally', '85 Grand Rapids Drive', '0537989368', 'h.mcanally@advertisingventures.fr', 'active', 100000049, 'Hugh');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Affleck', '45 Dabney Road', '0586061215', 'lucy.affleck@mqsoftware.de', 'active', 100000050, 'Lucy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McGinley', '34 Trenton Road', '0506104925', 'chi.mcginley@adolph.com', 'in process', 100000051, 'Chi');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gertner', '85 Tolkan Street', '0516976432', 'gin.gertner@datawarehouse.com', 'retired', 100000052, 'Gin');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Dean', '81 Moody Road', '0523656263', 'w.dean@wlt.com', 'active', 100000053, 'Walter');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Child', '13 Fiorentino Road', '0549880340', 'r.child@airmethods.ca', 'active', 100000054, 'Ricardo');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Ruffalo', '2 Karen Road', '0548590889', 'adrien.ruffalo@innovativelighting.ch', 'in process', 100000055, 'Adrien');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Womack', '19 Glen allen Drive', '0529546622', 'ralph.w@pioneerdatasystems.com', 'in process', 100000056, 'Ralph');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Evans', '65 Lynn Street', '0589680949', 'tia.evans@kellogg.com', 'active', 100000057, 'Tia');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Chappelle', '93 Joely Drive', '0535755988', 'alessandro.chappelle@techrx.au', 'active', 100000058, 'Alessandro');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Pollack', '29 Cypress', '0519817263', 'heather.pollack@vitacostcom.de', 'retired', 100000059, 'Heather');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Lizzy', '58 Vincent Drive', '0589222795', 'daniel.lizzy@cooktek.com', 'active', 100000060, 'Daniel');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Grant', '9 Graham Drive', '0589242395', 'cgrant@venoco.fi', 'active', 100000061, 'Carl');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Willard', '24 Burmester Street', '0589730340', 'philipw@mds.com', 'in process', 100000062, 'Philip');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cromwell', '91 Kotto Street', '0513251963', 'jonathan.cromwell@techbooks.uk', 'in process', 100000063, 'Jonathan');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Elliott', '626 Orlando Drive', '0559281113', 'bridget.elliott@sweetproductions.com', 'in process', 100000064, 'Bridget');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Warden', '65 Stellan Street', '0551717223', 'lwarden@linksys.br', 'active', 100000065, 'Lee');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Field', '491 Kirkwood Drive', '0557148152', 'dwight@gcd.com', 'in process', 100000066, 'Dwight');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Aiken', '166 Karon Ave', '0553391491', 'mykelti@visionarysystems.ca', 'in process', 100000067, 'Mykelti');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Moffat', '91 Rosas Road', '0503537475', 'george.moffat@wyeth.ca', 'in process', 100000068, 'George');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Schneider', '41st Street', '0519814357', 'mark.schneider@smg.com', 'retired', 100000069, 'Mark');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McGregor', '650 LuPone Blvd', '0529256957', 'andre.mcgregor@career.com', 'in process', 100000070, 'Andre');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hong', '34 Horsham Street', '0525409962', 'ehong@anheuserbusch.de', 'in process', 100000071, 'Ethan');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Reid', '22 Brookfield Drive', '0554700778', 'azucar.r@ccfholding.jp', 'active', 100000072, 'Azucar');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Perrineau', '64 Finn Street', '0527215146', 'nicky.perrineau@aop.com', 'active', 100000073, 'Nicky');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rucker', '15 Joanna', '0581531858', 'j.rucker@columbiabancorp.com', 'retired', 100000074, 'Johnette');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cox', '416 Cate Blvd', '0505256803', 'burton.c@globalwireless.be', 'active', 100000075, 'Burton');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Lorenz', '86 Edgar Street', '0541401775', 'rlorenz@usenergyservices.it', 'active', 100000076, 'Rolando');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Sanders', '58 Duncan Drive', '0526638841', 'wang.sanders@execuscribe.de', 'in process', 100000077, 'Wang');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Jackson', '51 Postlethwaite Drive', '0535306383', 'k.jackson@y2marketing.de', 'active', 100000078, 'Kyra');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gates', '344 Marin Blvd', '0514199067', 'naomi.gates@computersource.com', 'retired', 100000079, 'Naomi');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Streep', '994 Maceo Blvd', '0535978782', 'julies@accucode.de', 'in process', 100000080, 'Julie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rodriguez', '82nd Street', '0523526668', 'suzanne.rodriguez@atxforms.ca', 'in process', 100000081, 'Suzanne');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Blair', '97 Ojeda Street', '0548493415', 'maggie.blair@cmi.com', 'active', 100000082, 'Maggie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cohn', '19 Carrere Street', '0506998169', 'omar.c@randomwalk.com', 'active', 100000083, 'Omar');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Ontiveros', '42nd Street', '0503198243', 'don.ontiveros@prahs.ca', 'retired', 100000084, 'Don');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Dorff', '72nd Street', '0531442464', 'alfie@randomwalk.uk', 'retired', 100000085, 'Alfie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Elizabeth', '55 Charlotte Blvd', '0538541654', 'avenged@hondamotor.com', 'in process', 100000086, 'Avenged');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Luongo', '86 McIntyre Road', '0588036140', 'wade.luongo@gtp.it', 'in process', 100000087, 'Wade');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Weller', '15 Palin Drive', '0509434467', 'timothy@bigyanksports.com', 'retired', 100000088, 'Timothy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Meyer', '412 Santa Cruz Drive', '0547439145', 'leelee@dataprise.com', 'retired', 100000089, 'Leelee');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Teng', '169 Ramsey Street', '0548526884', 'leslie.teng@loreal.com', 'in process', 100000090, 'Leslie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('DeVita', '742 Rea Road', '0544784755', 'pdevita@anworthmortgage.com', 'retired', 100000091, 'Penelope');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Donelly', '7 Liotta Drive', '0516352995', 'demi@montpelierplastics.it', 'active', 100000092, 'Demi');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Weller', '70 Noumea Road', '0549527450', 'harvey.w@sensortechnologies.com', 'active', 100000093, 'Harvey');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Walker', '5 Kershaw Street', '0507626399', 'carlenew@cocacola.th', 'in process', 100000094, 'Carlene');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Yorn', '81 Kieran', '0517896952', 'ewan.y@trafficmanagement.ch', 'active', 100000095, 'Ewan');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McFerrin', '12nd Street', '0583799817', 'pamela.mcferrin@woronocobancorp.br', 'retired', 100000096, 'Pamela');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hartnett', '849 Hagerty Drive', '0584301595', 'diamond.hartnett@wrgservices.com', 'in process', 100000097, 'Diamond');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Burke', '9 Benson Drive', '0506543507', 'jodyb@daimlerchrysler.cn', 'retired', 100000098, 'Jody');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Fonda', '39 Gilliam Road', '0583962761', 'rachael.fonda@at.de', 'active', 100000099, 'Rachael');
commit;
prompt 100 records committed...
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Balk', '57 Birch Street', '0514858257', 'king.balk@unit.fr', 'in process', 100000100, 'King');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cale', '33rd Street', '0546363456', 'brittany.cale@infopros.com', 'retired', 100000101, 'Brittany');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Ermey', '72 Jeroen Ave', '0522008154', 'don@pharmafab.com', 'active', 100000102, 'Don');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hatosy', '13rd Street', '0589153352', 'arnold@venoco.com', 'active', 100000103, 'Arnold');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gano', '16 Swayze Drive', '0542545381', 'r.gano@diageo.ca', 'retired', 100000104, 'Rhett');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Northam', '20 Chaykin Street', '0513687672', 'v.northam@speakeasy.com', 'retired', 100000105, 'Victoria');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Fisher', '72 Kurtz Drive', '0506786035', 'nfisher@linksys.com', 'retired', 100000106, 'Nicky');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Skarsgard', '88 Harnes', '0532427821', 'hector.skarsgard@pra.de', 'in process', 100000107, 'Hector');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Giraldo', '39 Willard Street', '0545935325', 'debra.giraldo@scripnet.com', 'active', 100000108, 'Debra');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Schwimmer', '30 Merrilee Road', '0547909019', 'chrissie.schwimmer@keith.no', 'in process', 100000109, 'Chrissie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rifkin', '88 Parker Street', '0516729250', 'reneer@tmaresources.com', 'in process', 100000110, 'Renee');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Kretschmann', '79 Yulin Drive', '0549029980', 'nina.kretschmann@coridiantechnologies.jp', 'active', 100000111, 'Nina');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gambon', '36 Pierce Road', '0502167706', 'joan@dillards.se', 'active', 100000112, 'Joan');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Carrey', '71 Watley', '0512789485', 'terri.carrey@dancor.ca', 'retired', 100000113, 'Terri');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Weiss', '3 Caviezel Drive', '0507886268', 'carl.weiss@career.jp', 'retired', 100000114, 'Carl');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Visnjic', '91 Mifune Blvd', '0536841553', 'thin.visnjic@heritagemicrofilm.ca', 'in process', 100000115, 'Thin');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Shaye', '21 Whitman', '0523617382', 'madeleine@royalgold.at', 'retired', 100000116, 'Madeleine');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Barkin', '13rd Street', '0585411444', 'kurt@wci.com', 'retired', 100000117, 'Kurt');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Landau', '75 Viterelli Ave', '0553741338', 'will.landau@quakercitybancorp.de', 'active', 100000118, 'Will');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Callow', '72nd Street', '0548430784', 'vince.callow@stm.com', 'retired', 100000119, 'Vince');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rubinek', '47 Sugar Land Drive', '0533285350', 'rhett.rubinek@aco.de', 'active', 100000120, 'Rhett');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Warren', '59 Tyrone Road', '0546832481', 'willie@homedepot.dk', 'in process', 100000121, 'Willie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Jamal', '39 Parsippany Ave', '0511528208', 'humberto.jamal@bmm.il', 'retired', 100000122, 'Humberto');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hersh', '5 Gleeson Drive', '0533381555', 'stephen.hersh@mission.com', 'active', 100000123, 'Stephen');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Sandoval', '76 Gallagher Road', '0525837907', 'jackie.sandoval@solutionbuilders.dk', 'in process', 100000124, 'Jackie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Jovovich', '22nd Street', '0528356493', 'ajovovich@hps.com', 'retired', 100000125, 'Annette');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Beckham', '75 Ruiz Street', '0544378659', 'donal.beckham@grs.com', 'in process', 100000126, 'Donal');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Tobolowsky', '17 Zevon Drive', '0551650406', 'frankie.t@elitemedical.jp', 'retired', 100000127, 'Frankie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Williamson', '13rd Street', '0535274854', 'rickiew@sis.com', 'active', 100000128, 'Rickie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Winger', '25 Sean Road', '0557504113', 'r.winger@millersystems.com', 'active', 100000129, 'Rickie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cross', '88 Lisbon Street', '0589692341', 'katrin.cross@ait.de', 'active', 100000130, 'Katrin');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Davis', '32 Brooke Road', '0543532525', 'brothers.davis@ezecastlesoftware.dk', 'retired', 100000131, 'Brothers');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Sewell', '439 Ernie Ave', '0558498027', 'nile@egroup.uk', 'in process', 100000132, 'Nile');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Imperioli', '33 Fisher Road', '0513285501', 'torii@nha.ca', 'active', 100000133, 'Tori');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Perrineau', '43 Cape town', '0553400596', 'fisher.perrineau@kis.ge', 'in process', 100000134, 'Fisher');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Laws', '84 Gandolfini Drive', '0508497428', 'katie@mwh.com', 'in process', 100000135, 'Katie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Roth', '55 Lipnicki Street', '0528470519', 'tommy.roth@3tsystems.au', 'active', 100000136, 'Tommy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cartlidge', '76 O''Hara Street', '0537089179', 'e.cartlidge@cowlitzbancorp.de', 'retired', 100000137, 'Ellen');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Weisz', '23 Coughlan Blvd', '0559077903', 'rosco.weisz@kmart.de', 'active', 100000138, 'Rosco');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rudd', '33rd Street', '0511829853', 'hector@younginnovations.com', 'retired', 100000139, 'Hector');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Scorsese', '78 Clinton Street', '0505771493', 'j.scorsese@softworld.de', 'active', 100000140, 'Jon');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Francis', '32 Clark Ave', '0503951787', 'pierce@esoftsolutions.nc', 'retired', 100000141, 'Pierce');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Farris', '7 Chandler Drive', '0588646720', 'laurence.farris@mds.au', 'retired', 100000142, 'Laurence');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Sevenfold', '59 Allison Street', '0547487227', 'glenn.sevenfold@smartronix.br', 'active', 100000143, 'Glenn');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('DeVita', '18 Coleman Drive', '0589031710', 'gordie.devita@vms.com', 'active', 100000144, 'Gordie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Union', '25 Runcorn Road', '0529421403', 'jeffu@fflcbancorp.com', 'in process', 100000145, 'Jeff');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Bergen', '334 Dalley Street', '0556804341', 'rosie@mcdonalds.de', 'retired', 100000146, 'Rosie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Fraser', '57 Edinburgh Street', '0519894630', 'sigourney.fraser@fflcbancorp.com', 'retired', 100000147, 'Sigourney');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Broza', '249 Garry Street', '0555333220', 'a.broza@uem.com', 'retired', 100000148, 'Angie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Dale', '91st Street', '0539617880', 'talvin.dale@anworthmortgage.com', 'retired', 100000149, 'Talvin');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Sevigny', '32 Bridget Road', '0582460194', 'balthazar.sevigny@chhc.com', 'retired', 100000150, 'Balthazar');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Sweeney', '20 Humphrey Street', '0532131339', 'joe.sweeney@telwares.com', 'in process', 100000151, 'Joe');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Romijn-Stamos', '1 Crouch Ave', '0502444450', 'lizzy.romijnstamos@mds.nl', 'in process', 100000152, 'Lizzy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Bancroft', '783 Presley Blvd', '0502227017', 'cbancroft@clubone.com', 'retired', 100000153, 'Courtney');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Shocked', '51 Tara', '0558382262', 'sshocked@astute.be', 'active', 100000154, 'Sylvester');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gill', '803 Kris', '0537298828', 'j.gill@shufflemaster.ca', 'in process', 100000155, 'Judi');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Tippe', '70 Netanya Street', '0529492767', 'gtippe@pacificdatadesigns.br', 'in process', 100000156, 'Garry');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McIntyre', '30 Ledger Road', '0504503803', 'rhys.mcintyre@max.za', 'in process', 100000157, 'Rhys');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Reilly', '33 Shawn Ave', '0528403245', 'jim.reilly@monarchcasino.nl', 'active', 100000158, 'Jim');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Savage', '141 Fukui Street', '0529981354', 'p.savage@timevision.it', 'in process', 100000159, 'Paula');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Willis', '70 Osment Street', '0582686404', 'david.willis@kimberlyclark.uk', 'active', 100000160, 'David');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Branch', '15 Speaks Blvd', '0521438080', 'robbie@mls.de', 'active', 100000161, 'Robbie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Pleasure', '5 Walsh Road', '0559155763', 'gates.pleasure@microtek.com', 'active', 100000162, 'Gates');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Dreyfuss', '97 Bern Street', '0533051045', 'liev.d@talx.jp', 'retired', 100000163, 'Liev');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Leachman', '18 Green Drive', '0559846655', 'l.leachman@vfs.br', 'in process', 100000164, 'Laurie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cohn', '197 Hewitt Road', '0536211880', 'willie.cohn@americanmegacom.nl', 'retired', 100000165, 'Willie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gleeson', '220 Nakai Road', '0558566981', 'xanderg@providentbancorp.gr', 'in process', 100000166, 'Xander');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Aaron', '94 Brolin Road', '0549063188', 'donna.aaron@gillette.com', 'in process', 100000167, 'Donna');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hoskins', '451 Vin Drive', '0553817854', 'caroline.hoskins@reckittbenckiser.com', 'active', 100000168, 'Caroline');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cobbs', '76 Thewlis Road', '0585381577', 'dcobbs@career.de', 'active', 100000169, 'Dermot');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Roy Parnell', '972 Robards Ave', '0511611808', 'darius.royparnell@denaliventures.com', 'in process', 100000170, 'Darius');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hubbard', '23 Spine Drive', '0587438829', 'alfie.hubbard@generalmills.se', 'active', 100000171, 'Alfie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Shepherd', '40 Parm Street', '0516914183', 'kylie@progressivemedical.com', 'retired', 100000172, 'Kylie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Savage', '41st Street', '0536262915', 'h.savage@carboceramics.fr', 'in process', 100000173, 'Howard');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Holland', '5 Gilley Drive', '0554799832', 'clea.holland@bigyanksports.com', 'in process', 100000174, 'Clea');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Bergen', '84 Kazem Road', '0586936723', 'j.bergen@americanexpress.com', 'retired', 100000175, 'Jonathan');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Duvall', '42 McGowan Road', '0536874039', 'rosario.duvall@ait.com', 'in process', 100000176, 'Rosario');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Unger', '40 Cole Drive', '0502847576', 'buddy.unger@johnkeeler.com', 'active', 100000177, 'Buddy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Balk', '583 Dortmund Street', '0553680425', 'pablo.balk@accessus.si', 'active', 100000178, 'Pablo');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cattrall', '27 Cyndi Drive', '0515352953', 'beverley.cattrall@mag.com', 'in process', 100000179, 'Beverley');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Kapanka', '5 Sweeney Blvd', '0554553919', 'treat.kapanka@dataprise.lt', 'in process', 100000180, 'Treat');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Nolte', '614 Powers Ave', '0547289231', 'w.nolte@portosan.com', 'retired', 100000181, 'Wally');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hauer', '8 England Road', '0539254938', 'sheryl.hauer@businessplus.com', 'in process', 100000182, 'Sheryl');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Dale', '46 Branagh Drive', '0538904216', 'elijah@oriservices.com', 'in process', 100000183, 'Elijah');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Saxon', '559 Giraldo Road', '0547050918', 'nile.saxon@evinco.no', 'in process', 100000184, 'Nile');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McCready', '93 Ron Road', '0586729251', 'gates.m@kroger.dk', 'in process', 100000185, 'Gates');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Lonsdale', '8 Chuck Road', '0546997099', 'glonsdale@bat.com', 'active', 100000186, 'Gavin');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Woods', '3 Terri Road', '0583278912', 'awoods@stonetechprofessional.nl', 'retired', 100000187, 'Alfred');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Tyler', '15 Wahlberg Blvd', '0541792777', 'gordon.tyler@refinery.br', 'active', 100000188, 'Gordon');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Nunn', '100 Hubbard Street', '0525643310', 'ronny.nunn@astute.uk', 'retired', 100000189, 'Ronny');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('May', '36 Silver Spring Street', '0534320992', 'sonam@timberlanewoodcrafters.es', 'in process', 100000190, 'Sona');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Williamson', '53rd Street', '0581973358', 'sheryl@spenser.com', 'retired', 100000191, 'Sheryl');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Vanian', '44 Oldham Street', '0523013221', 'c.vanian@nrae.de', 'retired', 100000192, 'Cate');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Snider', '40 McCain Street', '0503667154', 'xander.snider@cis.de', 'in process', 100000193, 'Xander');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Stowe', '24 Kadison Street', '0542840030', 'astowe@nissanmotor.com', 'retired', 100000194, 'Alice');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rydell', '82nd Street', '0585818641', 'lrydell@floorgraphics.it', 'active', 100000195, 'Lennie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Martinez', '4 Raye Street', '0515998626', 'r.martinez@news.au', 'active', 100000196, 'Rhett');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Ontiveros', '81 Donna Blvd', '0534722707', 'manu.ontiveros@northhighland.com', 'active', 100000197, 'Manu');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Stiles', '8 Sydney Drive', '0544166115', 'lstiles@cocacola.se', 'in process', 100000198, 'Loretta');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Katt', '600 Dempsey Road', '0524464689', 'janice.katt@msdw.fr', 'active', 100000199, 'Janice');
commit;
prompt 200 records committed...
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Esposito', '57 Jamal Blvd', '0509194794', 'cheech.esposito@saltgroup.au', 'active', 100000200, 'Cheech');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Mellencamp', '34 Skerritt Street', '0589791288', 'sinead.mellencamp@woronocobancorp.es', 'retired', 100000201, 'Sinead');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Condition', '922 Vai Drive', '0541244930', 'dermot.condition@supplycorecom.uk', 'retired', 100000202, 'Dermot');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Redgrave', '45 Marianne Road', '0528762341', 'domingo.redgrave@hudsonriverbancorp.com', 'retired', 100000203, 'Domingo');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Barnett', '40 Sam Street', '0534709143', 'guy.b@inzone.br', 'active', 100000204, 'Guy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Lineback', '91st Street', '0533064619', 'rlineback@gdatechnologies.com', 'retired', 100000205, 'Roscoe');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Coolidge', '96 Arjona Drive', '0531488901', 'c.coolidge@boldtechsystems.de', 'active', 100000206, 'Christine');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rhymes', '716 Buckingham Drive', '0535734278', 'julianne.rhymes@ait.com', 'retired', 100000207, 'Julianne');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gray', '74 Brisbane Ave', '0526813108', 'mikag@toyotamotor.com', 'active', 100000208, 'Mika');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Kinski', '74 Rio', '0535292861', 'gordon.kinski@marketbased.si', 'retired', 100000209, 'Gordon');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Carlisle', '73 Ivan Drive', '0509739637', 'kate.carlisle@efcbancorp.com', 'in process', 100000210, 'Kate');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Tankard', '587 Lorraine Road', '0581918251', 'scarlettt@meritagetechnologies.com', 'in process', 100000211, 'Scarlett');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Phillips', '15 Giraldo', '0511054554', 'nicholas.phillips@gltg.br', 'active', 100000212, 'Nicholas');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Chinlund', '26 Laura Drive', '0531999018', 'aidac@trusecure.ht', 'active', 100000213, 'Aida');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hawke', '21 Burton Blvd', '0543152311', 'randall.hawke@ivci.es', 'in process', 100000214, 'Randall');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Fierstein', '24 Bob Road', '0549458701', 'neve.fierstein@americanexpress.com', 'retired', 100000215, 'Neve');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Bailey', '579 Pasadena Blvd', '0545054476', 'trickb@sis.com', 'retired', 100000216, 'Trick');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Mars', '13rd Street', '0508867202', 'jared.mars@entelligence.com', 'active', 100000217, 'Jared');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rickles', '62 Juno Beach Street', '0536885546', 'wesley.rickles@news.com', 'retired', 100000218, 'Wesley');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Oakenfold', '100 Armatrading Road', '0501977250', 'patti.oakenfold@msdw.tr', 'in process', 100000219, 'Patti');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Blossoms', '100 Bebe Street', '0552678339', 'jay.blossoms@north.de', 'active', 100000220, 'Jay');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Lindo', '54 Mississauga Street', '0536360283', 'harrison.lindo@horizonorganic.jp', 'retired', 100000221, 'Harrison');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Francis', '32 Mohr Blvd', '0511424474', 'chalee.francis@gagwear.gr', 'in process', 100000222, 'Chalee');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Bryson', '22 Pablo Street', '0547459811', 'fionnula.bryson@homedepot.de', 'active', 100000223, 'Fionnula');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gore', '32nd Street', '0515949577', 'bgore@cns.es', 'retired', 100000224, 'Betty');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Phoenix', '64 Broza Blvd', '0504387577', 'rphoenix@merck.jp', 'active', 100000225, 'Rade');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gibson', '64 McFerrin Street', '0585748063', 'halle@portosan.com', 'active', 100000226, 'Halle');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Vince', '47 April Drive', '0582207757', 'caroline.vince@grayhawksystems.be', 'retired', 100000227, 'Caroline');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Dreyfuss', '52 Jeffrey Street', '0543728507', 'lea.dreyfuss@hcoa.nl', 'retired', 100000228, 'Lea');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Satriani', '52 Saxon Drive', '0521936865', 'gena.satriani@ezecastlesoftware.de', 'active', 100000229, 'Gena');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Blanchett', '37 Osborne Road', '0529488359', 'ricardob@simplycertificates.de', 'retired', 100000230, 'Ricardo');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('De Niro', '28 McDowell Street', '0551316484', 'heath.d@caliber.es', 'active', 100000231, 'Heath');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Wiest', '751 Bryan Ave', '0524768344', 'naomi.wiest@wrgservices.com', 'in process', 100000232, 'Naomi');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Ball', '77 Quinlan Street', '0516435003', 'ricky.ball@tripwire.com', 'active', 100000233, 'Ricky');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Colin Young', '85 Scaggs Blvd', '0584540652', 'meryl.colinyoung@bashen.de', 'retired', 100000234, 'Meryl');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cozier', '27 Coburn Street', '0504195994', 'barbara.cozier@ivci.mx', 'retired', 100000235, 'Barbara');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Shepherd', '86 Cobbs Blvd', '0522375177', 'nastassja.shepherd@unicru.com', 'in process', 100000236, 'Nastassja');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Sweeney', '86 Peterson Drive', '0523613790', 'sydney.sweeney@alohanysystems.com', 'in process', 100000237, 'Sydney');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Giraldo', '13 Rydell Drive', '0519365237', 'j.giraldo@investorstitle.it', 'retired', 100000238, 'Jason');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Baker', '87 Tolkan', '0517882194', 'gord.baker@veritekinternational.jp', 'retired', 100000239, 'Gord');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gibson', '430 Gilberto Street', '0525381993', 'arturo@aco.de', 'retired', 100000240, 'Arturo');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Studi', '46 Benoit Road', '0557902407', 'joshs@ogiointernational.com', 'retired', 100000241, 'Josh');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Larter', '98 Jonny Lee Road', '0533019212', 'lari.larter@mms.nl', 'in process', 100000242, 'Lari');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Leguizamo', '78 Kristin Ave', '0544442123', 'buddy.leguizamo@serentec.com', 'active', 100000243, 'Buddy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Sledge', '86 Turner Ave', '0507959978', 'roscos@north.hu', 'retired', 100000244, 'Rosco');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Salonga', '50 Hatchet Drive', '0511990635', 'sylvester.salonga@idas.com', 'in process', 100000245, 'Sylvester');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gambon', '5 Palmer Blvd', '0529487376', 'nastassja.gambon@pepsico.nl', 'active', 100000246, 'Nastassja');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Irving', '12 Place Street', '0546624817', 'johnnie@apexsystems.com', 'retired', 100000247, 'Johnnie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Brody', '919 Trento Road', '0548589748', 'jesus.brody@questarcapital.jp', 'retired', 100000248, 'Jesus');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McDowall', '9 Columbia Street', '0504964281', 'carol.m@gdi.com', 'active', 100000249, 'Carol');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Kier', '23 Charlottesville Street', '0521215927', 'crispin.kier@dsp.cr', 'in process', 100000250, 'Crispin');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Boyle', '3 Tempest Road', '0535863903', 'bradley.boyle@jsa.com', 'retired', 100000251, 'Bradley');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cole', '92 Bratislava Street', '0524037546', 'elizabethc@quakercitybancorp.uk', 'retired', 100000252, 'Elizabeth');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Brosnan', '80 Holbrook Blvd', '0532064830', 'thomasb@lloydgroup.com', 'in process', 100000253, 'Thomas');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Edmunds', '7 Lexington Street', '0532269347', 'lili.e@midwestmedia.uk', 'active', 100000254, 'Lili');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McNeice', '33 Greg Street', '0518387184', 'mmcneice@comnetinternational.uk', 'retired', 100000255, 'Merillee');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Quaid', '9 Tempe Drive', '0539349262', 'vincent.quaid@hfg.com', 'retired', 100000256, 'Vincent');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Page', '386 Luedenscheid Street', '0528120658', 'npage@hersheyfoods.com', 'retired', 100000257, 'Nelly');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rollins', '61 Loveland Road', '0587251977', 'taylor.rollins@mcdonalds.ca', 'in process', 100000258, 'Taylor');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Birch', '72 Pantoliano', '0558265357', 'orob@lemproducts.de', 'active', 100000259, 'Oro');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Furtado', '961 Cusack Blvd', '0582255546', 'janeane.furtado@swp.jp', 'in process', 100000260, 'Janeane');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Colman', '3 Rufus', '0503682710', 'curtis.colman@spotfireholdings.com', 'in process', 100000261, 'Curtis');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Nivola', '34 Levine Blvd', '0535080179', 'm.nivola@glmt.ca', 'retired', 100000262, 'Merrill');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Choice', '63rd Street', '0541215414', 'a.choice@atxforms.uk', 'active', 100000263, 'Albert');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Arthur', '90 Koppl Road', '0534330432', 'sonnya@pacificdatadesigns.tw', 'retired', 100000264, 'Sonny');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Blades', '4 Benoit Blvd', '0537972864', 'bebe.blades@pfizer.de', 'retired', 100000265, 'Bebe');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Holmes', '47 McNeice', '0529661600', 'carla.h@aventis.ee', 'retired', 100000266, 'Carla');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Glenn', '87 Denver Road', '0527861989', 'carlos.glenn@bps.com', 'in process', 100000267, 'Carlos');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Dourif', '90 Tamala Road', '0589586949', 'goldied@timberlanewoodcrafters.il', 'retired', 100000268, 'Goldie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Jolie', '75 S. Bernardo do Campo Ave', '0588185150', 'ving.jolie@montpelierplastics.com', 'active', 100000269, 'Ving');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Vannelli', '98 Meyer Street', '0514481787', 'uma.vannelli@cis.fr', 'active', 100000270, 'Uma');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rhames', '86 Seongnam-si Street', '0519759483', 'josh@cardinalcartridge.com', 'in process', 100000271, 'Josh');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Biehn', '79 Thorton Drive', '0531175913', 'peabo@travizon.it', 'active', 100000272, 'Peabo');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Van Shelton', '3 Chao Drive', '0589546515', 'jaime.vanshelton@avr.de', 'retired', 100000273, 'Jaime');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Washington', '829 Hope Street', '0505952151', 'forestw@horizon.com', 'active', 100000274, 'Forest');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Oates', '30 Schreiber Street', '0542264936', 'caroline.oates@linacsystems.com', 'in process', 100000275, 'Caroline');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Garza', '4 Harrison Street', '0516269897', 'willie.garza@hitechpharmacal.id', 'retired', 100000276, 'Willie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Nicks', '25 Jolie Drive', '0558036146', 'marty.nicks@mosaic.com', 'in process', 100000277, 'Marty');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Keen', '13 Spears Blvd', '0586704621', 'edwin.keen@pioneermortgage.uk', 'retired', 100000278, 'Edwin');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Bratt', '88 Bacon', '0549339218', 'minnie@wendysinternational.de', 'in process', 100000279, 'Minnie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McDormand', '80 Stafford', '0533037477', 'liv@unicru.ca', 'retired', 100000280, 'Liv');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Pantoliano', '6 Hall Road', '0546915828', 'grace.pantoliano@cimalabs.it', 'in process', 100000281, 'Grace');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Blair', '23 Temuera Ave', '0517449843', 'h.blair@investorstitle.com', 'retired', 100000282, 'Herbie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Wiedlin', '91 Kungens kurva Ave', '0541573767', 'arnold.wiedlin@capitalbank.com', 'active', 100000283, 'Arnold');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Durning', '55 Walsh Drive', '0509759129', 'elijah.durning@nhhc.com', 'retired', 100000284, 'Elijah');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rispoli', '81st Street', '0526296650', 'etta.rispoli@spd.uk', 'in process', 100000285, 'Etta');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Krieger', '64 Shatner Street', '0589120408', 'kenneth.krieger@ecopy.de', 'in process', 100000286, 'Kenneth');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Pigott-Smith', '22 Warren Blvd', '0531305521', 'candice@aquickdelivery.es', 'retired', 100000287, 'Candice');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Herrmann', '90 Griggs Drive', '0528541006', 'kyra@evergreenresources.com', 'in process', 100000288, 'Kyra');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Ellis', '45 Chicago Street', '0523608183', 'gilbertoe@accessus.com', 'active', 100000289, 'Gilberto');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Leoni', '88 Buffalo Street', '0589594376', 'vleoni@sds.com', 'retired', 100000290, 'Vince');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Mars', '33 Abraham Street', '0504836375', 'neneh@yashtechnologies.com', 'retired', 100000291, 'Neneh');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Holy', '55 Brasília Street', '0529451248', 'sally@arkidata.com', 'in process', 100000292, 'Sally');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Warwick', '48 Nolte', '0509404620', 'harvey.warwick@bayer.de', 'active', 100000293, 'Harvey');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Horizon', '6 Melba Ave', '0557615830', 'vondie@sps.hk', 'active', 100000294, 'Vondie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Flack', '21 Aiken Drive', '0549729309', 'e.flack@mercantilebank.com', 'active', 100000295, 'Ernie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Polley', '27 Steiger Street', '0524739643', 'meredith.polley@signalperfection.mx', 'active', 100000296, 'Meredith');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Fierstein', '4 Perth Road', '0541376907', 'hilary.fierstein@cmi.fr', 'active', 100000297, 'Hilary');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Johnson', '21 Bogguss Road', '0535270491', 'suzy@onesourceprinting.com', 'active', 100000298, 'Suzy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Botti', '63 DiFranco', '0588616743', 'stellan.botti@aco.com', 'in process', 100000299, 'Stellan');
commit;
prompt 300 records committed...
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Palmieri', '91 Ernest Street', '0559641095', 'fiona.palmieri@gci.de', 'active', 100000300, 'Fiona');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Underwood', '26 Wilmington Road', '0584542284', 'gladys@networkdisplay.de', 'retired', 100000301, 'Gladys');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hurt', '95 Balin Drive', '0518319047', 'aaron.hurt@fpf.jp', 'active', 100000302, 'Aaron');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Seagal', '4 Kevelaer Street', '0516636274', 'jeremy.seagal@bigyanksports.com', 'retired', 100000303, 'Jeremy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Brosnan', '55 Alfie Blvd', '0518547376', 'demi.brosnan@axis.in', 'retired', 100000304, 'Demi');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Forrest', '67 Marina Drive', '0584493865', 'solomon.forrest@evinco.nl', 'retired', 100000305, 'Solomon');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Suchet', '27 Rubinek Road', '0514781713', 'maureen.suchet@accessus.com', 'retired', 100000306, 'Maureen');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Wopat', '55 Gough Drive', '0557314395', 'hank.wopat@als.com', 'active', 100000307, 'Hank');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Navarro', '82nd Street', '0589965843', 'betty@americanexpress.it', 'retired', 100000308, 'Betty');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Curtis-Hall', '20 Bolzano Ave', '0584147460', 'gabriellec@nlx.es', 'retired', 100000309, 'Gabrielle');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Branagh', '45 Orton Road', '0504157553', 'j.branagh@mwh.com', 'retired', 100000310, 'Judy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Donelly', '697 Denis Road', '0525540663', 'patti.d@conquestsystems.br', 'active', 100000311, 'Patti');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Ford', '76 Bangalore Drive', '0549289849', 'bill@generalmills.com', 'in process', 100000312, 'Bill');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Schiff', '856 Gooding Drive', '0515486466', 'jesus.schiff@seafoxboat.jp', 'in process', 100000313, 'Jesus');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Bentley', '804 Garber Road', '0519952822', 'connie.bentley@stmaryland.de', 'active', 100000314, 'Connie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Sepulveda', '32 Cumming Blvd', '0555746160', 'j.sepulveda@jma.ca', 'in process', 100000315, 'Judge');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Mirren', '419 Pollak Drive', '0505093229', 'emm@heritagemicrofilm.com', 'retired', 100000316, 'Emm');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cruz', '35 Christine', '0547275364', 'neneh@bps.com', 'retired', 100000317, 'Neneh');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rowlands', '78 Lili Street', '0527868375', 'toshiro.rowlands@pfizer.br', 'retired', 100000318, 'Toshiro');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Haynes', '74 Wainwright', '0584988119', 'guy.haynes@mds.hu', 'retired', 100000319, 'Guy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Diddley', '72 Niigata Road', '0501309109', 'merrill@novartis.com', 'in process', 100000320, 'Merrill');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Tinsley', '44 Klein', '0515221511', 'roddy.tinsley@tilsonhr.com', 'retired', 100000321, 'Roddy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Finn', '48 Leelee Road', '0548726506', 'will.finn@glacierbancorp.de', 'retired', 100000322, 'Will');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Giamatti', '592 Pacific Grove', '0516540352', 'rosanne.giamatti@mattel.com', 'retired', 100000323, 'Rosanne');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Lowe', '68 Craig Road', '0537538407', 'dabney@seiaarons.com', 'in process', 100000324, 'Dabney');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Coyote', '81 Herndon Road', '0547228937', 'd.coyote@marsinc.com', 'active', 100000325, 'Dylan');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Lennix', '95 Shaw Street', '0537803930', 'julianna.lennix@bayer.com', 'in process', 100000326, 'Julianna');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Tate', '31st Street', '0506840969', 'l.tate@bayer.it', 'active', 100000327, 'Lila');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Albright', '98 Flanery Road', '0582436064', 'balthazar@comglobalsystems.it', 'active', 100000328, 'Balthazar');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cornell', '46 Shand Drive', '0534449098', 'shirley.c@slt.ee', 'in process', 100000329, 'Shirley');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Page', '74 Swank Road', '0532900112', 'sal.page@dis.com', 'in process', 100000330, 'Sal');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Steiger', '38 Tobolowsky Street', '0581362958', 'raymond.steiger@httprint.ca', 'active', 100000331, 'Raymond');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Strong', '27 Lowe Road', '0589015567', 'kevn.strong@cooktek.ch', 'retired', 100000332, 'Kevn');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Page', '11 Loeb Ave', '0553372975', 'anjelica.page@sprint.ar', 'in process', 100000333, 'Anjelica');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Nugent', '79 Patti Road', '0525535413', 'rawlins.nugent@fds.br', 'in process', 100000334, 'Rawlins');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rapaport', '14 Zooey Road', '0546190758', 'chloe.rapaport@ris.il', 'in process', 100000335, 'Chloe');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Brosnan', '213 West Windsor Street', '0513172099', 'm.brosnan@advertisingventures.it', 'in process', 100000336, 'Micky');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Lynn', '19 Rotterdam Drive', '0533568612', 'mel.lynn@cardtronics.com', 'in process', 100000337, 'Mel');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Dutton', '81 Hauser Road', '0523118628', 's.dutton@hotmail.com', 'retired', 100000338, 'Sonny');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('LuPone', '13 Matthew', '0521112741', 'e.lupone@aoe.ch', 'active', 100000339, 'Eric');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Bugnon', '69 Dillon Street', '0559774051', 'r.bugnon@logisticare.com', 'in process', 100000340, 'Rickie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Russo', '494 Caviezel Street', '0543136855', 'kenneth.russo@generalmotors.pk', 'retired', 100000341, 'Kenneth');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gugino', '18 Chalee Street', '0507582383', 'ernest.gugino@elitemedical.uk', 'retired', 100000342, 'Ernest');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cole', '43 Waldorf Ave', '0523903238', 'martin.cole@apexsystems.jp', 'retired', 100000343, 'Martin');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Caan', '10 Merchant Road', '0545844967', 'clarence.caan@scheringplough.uk', 'active', 100000344, 'Clarence');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Holbrook', '46 Fuchstal-asch Drive', '0559164645', 'sophie@coridiantechnologies.jp', 'in process', 100000345, 'Sophie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Latifah', '33 Wahlberg Street', '0526860967', 'jimmyl@activeservices.com', 'in process', 100000346, 'Jimmy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Wilder', '13 Raymond Road', '0502569856', 'jimmie.wilder@morganresearch.de', 'active', 100000347, 'Jimmie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Rooker', '28 Tara Road', '0582457957', 'cloris.r@insurmark.com', 'retired', 100000348, 'Cloris');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Coburn', '69 Mekhi Road', '0519966220', 'diane.coburn@jlphor.de', 'in process', 100000349, 'Diane');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Borden', '39 MacDowell Road', '0539807320', 'jeanluc.borden@usainstruments.com', 'in process', 100000350, 'Jean-Luc');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Vaughn', '21st Street', '0519549928', 'a.vaughn@americanexpress.com', 'retired', 100000351, 'Allan');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Lynch', '35 Spine Road', '0586117332', 'heath.l@aco.com', 'retired', 100000352, 'Heath');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Wainwright', '246 Depp Blvd', '0542577218', 'natasha.wainwright@qas.be', 'retired', 100000353, 'Natasha');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Zahn', '64 Popper Street', '0503787168', 'trick.zahn@palmbeachtan.uk', 'active', 100000354, 'Trick');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Giannini', '55 Netanya Drive', '0541529481', 'colm.g@bedfordbancshares.com', 'retired', 100000355, 'Colm');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Elliott', '80 Terri Road', '0535277982', 'zooey.elliott@dvdt.com', 'in process', 100000356, 'Zooey');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Reinhold', '54 Chan Blvd', '0504362314', 'ivan.reinhold@sourcegear.br', 'in process', 100000357, 'Ivan');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hopkins', '87 Mills', '0512938169', 'kazem.hopkins@otbd.de', 'in process', 100000358, 'Kazem');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Bale', '21 Harnes Street', '0559105631', 'tal.bale@limitedbrands.dk', 'retired', 100000359, 'Tal');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Vannelli', '42 Kristiansand Street', '0533307029', 'bvannelli@aquickdelivery.com', 'active', 100000360, 'Bonnie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Bogguss', '53 Michael Street', '0523990250', 'joshua.b@trm.uk', 'in process', 100000361, 'Joshua');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Washington', '94 Cagle Road', '0531055041', 'jane.washington@sfmai.com', 'in process', 100000362, 'Jane');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Moffat', '83rd Street', '0585327938', 'r.moffat@accesssystems.com', 'in process', 100000363, 'Robert');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Duvall', '380 Katrin Road', '0589152574', 'debi.duvall@wrgservices.es', 'in process', 100000364, 'Debi');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Sherman', '29 Lewin Road', '0507017343', 'rosario.sherman@qls.de', 'in process', 100000365, 'Rosario');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Bening', '61 Judd Street', '0558262810', 'andie.bening@pearllawgroup.de', 'active', 100000366, 'Andie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Anderson', '49 Thomas Street', '0508454354', 'marc.anderson@powerlight.ca', 'retired', 100000367, 'Marc');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Austin', '71 Pullman', '0526062648', 'raustin@connected.com', 'active', 100000368, 'Rhea');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Colin Young', '56 Lucinda Street', '0558091219', 'lupec@jollyenterprises.ca', 'retired', 100000369, 'Lupe');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Russo', '77 Carter Blvd', '0539536969', 'c.russo@vivendiuniversal.com', 'in process', 100000370, 'Cate');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Polito', '53 Lancaster Blvd', '0545507246', 'martha.polito@multimedialive.com', 'retired', 100000371, 'Martha');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Sampson', '12 Griffin Street', '0524948689', 'fionnula@providenceservice.com', 'retired', 100000372, 'Fionnula');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Karyo', '62nd Street', '0583247390', 'jonathan.karyo@tilia.de', 'retired', 100000373, 'Jonathan');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McCracken', '32 Royersford Drive', '0508663596', 'cornellm@jsa.de', 'active', 100000374, 'Cornell');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Raye', '31 Kay Ave', '0583539025', 'hector.raye@hencie.com', 'retired', 100000375, 'Hector');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Bugnon', '60 Carlsbad Road', '0504728415', 'larenz.bugnon@jsa.de', 'retired', 100000376, 'Larenz');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Holm', '39 Hope Road', '0535804928', 'janeane.holm@randomwalk.com', 'in process', 100000377, 'Janeane');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Fisher', '51st Street', '0554998409', 'ron.fisher@generalmotors.com', 'in process', 100000378, 'Ron');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Breslin', '63 Jolie Street', '0538262305', 'morris.breslin@saltgroup.com', 'retired', 100000379, 'Morris');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gough', '81 Penn Blvd', '0542659592', 'billy.gough@parksite.be', 'in process', 100000380, 'Billy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Tankard', '82 Pierce', '0544886606', 'j.tankard@aco.hu', 'active', 100000381, 'Jonny Lee');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Lunch', '47 Dwight Road', '0504541793', 'nickel.lunch@bestbuy.com', 'retired', 100000382, 'Nickel');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Saxon', '18 Goldie Road', '0587874342', 'ron.saxon@taycorfinancial.jp', 'in process', 100000383, 'Ron');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Redford', '77 Farris Ave', '0556194142', 'doug.redford@slt.ca', 'active', 100000384, 'Doug');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Aaron', '32 Playboys Road', '0551451075', 'r.aaron@hotmail.com', 'in process', 100000385, 'Randall');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Spine', '61st Street', '0543277443', 'm.spine@ssi.uk', 'retired', 100000386, 'Miguel');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Navarro', '92 Hartnett Ave', '0526516662', 'petula.navarro@loreal.ch', 'active', 100000387, 'Petula');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Fierstein', '5 Mazzello Drive', '0539452294', 'cledus.fierstein@lifelinesystems.com', 'retired', 100000388, 'Cledus');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Richter', '53rd Street', '0588221442', 'pelvic.richter@waltdisney.pl', 'active', 100000389, 'Pelvic');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Makowicz', '185 Ashley Road', '0533703138', 'donald.makowicz@mosaic.com', 'retired', 100000390, 'Donald');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hunt', '447 Faye Street', '0521586633', 'bridget.hunt@ssi.hk', 'retired', 100000391, 'Bridget');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Allison', '30 Dublin', '0517272128', 'gabrielle.a@kis.hu', 'in process', 100000392, 'Gabrielle');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Sewell', '28 Keeslar', '0503122584', 'karon@diamondgroup.de', 'retired', 100000393, 'Karon');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Patton', '996 Lucca Blvd', '0557791171', 'chris.patton@boldtechsystems.com', 'active', 100000394, 'Chris');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Kravitz', '36 West Chester Blvd', '0534167500', 'gord.kravitz@elmco.ch', 'retired', 100000395, 'Gord');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cockburn', '32 Lillard Road', '0551799556', 'vondie.cockburn@tilsonhr.de', 'in process', 100000396, 'Vondie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Field', '47 Battle Creek Road', '0538150329', 'afield@gateway.se', 'active', 100000397, 'Alessandro');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cherry', '40 Regensburg Drive', '0512243633', 'j.cherry@trx.com', 'active', 100000398, 'Jean-Claude');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Mueller-Stahl', '11st Street', '0506840051', 'emuellerstahl@baesch.com', 'active', 100000399, 'Edward');
commit;
prompt 400 records committed...
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('O''Connor', '58 Brentwood Drive', '0508155660', 'rufus.oconnor@randomwalk.com', 'active', 100000400, 'Rufus');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Leachman', '70 Louise Blvd', '0508033414', 'd.leachman@genextechnologies.de', 'in process', 100000401, 'Derrick');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McLean', '12 Etta Road', '0504834784', 'rickie.mclean@dancor.com', 'active', 100000402, 'Rickie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McDiarmid', '27 Tippe Blvd', '0511636168', 'pam.mcdiarmid@abs.uk', 'in process', 100000403, 'Pam');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Adams', '87 Kanata', '0503701176', 'dianne.adams@staffforce.de', 'retired', 100000404, 'Dianne');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Theron', '54 Ripley Blvd', '0521366872', 'sal.theron@dillards.com', 'active', 100000405, 'Sal');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Eat World', '2 Stiers Blvd', '0556092599', 'annie.eatworld@boldtechsystems.com', 'in process', 100000406, 'Annie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Sarandon', '33 Mantegna Street', '0551191635', 'ksarandon@atlanticnet.com', 'retired', 100000407, 'Kevn');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Patrick', '3 Butner Road', '0513036254', 'juliet.patrick@ntas.com', 'in process', 100000408, 'Juliet');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Imperioli', '87 Summer Road', '0531559309', 'jimperioli@swp.ch', 'active', 100000409, 'Juice');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Def', '849 Payton Street', '0588979422', 'alannah@horizonorganic.com', 'active', 100000410, 'Alannah');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Garber', '435 Framingham Ave', '0539883901', 'debra.garber@marsinc.jp', 'retired', 100000411, 'Debra');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Harmon', '26 Orlando Street', '0538772506', 'nik.harmon@consultants.br', 'active', 100000412, 'Nik');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gleeson', '34 Watson Drive', '0559534263', 'sgleeson@abs.uk', 'retired', 100000413, 'Sandra');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Chung', '3 Mazar Road', '0525143770', 'k.chung@irissoftware.com', 'active', 100000414, 'Kyra');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Kimball', '31st Street', '0552564192', 'seann.kimball@hewlettpackard.nz', 'in process', 100000415, 'Seann');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Pepper', '54 Yankovic Street', '0522519832', 'trinip@fflcbancorp.de', 'retired', 100000416, 'Trini');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Thurman', '821 Rose', '0521498346', 'lucinda.thurman@microtek.jp', 'in process', 100000417, 'Lucinda');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Wopat', '34 Randal Road', '0511661387', 'cwopat@atxforms.com', 'in process', 100000418, 'Carlos');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Leguizamo', '25 Favreau', '0553676264', 'v.leguizamo@consultants.fr', 'retired', 100000419, 'Viggo');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Yankovic', '54 Santana', '0531911871', 'diamond.y@infovision.de', 'active', 100000420, 'Diamond');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Yorn', '88 Braintree Ave', '0558766711', 'judd.yorn@ams.com', 'retired', 100000421, 'Judd');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Wills', '2 Jenkins Street', '0514352055', 'lou@marriottinternational.com', 'active', 100000422, 'Lou');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Wilkinson', '953 Unger Ave', '0515046258', 'dorry.wilkinson@freedommedical.au', 'in process', 100000423, 'Dorry');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McElhone', '17 Penn Road', '0542816881', 'fred.mcelhone@evinco.com', 'retired', 100000424, 'Fred');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Channing', '49 Stanley Ave', '0516544026', 'azucar.channing@venoco.com', 'active', 100000425, 'Azucar');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Loveless', '40 Glen Road', '0554295247', 'clint.loveless@atg.com', 'retired', 100000426, 'Clint');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cochran', '51st Street', '0581337915', 'lance@gltg.fr', 'in process', 100000427, 'Lance');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Lineback', '986 Barry Drive', '0524687229', 'lynn.lineback@stonebrewing.au', 'active', 100000428, 'Lynn');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Robinson', '36 Walnut Creek Street', '0552047788', 'trini.robinson@career.dk', 'retired', 100000429, 'Trini');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cox', '2 Köln Drive', '0512096007', 'eddie.c@bioreliance.au', 'in process', 100000430, 'Eddie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Baker', '86 Sisto Road', '0519202853', 'jeanne.baker@heritagemicrofilm.com', 'retired', 100000431, 'Jeanne');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Stewart', '11st Street', '0551640875', 'rebecca.stewart@accessus.ht', 'in process', 100000432, 'Rebecca');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Bacharach', '40 Streep Ave', '0509664375', 'a.bacharach@stonebrewing.it', 'in process', 100000433, 'Ashton');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Finney', '41st Street', '0532279955', 'rob.finney@hotmail.dk', 'retired', 100000434, 'Rob');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Greenwood', '68 Rubinek Street', '0548632559', 'p.greenwood@accuship.com', 'in process', 100000435, 'Peter');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McIntyre', '53rd Street', '0532153263', 'mykelti.mcintyre@sourcegear.de', 'retired', 100000436, 'Mykelti');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Macht', '9 Chiba Road', '0504385341', 'a.macht@dancor.com', 'in process', 100000437, 'Alannah');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Duchovny', '43rd Street', '0555703604', 'ernest.duchovny@cendant.il', 'active', 100000438, 'Ernest');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Weir', '423 Frost Street', '0587101212', 'meredith@bioanalytical.dk', 'retired', 100000439, 'Meredith');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Colon', '1 Kadison', '0516202534', 'christianc@coadvantageresources.au', 'in process', 100000440, 'Christian');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('MacDonald', '75 Dutton Street', '0526881228', 'stockard.macdonald@harrison.ca', 'active', 100000441, 'Stockard');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Flemyng', '519 Olyphant Ave', '0583390131', 'hazel.flemyng@ultimus.com', 'in process', 100000442, 'Hazel');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Garofalo', '63 Lizzy Ave', '0581081482', 'sgarofalo@portosan.com', 'retired', 100000443, 'Sander');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Conlee', '52 Guamo Street', '0559613247', 'omar.conlee@gcd.com', 'active', 100000444, 'Omar');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hart', '120 Fair Lawn', '0587255475', 'edie.hart@peerlessmanufacturing.de', 'active', 100000445, 'Edie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Crystal', '97 Hughes Street', '0526232042', 'domingo.crystal@accucode.br', 'retired', 100000446, 'Domingo');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Forrest', '58 Carrey Blvd', '0518556060', 'raymond.forrest@tropicaloasis.com', 'in process', 100000447, 'Raymond');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Gandolfini', '49 Sigourney Road', '0545370799', 'rosanne@directdata.dk', 'retired', 100000448, 'Rosanne');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Ali', '64 Dooley', '0532786092', 'wendy.ali@nsd.hu', 'active', 100000449, 'Wendy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Pierce', '644 Spader Blvd', '0526386347', 'eileen.pierce@accurateautobody.com', 'in process', 100000450, 'Eileen');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Jackson', '57 Curitiba Ave', '0546021795', 'colm.jackson@ibfh.ca', 'retired', 100000451, 'Colm');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Torino', '862 Allen Road', '0586409698', 'c.torino@supplycorecom.se', 'in process', 100000452, 'Cary');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Stiers', '95 Roberts Blvd', '0532152957', 'lois.stiers@mwp.il', 'in process', 100000453, 'Lois');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Jessee', '30 Idle', '0584861238', 'b.jessee@bis.com', 'in process', 100000454, 'Benjamin');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Presley', '70 Smith Ave', '0554599613', 'anne.p@prp.at', 'retired', 100000455, 'Anne');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Frampton', '53 Whitehouse Station Blvd', '0555130676', 'sframpton@freedommedical.jp', 'active', 100000456, 'Seth');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Dale', '81 Krieger Street', '0588889058', 'susan@socketinternet.br', 'retired', 100000457, 'Susan');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Snow', '71 Buscemi Street', '0534393317', 'yaphet.snow@palmbeachtan.de', 'in process', 100000458, 'Yaphet');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Mitchell', '31 Gunton Road', '0543456763', 'g.mitchell@mss.com', 'active', 100000459, 'Gena');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hagar', '18 Marianne Street', '0539193754', 'gloria.hagar@vspan.uk', 'retired', 100000460, 'Gloria');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Davison', '51st Street', '0526446966', 'jonny.davison@kelmooreinvestment.ch', 'in process', 100000461, 'Jonny');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Berkoff', '83 Karen Road', '0533860589', 'lila.berkoff@aco.com', 'active', 100000462, 'Lila');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Beck', '969 Englewood Street', '0508323601', 'w.beck@unicru.com', 'in process', 100000463, 'Wesley');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Def', '5 Laurence Street', '0531379202', 'leslied@northhighland.au', 'retired', 100000464, 'Leslie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Broderick', '71 Buenos Aires Street', '0587326940', 'garry.broderick@hardwoodwholesalers.com', 'active', 100000465, 'Garry');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Johnson', '76 Hunt Drive', '0517841766', 'temuera.johnson@newtoninteractive.fr', 'in process', 100000466, 'Temuera');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('McCready', '72 Lattimore Road', '0535663099', 'joe.mccready@swp.com', 'retired', 100000467, 'Joe');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Schiavelli', '81 Boulder Blvd', '0518642251', 'oded.s@saralee.com', 'in process', 100000468, 'Oded');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Weiss', '39 Oakenfold Road', '0536556076', 'sweiss@bestever.de', 'in process', 100000469, 'Sander');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Peniston', '100 Dorn Blvd', '0555709839', 'alex.peniston@ceo.ch', 'retired', 100000470, 'Alex');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Waits', '52 Springfield', '0542595272', 'adam.w@venoco.ge', 'active', 100000471, 'Adam');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Withers', '84 Holmes Street', '0542407534', 'r.withers@simplycertificates.com', 'retired', 100000472, 'Rip');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Costa', '81 Dardilly', '0582843710', 'denny.costa@fpf.com', 'retired', 100000473, 'Denny');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Michaels', '87 Crouse Street', '0514711175', 'c.michaels@coldstonecreamery.de', 'in process', 100000474, 'Christian');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Webb', '42 Fender Drive', '0501451193', 'x.webb@pinnaclestaffing.com', 'active', 100000475, 'Xander');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Azaria', '26 Twilley', '0523166279', 'carol.a@ams.es', 'in process', 100000476, 'Carol');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Parm', '23 Tommy Road', '0589269990', 'darius.parm@pinnaclestaffing.com', 'in process', 100000477, 'Darius');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Duvall', '36 Greenwood Road', '0519134810', 'embeth.duvall@chhc.com', 'active', 100000478, 'Embeth');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Francis', '43 Laurence Drive', '0501852751', 's.francis@spas.uk', 'active', 100000479, 'Stellan');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Berkeley', '5 Lisboa Road', '0556913979', 'brendab@infinity.uk', 'active', 100000480, 'Brenda');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Logue', '67 Parma', '0551089063', 'danni.logue@allegiantbancorp.com', 'in process', 100000481, 'Danni');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Larter', '54 Springville Road', '0512897265', 'thomas.larter@chhc.sg', 'active', 100000482, 'Thomas');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Williamson', '62 Jakarta Ave', '0587009442', 'robbie@gltg.uk', 'in process', 100000483, 'Robbie');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Kutcher', '41 Athens', '0532103954', 'todd.kutcher@meritagetechnologies.com', 'active', 100000484, 'Todd');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Brooks', '4 Haggard Drive', '0521016605', 'juice.brooks@microtek.com', 'retired', 100000485, 'Juice');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Cumming', '63rd Street', '0545140815', 'scott.cumming@hersheyfoods.ch', 'in process', 100000486, 'Scott');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Roy Parnell', '866 Morioka Street', '0555375746', 'buffy.royparnell@perfectorder.ca', 'in process', 100000487, 'Buffy');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Almond', '37 Suffern Drive', '0514646658', 'jeanluc@hiltonhotels.com', 'in process', 100000488, 'Jean-Luc');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Lynne', '86 Julia Street', '0587530550', 'cyndi.lynne@viacom.com', 'active', 100000489, 'Cyndi');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Nelson', '451 Collie Street', '0542324194', 'joaquimn@invisioncom.il', 'retired', 100000490, 'Joaquim');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Holden', '6 Hohenfels Street', '0534872879', 'grace.holden@mavericktechnologies.com', 'retired', 100000491, 'Grace');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Shelton', '91 Cross Road', '0588332037', 'mingna@jsa.uk', 'in process', 100000492, 'Ming-Na');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Kramer', '15 Payne Ave', '0582802187', 'a.kramer@csi.ca', 'active', 100000493, 'Ani');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Mars', '41 Ferry Street', '0537565113', 'e.mars@nobrainerblindscom.com', 'active', 100000494, 'Ernest');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Hagar', '3 Torn Street', '0588022513', 'tamala.hagar@eastmankodak.de', 'retired', 100000495, 'Tamala');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Alston', '46 Lunch Street', '0539462494', 'ralston@deutschetelekom.com', 'retired', 100000496, 'Rich');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Duschel', '33 Gary Road', '0588217666', 'g.duschel@microsoft.au', 'retired', 100000497, 'Gavin');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Unger', '34 Stevenson Street', '0514992243', 'samuel.unger@scjohnson.ch', 'retired', 100000498, 'Samuel');
insert into VOLUNTEERS (last_name, address, phone_number, email, status, volunteer_id, first_name)
values ('Colon', '75 Patrick Street', '0543991726', 'alana.colon@vitacostcom.de', 'active', 100000499, 'Alana');
commit;
prompt 500 records loaded
prompt Loading ROOLES...
insert into ROOLES (role_id, role_name, deescription, required_training, max_volunteers, volunteer_id)
values (1, 'doc', 'voluptatibus asperiores non cillum cum. ', 0, 7, 100000314);
insert into ROOLES (role_id, role_name, deescription, required_training, max_volunteers, volunteer_id)
values (2, 'phone', 'quis id ex reprehenderit ut. ', 9, 5, 100000174);
insert into ROOLES (role_id, role_name, deescription, required_training, max_volunteers, volunteer_id)
values (3, 'phone', 'nam. ', 4, 2, 100000017);
insert into ROOLES (role_id, role_name, deescription, required_training, max_volunteers, volunteer_id)
values (4, 'reportwrite', 'molestiae ullamco mollitia. ', 9, 2, 100000037);
insert into ROOLES (role_id, role_name, deescription, required_training, max_volunteers, volunteer_id)
values (6, 'sherut', 'quibusdam dolorum et id dolor.  mollitia quod et. ', 6, 1, 100000028);
insert into ROOLES (role_id, role_name, deescription, required_training, max_volunteers, volunteer_id)
values (8, 'sherut', 'irure enim voluptates aut. ', 5, 6, 100000322);
commit;
prompt 6 records loaded
prompt Loading SHIFTS...
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1111, to_date('06-07-2018', 'dd-mm-yyyy'), '15:51', '2:42', 'Research Triangle', 'WendySchiavelli', 1292);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1112, to_date('05-05-2018', 'dd-mm-yyyy'), '8:36', '9:28', 'Oxon', 'AlecMakowicz', 1211);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1113, to_date('26-07-2006', 'dd-mm-yyyy'), '1:27', '20:53', 'Kuraby', 'DavyLeary', 1241);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1114, to_date('24-05-2002', 'dd-mm-yyyy'), '5:48', '5:30', 'Duisburg', 'RickieNavarro', 1179);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1115, to_date('22-09-2006', 'dd-mm-yyyy'), '20:55', '9:2', 'Palo Alto', 'TaylorVan Helden', 1173);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1116, to_date('25-05-2005', 'dd-mm-yyyy'), '0:22', '9:6', 'Haverhill', 'StewartCockburn', 1290);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1117, to_date('05-03-2012', 'dd-mm-yyyy'), '13:49', '20:39', 'Shelton', 'SpikeGertner', 1148);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1118, to_date('29-10-2020', 'dd-mm-yyyy'), '18:37', '13:19', 'Salvador', 'JulioAli', 1178);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1119, to_date('05-06-2016', 'dd-mm-yyyy'), '5:35', '3:58', 'Pirapora bom Jesus', 'MariaGooding', 1249);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1120, to_date('27-11-2022', 'dd-mm-yyyy'), '10:10', '20:25', 'Market Harborough', 'CaseyHedaya', 1152);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1121, to_date('02-12-2016', 'dd-mm-yyyy'), '18:46', '14:40', 'Hunt Valley', 'BrendanYulin', 1151);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1122, to_date('26-02-2023', 'dd-mm-yyyy'), '11:44', '10:51', 'Bethesda', 'HarryVan Damme', 1215);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1123, to_date('06-03-2022', 'dd-mm-yyyy'), '8:58', '4:56', 'Golden', 'AaronHarrelson', 1207);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1124, to_date('22-10-2011', 'dd-mm-yyyy'), '23:33', '19:39', 'Soroe', 'PhoebeFarrell', 1307);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1125, to_date('29-09-2003', 'dd-mm-yyyy'), '4:22', '7:25', 'Lake Forest', 'HarrisIdle', 1120);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1126, to_date('16-11-2023', 'dd-mm-yyyy'), '8:13', '22:40', 'Carson City', 'ChaleeMcClinton', 1132);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1127, to_date('12-05-2014', 'dd-mm-yyyy'), '3:57', '5:22', 'Glendale', 'GeneColin Young', 1294);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1128, to_date('13-05-2017', 'dd-mm-yyyy'), '16:29', '12:51', 'Utrecht', 'MorganGambon', 1210);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1129, to_date('03-12-2015', 'dd-mm-yyyy'), '17:4', '13:44', 'Enfield', 'HiltonWills', 1120);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1130, to_date('11-01-2012', 'dd-mm-yyyy'), '5:47', '8:26', 'Oulu', 'BalthazarMcCready', 1184);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1131, to_date('12-04-2008', 'dd-mm-yyyy'), '16:29', '0:36', 'Courbevoie', 'DebbyHarmon', 1192);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1132, to_date('26-06-2007', 'dd-mm-yyyy'), '11:21', '9:58', 'Richmond', 'RhysJohansson', 1177);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1133, to_date('02-06-2005', 'dd-mm-yyyy'), '15:37', '22:25', 'Shreveport', 'RobinShelton', 1138);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1134, to_date('20-06-2021', 'dd-mm-yyyy'), '6:52', '6:34', 'Santa rita sapucaí', 'QueenBright', 1251);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1135, to_date('23-05-2014', 'dd-mm-yyyy'), '0:40', '20:27', 'King of Prussia', 'OmarDillon', 1137);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1136, to_date('26-04-2019', 'dd-mm-yyyy'), '12:1', '22:47', 'Hohenfels', 'TramaineCarmen', 1238);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1137, to_date('04-03-2022', 'dd-mm-yyyy'), '9:16', '21:13', 'Freiburg', 'AndrewRhymes', 1171);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1138, to_date('16-05-2007', 'dd-mm-yyyy'), '7:22', '8:38', 'Roanoke', 'AlecRossellini', 1191);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1139, to_date('01-06-2012', 'dd-mm-yyyy'), '16:8', '10:23', 'Torino', 'RobbyWhitley', 1158);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1140, to_date('28-08-2002', 'dd-mm-yyyy'), '13:42', '4:22', 'Douala', 'HumbertoGoodall', 1195);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1141, to_date('10-04-2019', 'dd-mm-yyyy'), '17:59', '10:11', 'Salem', 'LievStuart', 1244);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1142, to_date('24-06-2020', 'dd-mm-yyyy'), '6:39', '0:43', 'Takapuna', 'GilFranklin', 1217);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1143, to_date('20-10-2004', 'dd-mm-yyyy'), '4:13', '5:55', 'Jakarta', 'LivPressly', 1122);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1144, to_date('28-02-2017', 'dd-mm-yyyy'), '16:0', '19:26', 'Snoqualmie', 'DianeRaybon', 1237);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1145, to_date('15-01-2014', 'dd-mm-yyyy'), '14:17', '5:8', 'Rtp', 'AvengedWeiland', 1159);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1146, to_date('22-08-2008', 'dd-mm-yyyy'), '5:58', '23:21', 'Westfield', 'NeveEngland', 1134);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1147, to_date('12-02-2006', 'dd-mm-yyyy'), '20:29', '15:20', 'Petach-Tikva', 'StephenBelushi', 1263);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1148, to_date('12-08-2001', 'dd-mm-yyyy'), '6:28', '1:11', 'Hiroshima', 'RowanFiennes', 1180);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1149, to_date('07-07-2013', 'dd-mm-yyyy'), '5:23', '17:50', 'New hartford', 'DarrenHagerty', 1120);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1150, to_date('17-08-2010', 'dd-mm-yyyy'), '7:49', '8:17', 'Hochwald', 'RichardParker', 1163);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1151, to_date('09-03-2001', 'dd-mm-yyyy'), '17:39', '9:11', 'London', 'JarvisConnick', 1122);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1152, to_date('22-07-2011', 'dd-mm-yyyy'), '6:23', '16:33', 'Ismaning', 'CateWoodard', 1239);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1153, to_date('25-10-2007', 'dd-mm-yyyy'), '8:39', '6:26', 'Paço de Arcos', 'ViennaColman', 1224);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1154, to_date('16-12-2018', 'dd-mm-yyyy'), '10:54', '19:23', 'Burlington', 'AndreShandling', 1260);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1155, to_date('25-01-2009', 'dd-mm-yyyy'), '23:41', '15:8', 'Alessandria', 'LarenzBush', 1264);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1156, to_date('30-08-2018', 'dd-mm-yyyy'), '20:5', '6:5', 'Louisville', 'RickieNolte', 1306);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1157, to_date('24-02-2003', 'dd-mm-yyyy'), '3:50', '15:36', 'Oberwangen', 'JoeyCleese', 1263);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1158, to_date('21-01-2007', 'dd-mm-yyyy'), '19:57', '5:57', 'Duisburg', 'BrendanOsment', 1144);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1159, to_date('28-07-2010', 'dd-mm-yyyy'), '16:17', '12:27', 'Caracas', 'ViennaDiaz', 1169);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1160, to_date('02-11-2014', 'dd-mm-yyyy'), '4:6', '9:7', 'Doncaster', 'TiaBaldwin', 1136);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1161, to_date('08-06-2023', 'dd-mm-yyyy'), '22:18', '16:36', 'Malmö', 'CeliaDunst', 1138);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1162, to_date('02-07-2004', 'dd-mm-yyyy'), '21:59', '11:51', 'Miyazaki', 'SuzanneBerry', 1268);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1163, to_date('06-08-2011', 'dd-mm-yyyy'), '19:23', '23:26', 'Copenhagen', 'Jonny LeeDrive', 1150);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1164, to_date('14-07-2010', 'dd-mm-yyyy'), '2:0', '20:15', 'Geneva', 'TimRodriguez', 1186);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1165, to_date('25-03-2020', 'dd-mm-yyyy'), '4:5', '11:33', 'Silverdale', 'Ming-NaWoodard', 1241);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1166, to_date('10-02-2018', 'dd-mm-yyyy'), '17:37', '20:27', 'Williamstown', 'LorenPaltrow', 1218);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1167, to_date('15-01-2012', 'dd-mm-yyyy'), '5:5', '5:52', 'Crete', 'EmmylouPage', 1224);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1168, to_date('31-03-2008', 'dd-mm-yyyy'), '13:31', '17:13', 'King of Prussia', 'HectorLiotta', 1174);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1169, to_date('15-07-2023', 'dd-mm-yyyy'), '17:21', '19:29', 'Spring City', 'SheenaDeschanel', 1298);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1170, to_date('05-01-2013', 'dd-mm-yyyy'), '21:37', '5:35', 'Leipzig', 'UmaDickinson', 1124);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1171, to_date('03-01-2012', 'dd-mm-yyyy'), '3:15', '6:56', 'Park Ridge', 'RosiePaul', 1308);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1172, to_date('10-05-2011', 'dd-mm-yyyy'), '23:47', '15:28', 'Cambridge', 'TildaHoward', 1213);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1173, to_date('02-08-2007', 'dd-mm-yyyy'), '1:54', '22:49', 'Rome', 'JaredHarris', 1215);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1174, to_date('11-03-2011', 'dd-mm-yyyy'), '17:37', '12:17', 'Burr Ridge', 'VerticalElwes', 1174);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1175, to_date('08-06-2014', 'dd-mm-yyyy'), '0:36', '4:25', 'Woking', 'JulioReinhold', 1206);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1176, to_date('29-11-2008', 'dd-mm-yyyy'), '2:52', '4:28', 'Ottawa', 'ArmandHewett', 1139);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1177, to_date('28-02-2005', 'dd-mm-yyyy'), '3:4', '10:55', 'Doncaster', 'DwightHarris', 1219);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1178, to_date('27-12-2014', 'dd-mm-yyyy'), '8:20', '3:4', 'Oklahoma city', 'ReneDooley', 1205);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1179, to_date('25-11-2010', 'dd-mm-yyyy'), '22:57', '22:49', 'Albuquerque', 'HopeOjeda', 1241);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1180, to_date('26-10-2003', 'dd-mm-yyyy'), '18:45', '2:50', 'Elkins Park', 'LukeLaurie', 1192);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1181, to_date('18-11-2020', 'dd-mm-yyyy'), '17:47', '10:2', 'Cypress', 'EmersonPhillippe', 1166);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1182, to_date('11-05-2004', 'dd-mm-yyyy'), '16:5', '8:54', 'Dallas', 'MirandaMcIntyre', 1166);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1183, to_date('25-05-2010', 'dd-mm-yyyy'), '0:56', '2:9', 'Hässleholm', 'RaulCarradine', 1162);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1184, to_date('07-06-2001', 'dd-mm-yyyy'), '13:27', '20:14', 'Warrington', 'KennethHarary', 1231);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1185, to_date('15-08-2004', 'dd-mm-yyyy'), '9:39', '14:15', 'Horsham', 'HughMcGill', 1182);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1186, to_date('23-08-2003', 'dd-mm-yyyy'), '0:7', '1:34', 'Appenzell', 'ChetGertner', 1190);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1187, to_date('23-11-2018', 'dd-mm-yyyy'), '4:22', '11:28', 'Salem', 'EmilyGere', 1165);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1188, to_date('02-01-2003', 'dd-mm-yyyy'), '8:40', '14:3', 'San Francisco', 'DougBrolin', 1208);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1189, to_date('02-01-2012', 'dd-mm-yyyy'), '23:26', '13:3', 'Brampton', 'KrisChan', 1280);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1190, to_date('01-04-2003', 'dd-mm-yyyy'), '18:7', '9:18', 'Manchester', 'AnnTennison', 1291);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1191, to_date('23-10-2009', 'dd-mm-yyyy'), '18:2', '2:38', 'Caguas', 'DavySoda', 1124);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1192, to_date('18-02-2021', 'dd-mm-yyyy'), '9:32', '1:37', 'Middletown', 'NaomiDaniels', 1132);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1193, to_date('07-03-2022', 'dd-mm-yyyy'), '18:56', '14:59', 'Oslo', 'JohnnyIdle', 1176);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1194, to_date('11-11-2002', 'dd-mm-yyyy'), '7:54', '19:19', 'Knoxville', 'CaroleWinwood', 1274);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1195, to_date('17-04-2014', 'dd-mm-yyyy'), '16:2', '22:13', 'Leeds', 'HeatherUtada', 1262);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1196, to_date('08-11-2017', 'dd-mm-yyyy'), '17:5', '2:47', 'Budapest', 'MaceoCusack', 1214);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1197, to_date('06-09-2018', 'dd-mm-yyyy'), '19:25', '12:8', 'Amsterdam', 'PeaboKudrow', 1280);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1198, to_date('12-08-2019', 'dd-mm-yyyy'), '18:50', '1:17', 'Monmouth', 'AlanaAykroyd', 1187);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1199, to_date('05-12-2008', 'dd-mm-yyyy'), '14:31', '2:58', 'Coquitlam', 'RonCostner', 1144);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1200, to_date('12-01-2017', 'dd-mm-yyyy'), '5:23', '16:52', 'Mechanicsburg', 'JackieMcElhone', 1183);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1201, to_date('21-01-2012', 'dd-mm-yyyy'), '21:29', '11:56', 'Ismaning', 'PhilipColin Young', 1234);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1202, to_date('04-03-2019', 'dd-mm-yyyy'), '7:39', '18:56', 'Wetzlar', 'TaylorLonsdale', 1162);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1203, to_date('03-06-2018', 'dd-mm-yyyy'), '14:46', '15:54', 'Winterthur', 'NicoleCraven', 1284);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1204, to_date('15-10-2020', 'dd-mm-yyyy'), '22:48', '19:5', 'Oxford', 'AlecSingh', 1260);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1205, to_date('01-05-2008', 'dd-mm-yyyy'), '8:33', '17:20', 'Vista', 'GabriellePlimpton', 1189);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1206, to_date('17-12-2003', 'dd-mm-yyyy'), '16:37', '9:51', 'League city', 'EdwardStevens', 1147);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1207, to_date('07-05-2001', 'dd-mm-yyyy'), '3:24', '20:35', 'Horsham', 'BetteClooney', 1196);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1208, to_date('31-01-2016', 'dd-mm-yyyy'), '6:8', '1:2', 'Salem', 'MaggieConroy', 1263);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1209, to_date('27-12-2016', 'dd-mm-yyyy'), '13:28', '12:0', 'Cedar Rapids', 'LloydLi', 1300);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1210, to_date('19-11-2006', 'dd-mm-yyyy'), '22:2', '15:41', 'Debary', 'TalHackman', 1310);
commit;
prompt 100 records committed...
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1211, to_date('14-09-2013', 'dd-mm-yyyy'), '7:18', '19:25', 'Mito', 'JoseHopper', 1227);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1212, to_date('28-09-2022', 'dd-mm-yyyy'), '14:31', '13:3', 'Bern', 'JeffGarfunkel', 1183);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1213, to_date('22-01-2002', 'dd-mm-yyyy'), '5:37', '23:20', 'Gennevilliers', 'RupertBlackwell', 1287);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1214, to_date('17-05-2006', 'dd-mm-yyyy'), '15:48', '18:40', 'Bkk', 'FisherReeve', 1112);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1215, to_date('25-11-2014', 'dd-mm-yyyy'), '6:26', '11:57', 'Laurel', 'PattiMcLachlan', 1258);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1216, to_date('30-06-2015', 'dd-mm-yyyy'), '2:58', '20:38', 'Almaty', 'WaymanBranagh', 1291);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1217, to_date('16-01-2010', 'dd-mm-yyyy'), '11:29', '21:26', 'North Sydney', 'LeoTambor', 1227);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1218, to_date('22-07-2002', 'dd-mm-yyyy'), '8:58', '18:0', 'Toronto', 'MarlonCleary', 1199);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1219, to_date('27-12-2005', 'dd-mm-yyyy'), '15:44', '6:6', 'Adamstown', 'IvanKline', 1295);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1220, to_date('29-07-2010', 'dd-mm-yyyy'), '3:45', '6:6', 'Maryville', 'KevnVincent', 1238);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1221, to_date('29-03-2019', 'dd-mm-yyyy'), '2:23', '16:6', 'Murray', 'ArturoSoda', 1211);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1222, to_date('06-07-2005', 'dd-mm-yyyy'), '4:8', '0:30', 'Cambridge', 'ChrisAdler', 1175);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1223, to_date('09-05-2001', 'dd-mm-yyyy'), '13:55', '16:15', 'Palma de Mallorca', 'AidanPierce', 1303);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1224, to_date('01-04-2022', 'dd-mm-yyyy'), '14:4', '10:44', 'Altstätten', 'VendettaRuiz', 1188);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1225, to_date('10-08-2010', 'dd-mm-yyyy'), '2:33', '15:39', 'Pirapora bom Jesus', 'BridgetHoleman', 1200);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1226, to_date('10-08-2015', 'dd-mm-yyyy'), '20:52', '11:24', 'Bloemfontein', 'LorenChandler', 1169);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1227, to_date('18-09-2011', 'dd-mm-yyyy'), '7:21', '13:3', 'Chapeco', 'LizzyKirshner', 1300);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1228, to_date('02-08-2015', 'dd-mm-yyyy'), '2:22', '13:36', 'Middletown', 'TimothyShaye', 1174);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1229, to_date('09-09-2015', 'dd-mm-yyyy'), '3:18', '0:56', 'Slough', 'CeiliHauser', 1258);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1230, to_date('22-11-2022', 'dd-mm-yyyy'), '3:53', '9:10', 'Carlingford', 'DanielUnion', 1278);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1231, to_date('21-11-2005', 'dd-mm-yyyy'), '9:25', '4:22', 'Maceio', 'BetteWincott', 1204);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1232, to_date('29-03-2012', 'dd-mm-yyyy'), '5:48', '20:5', 'Winnipeg', 'MerrillGandolfini', 1283);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1233, to_date('29-11-2001', 'dd-mm-yyyy'), '22:27', '21:42', 'Milan', 'LynetteRain', 1232);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1234, to_date('02-06-2001', 'dd-mm-yyyy'), '4:20', '16:57', 'Bergen', 'JoeMacDonald', 1131);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1235, to_date('01-06-2015', 'dd-mm-yyyy'), '19:10', '21:56', 'Lisbon', 'EliasGriffiths', 1266);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1236, to_date('03-02-2016', 'dd-mm-yyyy'), '13:15', '16:20', 'Kerava', 'MegBaker', 1267);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1237, to_date('05-03-2011', 'dd-mm-yyyy'), '8:0', '15:9', 'Waldorf', 'DickDonelly', 1228);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1238, to_date('26-04-2004', 'dd-mm-yyyy'), '20:28', '18:33', 'Sugar Land', 'MelanieBaldwin', 1141);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1239, to_date('04-06-2022', 'dd-mm-yyyy'), '21:32', '4:56', 'Atlanta', 'RachidHurley', 1307);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1240, to_date('26-03-2013', 'dd-mm-yyyy'), '13:44', '12:34', 'Saudarkrokur', 'HowieSarsgaard', 1294);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1241, to_date('04-06-2009', 'dd-mm-yyyy'), '12:45', '10:42', 'Dresden', 'AlanReeves', 1185);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1242, to_date('07-10-2009', 'dd-mm-yyyy'), '12:32', '18:22', 'Tours', 'PattyStiers', 1198);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1243, to_date('20-06-2003', 'dd-mm-yyyy'), '9:35', '1:37', 'Lyngby', 'GeneMcKellen', 1121);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1244, to_date('27-04-2001', 'dd-mm-yyyy'), '7:14', '23:55', 'Ulsteinvik', 'ShannonGugino', 1239);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1245, to_date('09-10-2022', 'dd-mm-yyyy'), '7:56', '2:58', 'Lisbon', 'BonnieKapanka', 1158);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1246, to_date('09-06-2010', 'dd-mm-yyyy'), '3:58', '11:28', 'Sao paulo', 'DelbertJovovich', 1242);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1247, to_date('23-04-2016', 'dd-mm-yyyy'), '0:30', '3:35', 'Southampton', 'HarveyFarrow', 1153);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1248, to_date('29-08-2018', 'dd-mm-yyyy'), '0:26', '11:31', 'Köln', 'BurtonRhys-Davies', 1192);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1249, to_date('16-08-2010', 'dd-mm-yyyy'), '15:42', '15:12', 'Marietta', 'CaroleNorton', 1193);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1250, to_date('10-03-2022', 'dd-mm-yyyy'), '16:51', '15:55', 'Lecanto', 'DougBright', 1296);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1251, to_date('06-04-2006', 'dd-mm-yyyy'), '19:23', '0:47', 'Pandrup', 'MiraGriggs', 1241);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1252, to_date('06-11-2005', 'dd-mm-yyyy'), '13:1', '9:54', 'Koeln', 'GloriaTaha', 1112);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1253, to_date('25-06-2019', 'dd-mm-yyyy'), '5:22', '7:55', 'Kloten', 'LauraSteenburgen', 1126);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1254, to_date('03-09-2006', 'dd-mm-yyyy'), '10:32', '4:30', 'Leverkusen', 'NicoleKhan', 1259);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1255, to_date('14-01-2004', 'dd-mm-yyyy'), '14:4', '22:31', 'Fuchstal-asch', 'DorryRhames', 1236);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1256, to_date('10-07-2009', 'dd-mm-yyyy'), '11:32', '3:44', 'Kagoshima', 'JackWhitman', 1256);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1257, to_date('27-07-2023', 'dd-mm-yyyy'), '22:38', '9:5', 'Cobham', 'JosephShandling', 1206);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1258, to_date('20-01-2022', 'dd-mm-yyyy'), '16:6', '10:16', 'Espoo', 'GrahamFerrer', 1257);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1259, to_date('03-12-2023', 'dd-mm-yyyy'), '20:55', '10:17', 'Bristol', 'MaxRonstadt', 1227);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1260, to_date('01-06-2020', 'dd-mm-yyyy'), '0:5', '22:42', 'Barueri', 'VondaDreyfuss', 1270);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1261, to_date('23-04-2009', 'dd-mm-yyyy'), '19:9', '13:21', 'Perth', 'RonnieCamp', 1220);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1262, to_date('25-12-2000', 'dd-mm-yyyy'), '8:45', '13:39', 'Edwardstown', 'StevieShaye', 1236);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1263, to_date('29-01-2017', 'dd-mm-yyyy'), '4:4', '8:26', 'Oslo', 'HollandGiannini', 1275);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1264, to_date('01-01-2016', 'dd-mm-yyyy'), '1:26', '8:23', 'Lathrop', 'JodyFiennes', 1212);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1265, to_date('25-12-2010', 'dd-mm-yyyy'), '11:54', '6:25', 'Zaandam', 'Mary BethBush', 1233);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1266, to_date('12-05-2014', 'dd-mm-yyyy'), '4:19', '9:3', 'Malmö', 'DomSlater', 1292);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1267, to_date('14-04-2017', 'dd-mm-yyyy'), '20:1', '10:2', 'Waldbronn', 'JeanCoburn', 1310);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1268, to_date('31-12-2006', 'dd-mm-yyyy'), '20:12', '20:7', 'Alessandria', 'RoseCandy', 1164);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1269, to_date('25-12-2007', 'dd-mm-yyyy'), '15:13', '1:31', 'Glasgow', 'LoreenaGallant', 1166);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1270, to_date('26-01-2009', 'dd-mm-yyyy'), '12:40', '9:37', 'Saint-vincent-de-dur', 'MarieBeckinsale', 1126);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1271, to_date('10-06-2000', 'dd-mm-yyyy'), '8:22', '12:41', 'Aberdeen', 'WayneChung', 1207);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1272, to_date('21-12-2023', 'dd-mm-yyyy'), '6:51', '2:3', 'Soroe', 'DiamondSylvian', 1261);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1273, to_date('01-05-2011', 'dd-mm-yyyy'), '21:42', '19:8', 'Rochester', 'AlannahByrne', 1282);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1274, to_date('29-10-2016', 'dd-mm-yyyy'), '5:59', '17:23', 'Lima', 'TrickGayle', 1204);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1275, to_date('22-09-2015', 'dd-mm-yyyy'), '17:14', '10:36', 'Dietikon', 'RoryTorn', 1184);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1276, to_date('17-09-2012', 'dd-mm-yyyy'), '8:0', '23:38', 'Eisenhüttenstadt', 'ColleenKurtz', 1186);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1277, to_date('19-09-2009', 'dd-mm-yyyy'), '9:55', '18:21', 'Englewood Cliffs', 'ChristianLerner', 1257);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1278, to_date('04-09-2005', 'dd-mm-yyyy'), '18:54', '1:8', 'Rio de janeiro', 'RodGosdin', 1134);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1279, to_date('19-03-2004', 'dd-mm-yyyy'), '23:49', '18:28', 'Abbotsford', 'DeanBentley', 1254);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1280, to_date('04-07-2015', 'dd-mm-yyyy'), '14:54', '5:32', 'St Jean de Soudain', 'RickyWilliamson', 1262);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1281, to_date('17-11-2009', 'dd-mm-yyyy'), '5:45', '8:47', 'Tustin', 'NeilClooney', 1204);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1282, to_date('31-07-2014', 'dd-mm-yyyy'), '20:40', '17:11', 'Nara', 'KurtwoodRenfro', 1245);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1283, to_date('15-01-2004', 'dd-mm-yyyy'), '10:21', '9:43', 'Sulzbach', 'ElisabethHeslov', 1111);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1284, to_date('08-01-2021', 'dd-mm-yyyy'), '0:38', '0:28', 'Fairview Heights', 'MerrillWalsh', 1219);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1285, to_date('09-01-2004', 'dd-mm-yyyy'), '4:54', '9:36', 'South Jordan', 'RandyCantrell', 1187);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1286, to_date('12-11-2000', 'dd-mm-yyyy'), '8:55', '18:18', 'Sale', 'LarryWalsh', 1232);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1287, to_date('03-05-2021', 'dd-mm-yyyy'), '8:45', '20:0', 'Darmstadt', 'LindseyBenson', 1116);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1288, to_date('22-02-2020', 'dd-mm-yyyy'), '9:20', '2:49', 'Yamaguchi', 'ViggoHubbard', 1288);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1289, to_date('09-12-2007', 'dd-mm-yyyy'), '19:37', '11:13', 'Ponta grossa', 'LiamEder', 1200);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1290, to_date('20-04-2015', 'dd-mm-yyyy'), '9:2', '12:2', 'Shawnee', 'HaroldChristie', 1228);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1291, to_date('25-05-2002', 'dd-mm-yyyy'), '2:13', '11:10', 'Fairfax', 'ReginaSinatra', 1260);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1292, to_date('21-04-2016', 'dd-mm-yyyy'), '18:3', '8:28', 'Zurich', 'CarleneBonham', 1183);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1293, to_date('07-12-2001', 'dd-mm-yyyy'), '19:30', '11:17', 'Issaquah', 'HerbieRamis', 1153);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1294, to_date('11-02-2014', 'dd-mm-yyyy'), '3:40', '20:2', 'Fair Lawn', 'JavonJovovich', 1219);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1295, to_date('04-12-2015', 'dd-mm-yyyy'), '10:13', '14:48', 'Oberwangen', 'BretMcPherson', 1286);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1296, to_date('05-10-2018', 'dd-mm-yyyy'), '10:0', '3:56', 'Kaohsiung', 'TerryPepper', 1225);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1297, to_date('05-08-2017', 'dd-mm-yyyy'), '1:38', '18:1', 'Bellerose', 'BradDe Niro', 1303);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1298, to_date('24-01-2011', 'dd-mm-yyyy'), '18:4', '4:11', 'Gersthofen', 'GeoffreyGarber', 1289);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1299, to_date('20-04-2013', 'dd-mm-yyyy'), '2:39', '12:59', 'Dublin', 'CathyKhan', 1266);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1300, to_date('29-04-2015', 'dd-mm-yyyy'), '3:16', '19:41', 'Oberwangen', 'DianeHayek', 1152);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1301, to_date('09-07-2018', 'dd-mm-yyyy'), '15:1', '7:56', 'St Leonards', 'KennyGalecki', 1222);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1302, to_date('22-12-2023', 'dd-mm-yyyy'), '2:6', '22:37', 'Hunt Valley', 'CarlosWilliamson', 1122);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1303, to_date('21-01-2016', 'dd-mm-yyyy'), '0:26', '3:59', 'Sihung-si', 'BrendanRobbins', 1292);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1304, to_date('27-01-2019', 'dd-mm-yyyy'), '6:24', '23:58', 'Reston', 'FranceKoyana', 1130);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1305, to_date('12-07-2013', 'dd-mm-yyyy'), '23:22', '22:50', 'Budapest', 'GaryCross', 1144);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1306, to_date('12-08-2008', 'dd-mm-yyyy'), '22:22', '17:22', 'Ferraz  vasconcelos', 'NastassjaStreet', 1129);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1307, to_date('09-09-2013', 'dd-mm-yyyy'), '8:35', '8:58', 'Chaam', 'AshtonWomack', 1214);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1308, to_date('19-08-2003', 'dd-mm-yyyy'), '19:8', '23:27', 'Mobile', 'CaryNoseworthy', 1198);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1309, to_date('28-08-2003', 'dd-mm-yyyy'), '22:30', '3:59', 'Salisbury', 'BillyMacLachlan', 1151);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1310, to_date('13-05-2023', 'dd-mm-yyyy'), '11:56', '10:54', 'Southampton', 'LukeMazzello', 1112);
commit;
prompt 200 records committed...
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1311, to_date('19-01-2012', 'dd-mm-yyyy'), '23:34', '20:11', 'St Jean de Soudain', 'RikMacht', 1121);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1312, to_date('31-05-2014', 'dd-mm-yyyy'), '13:52', '4:15', 'Jerusalem', 'SammyStigers', 1176);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1313, to_date('03-02-2005', 'dd-mm-yyyy'), '0:9', '10:20', 'Adamstown', 'UdoAlda', 1215);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1314, to_date('12-11-2007', 'dd-mm-yyyy'), '19:9', '13:4', 'New Haven', 'VondaEsposito', 1265);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1315, to_date('06-10-2021', 'dd-mm-yyyy'), '20:35', '6:9', 'Frankfurt am Main', 'ChrisLlewelyn', 1148);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1316, to_date('06-07-2020', 'dd-mm-yyyy'), '21:1', '23:58', 'Bruneck', 'CherryShocked', 1126);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1317, to_date('13-12-2003', 'dd-mm-yyyy'), '9:18', '7:28', 'Lathrop', 'OwenRea', 1138);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1318, to_date('22-04-2018', 'dd-mm-yyyy'), '3:26', '3:7', 'Laurel', 'KrisMakeba', 1157);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1319, to_date('15-06-2019', 'dd-mm-yyyy'), '18:5', '15:59', 'Cleveland', 'MerilleeOrton', 1285);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1320, to_date('05-10-2016', 'dd-mm-yyyy'), '11:45', '3:27', 'Glenshaw', 'JonathanHaslam', 1183);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1321, to_date('12-11-2006', 'dd-mm-yyyy'), '10:53', '21:17', 'Winnipeg', 'PelvicConnery', 1192);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1322, to_date('07-06-2016', 'dd-mm-yyyy'), '10:58', '9:22', 'Irvine', 'MarieCooper', 1128);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1323, to_date('04-11-2011', 'dd-mm-yyyy'), '13:3', '12:10', 'Pusan', 'CaseyCozier', 1283);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1324, to_date('01-07-2004', 'dd-mm-yyyy'), '22:48', '17:28', 'High Wycombe', 'AlLeary', 1119);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1325, to_date('17-08-2009', 'dd-mm-yyyy'), '0:19', '0:44', 'Nizhnevartovsk', 'ChelySatriani', 1151);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1326, to_date('03-02-2006', 'dd-mm-yyyy'), '8:1', '12:38', 'Burlington', 'DianneKeith', 1307);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1327, to_date('18-10-2012', 'dd-mm-yyyy'), '11:4', '6:21', 'Yavne', 'IsaacMarie', 1233);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1328, to_date('16-03-2019', 'dd-mm-yyyy'), '18:39', '23:20', 'Saga', 'ErnestEvett', 1181);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1329, to_date('15-10-2004', 'dd-mm-yyyy'), '4:39', '15:14', 'Guelph', 'AlanaEaston', 1135);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1330, to_date('12-11-2023', 'dd-mm-yyyy'), '3:24', '1:57', 'Sorocaba', 'LennieBalaban', 1276);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1331, to_date('10-06-2003', 'dd-mm-yyyy'), '16:16', '21:15', 'Terrasa', 'LiamAtlas', 1259);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1332, to_date('27-05-2021', 'dd-mm-yyyy'), '8:24', '1:21', 'Geneva', 'PetulaStatham', 1121);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1333, to_date('13-01-2021', 'dd-mm-yyyy'), '11:28', '22:35', 'Brisbane', 'EwanDevine', 1266);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1334, to_date('26-10-2000', 'dd-mm-yyyy'), '22:9', '18:31', 'Richmond', 'BretVenora', 1163);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1335, to_date('13-09-2021', 'dd-mm-yyyy'), '14:23', '15:17', 'Kloten', 'JuanSinise', 1304);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1336, to_date('08-04-2017', 'dd-mm-yyyy'), '6:5', '0:47', 'Grand-mere', 'CameronHedaya', 1169);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1337, to_date('04-11-2006', 'dd-mm-yyyy'), '23:32', '11:35', 'Buffalo Grove', 'QuentinNuman', 1267);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1338, to_date('02-12-2000', 'dd-mm-yyyy'), '21:26', '14:5', 'Lakewood', 'YolandaMcBride', 1297);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1339, to_date('22-09-2003', 'dd-mm-yyyy'), '7:27', '20:7', 'Hilton', 'DariusGold', 1233);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1340, to_date('20-10-2012', 'dd-mm-yyyy'), '5:28', '1:12', 'Karlstad', 'AngelaBeck', 1298);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1341, to_date('09-09-2002', 'dd-mm-yyyy'), '22:28', '14:57', 'Loveland', 'KellyLynch', 1187);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1342, to_date('27-04-2021', 'dd-mm-yyyy'), '8:9', '11:45', 'Warren', 'DionneGilley', 1297);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1343, to_date('26-09-2015', 'dd-mm-yyyy'), '11:0', '9:56', 'Taipei', 'RipRains', 1304);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1344, to_date('23-05-2016', 'dd-mm-yyyy'), '0:22', '9:42', 'Stuttgart', 'GrantReubens', 1169);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1345, to_date('02-03-2002', 'dd-mm-yyyy'), '20:58', '6:31', 'Cuenca', 'TreatParsons', 1147);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1346, to_date('18-09-2011', 'dd-mm-yyyy'), '14:46', '22:36', 'Bradenton', 'PatBentley', 1161);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1347, to_date('21-02-2012', 'dd-mm-yyyy'), '2:56', '6:5', 'Friedrichshafe', 'JulieGoodall', 1270);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1348, to_date('13-11-2015', 'dd-mm-yyyy'), '22:48', '18:19', 'Niigata', 'CornellTomlin', 1178);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1349, to_date('18-08-2001', 'dd-mm-yyyy'), '14:13', '12:55', 'Kyoto', 'NicoleThurman', 1169);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1350, to_date('09-10-2014', 'dd-mm-yyyy'), '1:16', '6:17', 'Warren', 'AnitaJones', 1177);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1351, to_date('05-02-2001', 'dd-mm-yyyy'), '2:30', '22:2', 'Koblenz', 'OmarSuvari', 1290);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1352, to_date('17-12-2004', 'dd-mm-yyyy'), '4:11', '6:53', 'Louisville', 'NoahHanley', 1267);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1353, to_date('02-01-2023', 'dd-mm-yyyy'), '6:0', '22:46', 'Glenshaw', 'JamieSisto', 1174);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1354, to_date('11-03-2021', 'dd-mm-yyyy'), '2:38', '9:58', 'Algermissen', 'OlgaKrieger', 1291);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1355, to_date('24-12-2016', 'dd-mm-yyyy'), '3:47', '8:49', 'Ljubljana', 'ReeseHarrelson', 1283);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1356, to_date('20-12-2019', 'dd-mm-yyyy'), '4:40', '4:47', 'Somerset', 'SuziBlaine', 1143);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1357, to_date('03-03-2010', 'dd-mm-yyyy'), '14:19', '11:4', 'Virginia Beach', 'RonCoe', 1285);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1358, to_date('21-04-2007', 'dd-mm-yyyy'), '2:22', '17:5', 'Vilnius', 'EmmaGugino', 1241);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1359, to_date('22-01-2005', 'dd-mm-yyyy'), '15:39', '15:57', 'Santa Clarita', 'RascalSpader', 1282);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1360, to_date('10-10-2017', 'dd-mm-yyyy'), '9:13', '21:53', 'Saint Paul', 'PeaboSolido', 1161);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1361, to_date('24-04-2005', 'dd-mm-yyyy'), '3:38', '7:45', 'California', 'NikBacharach', 1277);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1362, to_date('04-11-2018', 'dd-mm-yyyy'), '12:36', '14:40', 'Fukuoka', 'AnnBean', 1232);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1363, to_date('02-09-2013', 'dd-mm-yyyy'), '13:52', '17:19', 'Yokohama', 'RodBroadbent', 1147);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1364, to_date('22-03-2000', 'dd-mm-yyyy'), '0:30', '12:45', 'Belmont', 'JodyHurley', 1244);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1365, to_date('06-05-2019', 'dd-mm-yyyy'), '1:32', '6:13', 'Rockford', 'ThoraBall', 1216);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1366, to_date('26-09-2013', 'dd-mm-yyyy'), '8:32', '9:11', 'Lake Bluff', 'CateBrosnan', 1136);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1367, to_date('23-07-2006', 'dd-mm-yyyy'), '7:52', '10:12', 'Goteborg', 'DougMcIntosh', 1233);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1368, to_date('12-09-2021', 'dd-mm-yyyy'), '0:54', '18:6', 'Fairfax', 'ChristmasAvalon', 1267);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1369, to_date('29-11-2020', 'dd-mm-yyyy'), '10:40', '17:0', 'Bellerose', 'LaurieMcFerrin', 1207);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1370, to_date('27-01-2016', 'dd-mm-yyyy'), '23:11', '10:18', 'Pusan', 'JayCassidy', 1251);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1371, to_date('15-06-2003', 'dd-mm-yyyy'), '6:29', '13:40', 'Philadelphia', 'AlNewman', 1182);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1372, to_date('21-01-2016', 'dd-mm-yyyy'), '19:44', '10:36', 'Oulu', 'KaronGracie', 1256);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1373, to_date('08-05-2012', 'dd-mm-yyyy'), '9:21', '23:51', 'Edmonton', 'LaurieLevin', 1182);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1374, to_date('15-06-2021', 'dd-mm-yyyy'), '3:51', '19:3', 'Altamonte Springs', 'WallyTwilley', 1137);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1375, to_date('09-08-2001', 'dd-mm-yyyy'), '22:31', '17:55', 'Lowell', 'WesCamp', 1237);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1376, to_date('07-01-2002', 'dd-mm-yyyy'), '19:31', '0:18', 'Phoenix', 'NancyCraig', 1223);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1377, to_date('01-06-2013', 'dd-mm-yyyy'), '6:21', '9:10', 'Sursee', 'CrystalWeaving', 1223);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1378, to_date('27-09-2019', 'dd-mm-yyyy'), '19:28', '6:22', 'Kloten', 'MoeWilson', 1199);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1379, to_date('11-09-2013', 'dd-mm-yyyy'), '9:1', '15:35', 'Holliston', 'RadneyCalle', 1192);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1380, to_date('28-05-2001', 'dd-mm-yyyy'), '7:44', '2:57', 'Leverkusen', 'RoscoKlein', 1153);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1381, to_date('09-05-2022', 'dd-mm-yyyy'), '3:57', '2:16', 'Sale', 'ArturoBarry', 1170);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1382, to_date('24-07-2013', 'dd-mm-yyyy'), '14:7', '20:17', 'Tadley', 'PetulaGary', 1282);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1383, to_date('02-04-2010', 'dd-mm-yyyy'), '1:32', '20:49', 'Yamaguchi', 'BrothersKinski', 1299);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1384, to_date('22-05-2012', 'dd-mm-yyyy'), '5:25', '7:43', 'Bremen', 'HughMargulies', 1146);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1385, to_date('21-03-2021', 'dd-mm-yyyy'), '13:26', '12:14', 'Carlin', 'WillSweeney', 1212);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1386, to_date('23-08-2013', 'dd-mm-yyyy'), '3:44', '20:44', 'New York City', 'NoraHutch', 1169);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1387, to_date('24-04-2016', 'dd-mm-yyyy'), '18:7', '20:53', 'Pompton Plains', 'RichardSchwarzenegger', 1135);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1388, to_date('08-05-2020', 'dd-mm-yyyy'), '2:3', '1:25', 'Sheffield', 'TayeKimball', 1161);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1389, to_date('18-08-2001', 'dd-mm-yyyy'), '2:10', '16:35', 'Northbrook', 'AmandaOsmond', 1245);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1390, to_date('02-06-2000', 'dd-mm-yyyy'), '19:27', '13:19', 'Fair Lawn', 'DanniO''Sullivan', 1158);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1391, to_date('02-09-2004', 'dd-mm-yyyy'), '18:25', '12:11', 'Sihung-si', 'LeVarCetera', 1166);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1392, to_date('16-07-2021', 'dd-mm-yyyy'), '15:19', '2:10', 'Mapo-gu', 'MosCoe', 1179);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1393, to_date('25-08-2022', 'dd-mm-yyyy'), '13:17', '9:45', 'Kingston', 'MorrisBalaban', 1266);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1394, to_date('25-08-2010', 'dd-mm-yyyy'), '10:53', '22:28', 'Crete', 'GeoffreyGambon', 1176);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1395, to_date('25-06-2008', 'dd-mm-yyyy'), '5:16', '14:59', 'Fuchstal-asch', 'HopeDuvall', 1227);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1396, to_date('15-04-2014', 'dd-mm-yyyy'), '9:45', '17:16', 'Sydney', 'VinceJessee', 1111);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1397, to_date('10-12-2001', 'dd-mm-yyyy'), '10:31', '11:30', 'Pordenone', 'BuffyBacon', 1116);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1398, to_date('30-05-2006', 'dd-mm-yyyy'), '20:12', '23:12', 'Fort gordon', 'ForestMiller', 1169);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1399, to_date('08-06-2014', 'dd-mm-yyyy'), '1:21', '15:33', 'Wetzlar', 'JoaquimShelton', 1227);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1400, to_date('10-05-2007', 'dd-mm-yyyy'), '1:36', '23:27', 'Oshawa', 'HarrisonIngram', 1251);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1401, to_date('16-11-2011', 'dd-mm-yyyy'), '19:47', '14:42', 'Media', 'CateBoothe', 1122);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1402, to_date('01-04-2006', 'dd-mm-yyyy'), '8:39', '20:11', 'Mountain View', 'CledusLandau', 1300);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1403, to_date('11-04-2007', 'dd-mm-yyyy'), '2:30', '19:18', 'Coventry', 'JoyKrieger', 1216);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1404, to_date('26-07-2002', 'dd-mm-yyyy'), '0:6', '15:21', 'Anières', 'DomingoCapshaw', 1241);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1405, to_date('30-05-2014', 'dd-mm-yyyy'), '17:50', '9:18', 'Omaha', 'MelFoley', 1242);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1406, to_date('24-09-2000', 'dd-mm-yyyy'), '21:43', '3:19', 'Franklin', 'ScottMac', 1235);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1407, to_date('16-06-2012', 'dd-mm-yyyy'), '18:18', '23:9', 'Chiba', 'MelanieTennison', 1191);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1408, to_date('27-06-2009', 'dd-mm-yyyy'), '22:26', '21:56', 'Atlanta', 'HollandBello', 1188);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1409, to_date('31-07-2005', 'dd-mm-yyyy'), '16:50', '17:21', 'Carlsbad', 'RickDunaway', 1212);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1410, to_date('23-08-2019', 'dd-mm-yyyy'), '12:12', '21:34', 'Las Vegas', 'VendettaSherman', 1153);
commit;
prompt 300 records committed...
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1411, to_date('13-07-2001', 'dd-mm-yyyy'), '12:15', '18:53', 'Mapo-gu', 'SuzyChecker', 1237);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1412, to_date('12-04-2017', 'dd-mm-yyyy'), '14:34', '19:13', 'Aomori', 'SeannAddy', 1135);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1413, to_date('24-05-2013', 'dd-mm-yyyy'), '16:13', '23:23', 'Tilburg', 'RamseyTurturro', 1296);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1414, to_date('12-12-2003', 'dd-mm-yyyy'), '9:45', '17:16', 'Whittier', 'TeaHatchet', 1287);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1415, to_date('08-08-2015', 'dd-mm-yyyy'), '7:50', '11:56', 'Crete', 'CarrieWinslet', 1118);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1416, to_date('27-05-2008', 'dd-mm-yyyy'), '12:57', '8:8', 'San Francisco', 'MiaWilliams', 1277);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1417, to_date('09-03-2009', 'dd-mm-yyyy'), '15:50', '22:45', 'Walnut Creek', 'SigourneyRippy', 1308);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1418, to_date('10-05-2008', 'dd-mm-yyyy'), '12:16', '10:51', 'Bay Shore', 'BridgetSisto', 1153);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1419, to_date('23-08-2013', 'dd-mm-yyyy'), '18:3', '1:6', 'Cobham', 'SydneyRaye', 1136);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1420, to_date('11-01-2019', 'dd-mm-yyyy'), '7:13', '17:27', 'Warren', 'GordonBriscoe', 1276);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1421, to_date('05-11-2012', 'dd-mm-yyyy'), '3:7', '16:30', 'University', 'LynnKlugh', 1213);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1422, to_date('06-10-2015', 'dd-mm-yyyy'), '22:39', '21:11', 'Coquitlam', 'TaraMoriarty', 1142);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1423, to_date('30-12-2019', 'dd-mm-yyyy'), '1:12', '16:23', 'Mount Laurel', 'RoseTurner', 1208);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1424, to_date('17-01-2018', 'dd-mm-yyyy'), '11:45', '12:10', 'Venice', 'ChazzCantrell', 1222);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1425, to_date('11-08-2002', 'dd-mm-yyyy'), '10:18', '6:27', 'Sao paulo', 'ChristinaPleasence', 1300);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1426, to_date('09-01-2023', 'dd-mm-yyyy'), '16:56', '0:38', 'Udine', 'CarlaAffleck', 1267);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1427, to_date('01-03-2008', 'dd-mm-yyyy'), '8:47', '18:51', 'Americana', 'PatrickRucker', 1128);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1428, to_date('12-11-2003', 'dd-mm-yyyy'), '19:21', '8:30', 'North bethesda', 'TemueraChilton', 1132);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1429, to_date('30-08-2021', 'dd-mm-yyyy'), '0:19', '0:20', 'Gelsenkirchen', 'AnneShaw', 1238);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1430, to_date('19-03-2012', 'dd-mm-yyyy'), '7:10', '11:21', 'Cerritos', 'Carrie-AnneBeck', 1124);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1431, to_date('18-06-2012', 'dd-mm-yyyy'), '11:42', '20:37', 'Sao caetano do sul', 'DonHoffman', 1174);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1432, to_date('27-03-2020', 'dd-mm-yyyy'), '8:22', '1:21', 'Alleroed', 'AngelaBroadbent', 1188);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1433, to_date('26-04-2011', 'dd-mm-yyyy'), '20:35', '21:41', 'Lisboa', 'RosanneChanning', 1217);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1434, to_date('06-08-2016', 'dd-mm-yyyy'), '22:23', '3:44', 'Northampton', 'JonathaPopper', 1217);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1435, to_date('18-12-2006', 'dd-mm-yyyy'), '16:24', '22:3', 'Spring City', 'MikaRooker', 1141);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1436, to_date('07-09-2020', 'dd-mm-yyyy'), '19:10', '23:0', 'Bolzano', 'AngieCassel', 1231);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1437, to_date('01-07-2014', 'dd-mm-yyyy'), '21:18', '2:0', 'Madrid', 'AdinaBeatty', 1180);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1438, to_date('12-10-2000', 'dd-mm-yyyy'), '8:37', '6:36', 'Lisboa', 'LilaO''Neill', 1218);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1439, to_date('03-01-2022', 'dd-mm-yyyy'), '12:57', '2:18', 'Colombes', 'ShelbyPaxton', 1232);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1440, to_date('22-12-2008', 'dd-mm-yyyy'), '16:14', '19:4', 'Paal Beringen', 'DerrickBrickell', 1154);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1441, to_date('30-05-2016', 'dd-mm-yyyy'), '14:32', '0:46', 'Trento', 'LorrainePenn', 1226);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1442, to_date('14-01-2023', 'dd-mm-yyyy'), '18:30', '11:37', 'New boston', 'DanChaykin', 1121);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1443, to_date('12-04-2004', 'dd-mm-yyyy'), '3:15', '18:26', 'Fairbanks', 'LloydMandrell', 1113);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1444, to_date('28-11-2006', 'dd-mm-yyyy'), '22:30', '23:19', 'Sugar Hill', 'JoelyArmatrading', 1308);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1445, to_date('19-09-2014', 'dd-mm-yyyy'), '17:51', '9:45', 'Madrid', 'DickJanssen', 1135);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1446, to_date('11-12-2001', 'dd-mm-yyyy'), '4:8', '18:50', 'Massagno', 'GordieMorse', 1279);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1447, to_date('01-05-2016', 'dd-mm-yyyy'), '17:51', '22:39', 'Bad Camberg', 'JimmieO''Sullivan', 1277);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1448, to_date('26-11-2011', 'dd-mm-yyyy'), '16:48', '15:49', 'Clark', 'LenaParish', 1289);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1449, to_date('30-11-2020', 'dd-mm-yyyy'), '10:9', '17:27', 'Jacksonville', 'WangBello', 1220);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1450, to_date('05-11-2011', 'dd-mm-yyyy'), '13:27', '12:4', 'Nagoya', 'BelindaRebhorn', 1206);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1451, to_date('04-03-2016', 'dd-mm-yyyy'), '1:37', '0:52', 'Tilst', 'TimLyonne', 1266);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1452, to_date('05-04-2016', 'dd-mm-yyyy'), '12:14', '15:37', 'Cobham', 'FamkeAmmons', 1276);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1453, to_date('14-09-2002', 'dd-mm-yyyy'), '15:22', '4:34', 'Waltham', 'LauraFreeman', 1111);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1454, to_date('26-09-2010', 'dd-mm-yyyy'), '4:14', '11:20', 'Trento', 'AlGuinness', 1133);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1455, to_date('14-08-2014', 'dd-mm-yyyy'), '4:39', '2:25', 'Victoria', 'MerilleeJenkins', 1294);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1456, to_date('03-03-2012', 'dd-mm-yyyy'), '16:24', '23:39', 'Soest', 'VictorBradford', 1211);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1457, to_date('17-12-2021', 'dd-mm-yyyy'), '14:26', '12:23', 'Hohenfels', 'RuthSwank', 1269);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1458, to_date('01-05-2002', 'dd-mm-yyyy'), '22:0', '8:57', 'Lummen', 'ChetGraham', 1139);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1459, to_date('19-12-2004', 'dd-mm-yyyy'), '9:33', '14:17', 'Mablethorpe', 'MindyKirkwood', 1293);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1460, to_date('02-02-2002', 'dd-mm-yyyy'), '1:27', '10:0', 'Lincoln', 'GeggyPatillo', 1218);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1461, to_date('15-05-2018', 'dd-mm-yyyy'), '13:51', '12:27', 'Nordhausen', 'HowieHawthorne', 1293);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1462, to_date('24-03-2015', 'dd-mm-yyyy'), '10:43', '11:42', 'Banbury', 'VincentBedelia', 1219);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1463, to_date('20-05-2019', 'dd-mm-yyyy'), '19:17', '18:22', 'Framingaham', 'KylieTwilley', 1123);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1464, to_date('08-04-2016', 'dd-mm-yyyy'), '2:52', '16:27', 'Harrisburg', 'AhmadPaige', 1154);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1465, to_date('03-12-2005', 'dd-mm-yyyy'), '13:30', '12:20', 'Venice', 'Wendyurban', 1196);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1466, to_date('14-12-2014', 'dd-mm-yyyy'), '16:23', '10:33', 'Tottori', 'HaroldNakai', 1280);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1467, to_date('11-01-2001', 'dd-mm-yyyy'), '21:46', '12:50', 'Trumbull', 'LucyDiFranco', 1168);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1468, to_date('17-10-2005', 'dd-mm-yyyy'), '9:57', '13:4', 'Linz', 'TimMandrell', 1257);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1469, to_date('13-09-2017', 'dd-mm-yyyy'), '9:31', '2:51', 'Ipswich', 'ColeQuinones', 1130);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1470, to_date('03-09-2017', 'dd-mm-yyyy'), '22:13', '0:9', 'Ipswich', 'PamelaRusso', 1279);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1471, to_date('08-09-2006', 'dd-mm-yyyy'), '10:0', '18:2', 'Los Angeles', 'AlannahDonovan', 1193);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1472, to_date('27-08-2016', 'dd-mm-yyyy'), '7:12', '22:19', 'Flower mound', 'JohnMacDonald', 1252);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1473, to_date('25-07-2013', 'dd-mm-yyyy'), '7:52', '15:16', 'Gdansk', 'IsabellaDevine', 1204);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1474, to_date('30-06-2018', 'dd-mm-yyyy'), '21:52', '16:48', 'Chur', 'QuentinJohansen', 1169);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1475, to_date('03-02-2007', 'dd-mm-yyyy'), '5:25', '14:8', 'Palma de Mallorca', 'SharonWariner', 1252);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1476, to_date('05-07-2009', 'dd-mm-yyyy'), '13:7', '8:35', 'Powell River', 'RobbyBurke', 1174);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1477, to_date('06-09-2008', 'dd-mm-yyyy'), '5:30', '20:20', 'Warrington', 'PhilipGracie', 1277);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1478, to_date('15-03-2006', 'dd-mm-yyyy'), '9:43', '1:24', 'Jacksonville', 'RutgerAddy', 1308);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1479, to_date('12-01-2020', 'dd-mm-yyyy'), '19:57', '15:0', 'Oklahoma city', 'JoshMadonna', 1199);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1480, to_date('28-02-2000', 'dd-mm-yyyy'), '7:32', '18:51', 'Johor Bahru', 'QueenDillon', 1180);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1481, to_date('13-01-2004', 'dd-mm-yyyy'), '3:33', '4:46', 'Lecanto', 'RedTorres', 1297);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1482, to_date('23-07-2022', 'dd-mm-yyyy'), '11:41', '9:7', 'Kristiansand', 'RaymondMichael', 1267);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1483, to_date('01-02-2012', 'dd-mm-yyyy'), '2:2', '8:20', 'Newton-le-willows', 'BebeQuaid', 1309);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1484, to_date('27-12-2020', 'dd-mm-yyyy'), '7:52', '17:57', 'Würzburg', 'TomCopeland', 1266);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1485, to_date('13-04-2003', 'dd-mm-yyyy'), '21:11', '14:31', 'Altstätten', 'NaomiGugino', 1113);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1486, to_date('28-07-2016', 'dd-mm-yyyy'), '19:29', '15:48', 'Overland park', 'BobbySedaka', 1172);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1487, to_date('11-03-2009', 'dd-mm-yyyy'), '19:3', '21:4', 'Vilafranca Penedes', 'CeCeIngram', 1171);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1488, to_date('08-01-2023', 'dd-mm-yyyy'), '8:15', '1:52', 'Cambridge', 'DianneChild', 1289);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1489, to_date('04-09-2002', 'dd-mm-yyyy'), '21:20', '13:4', 'Ringwood', 'AndraeWeisz', 1275);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1490, to_date('17-06-2005', 'dd-mm-yyyy'), '15:42', '0:44', 'Oxford', 'ArminMichael', 1283);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1491, to_date('26-12-2012', 'dd-mm-yyyy'), '23:25', '1:48', 'Irving', 'FayeHamilton', 1176);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1492, to_date('02-02-2013', 'dd-mm-yyyy'), '1:16', '23:3', 'Glen allen', 'ElleLaw', 1223);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1493, to_date('03-05-2001', 'dd-mm-yyyy'), '11:30', '11:50', 'Marlboro', 'ChristineCharles', 1204);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1494, to_date('06-01-2000', 'dd-mm-yyyy'), '1:11', '9:24', 'Di Savigliano', 'SylvesterChild', 1208);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1495, to_date('17-12-2022', 'dd-mm-yyyy'), '16:36', '9:1', 'Sainte-foy', 'BobFariq', 1221);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1496, to_date('05-07-2010', 'dd-mm-yyyy'), '12:53', '1:16', 'Linz', 'MarthaSolido', 1185);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1497, to_date('16-08-2008', 'dd-mm-yyyy'), '5:1', '7:49', 'Mount Laurel', 'VivicaPage', 1183);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1498, to_date('23-12-2000', 'dd-mm-yyyy'), '19:0', '17:13', 'Lecanto', 'LydiaWatley', 1283);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1499, to_date('07-10-2023', 'dd-mm-yyyy'), '16:9', '0:10', 'Oyten', 'ZooeyLithgow', 1155);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1500, to_date('11-03-2022', 'dd-mm-yyyy'), '19:16', '20:37', 'Maidstone', 'GlenHudson', 1280);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1501, to_date('17-11-2001', 'dd-mm-yyyy'), '5:29', '6:59', 'Houma', 'MaryPearce', 1239);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1502, to_date('09-09-2009', 'dd-mm-yyyy'), '16:31', '21:39', 'Bad Oeynhausen', 'DougHawn', 1187);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1503, to_date('14-04-2004', 'dd-mm-yyyy'), '1:45', '13:4', 'Mumbai', 'DelroyShawn', 1138);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1504, to_date('18-12-2012', 'dd-mm-yyyy'), '17:42', '8:58', 'Sheffield', 'ThinSizemore', 1272);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1505, to_date('25-09-2001', 'dd-mm-yyyy'), '0:57', '4:27', 'Stavanger', 'WillemLee', 1222);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1506, to_date('13-10-2000', 'dd-mm-yyyy'), '12:22', '6:40', 'Hearst', 'LarryTillis', 1172);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1507, to_date('11-01-2019', 'dd-mm-yyyy'), '17:40', '16:49', 'Mountain View', 'GordieAdler', 1266);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1508, to_date('13-01-2006', 'dd-mm-yyyy'), '13:14', '16:11', 'Lowell', 'VendettaMolina', 1136);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1509, to_date('12-05-2016', 'dd-mm-yyyy'), '14:37', '14:48', 'Bremen', 'KidGibbons', 1159);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1510, to_date('22-01-2003', 'dd-mm-yyyy'), '15:8', '13:23', 'Aurora', 'GeoffLlewelyn', 1160);
commit;
prompt 400 records committed...
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1511, to_date('01-11-2017', 'dd-mm-yyyy'), '20:44', '23:35', 'Pecs', 'GenaDzundza', 1178);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1512, to_date('05-04-2018', 'dd-mm-yyyy'), '3:52', '5:16', 'Stellenbosch', 'RyanFinn', 1163);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1513, to_date('11-06-2017', 'dd-mm-yyyy'), '21:7', '9:55', 'Londrina', 'AlfieGraham', 1135);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1514, to_date('17-04-2009', 'dd-mm-yyyy'), '11:7', '6:24', 'New hartford', 'SamParsons', 1146);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1515, to_date('24-01-2013', 'dd-mm-yyyy'), '7:45', '13:42', 'St. Petersburg', 'AnthonyFranklin', 1179);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1516, to_date('13-07-2012', 'dd-mm-yyyy'), '4:44', '5:20', 'Oldham', 'JesseKeener', 1126);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1517, to_date('14-11-2015', 'dd-mm-yyyy'), '20:41', '10:7', 'Freising', 'AllanSpiner', 1303);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1518, to_date('05-10-2001', 'dd-mm-yyyy'), '14:6', '2:50', 'Eden prairie', 'SheenaTwilley', 1178);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1519, to_date('29-04-2019', 'dd-mm-yyyy'), '5:33', '6:49', 'Richmond', 'HookahBryson', 1224);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1520, to_date('30-12-2021', 'dd-mm-yyyy'), '18:25', '0:44', 'Swannanoa', 'TraceMortensen', 1116);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1521, to_date('03-10-2001', 'dd-mm-yyyy'), '18:46', '23:28', 'Seattle', 'LinSchiff', 1142);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1522, to_date('17-11-2007', 'dd-mm-yyyy'), '4:10', '16:51', 'São paulo', 'PelvicTate', 1171);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1523, to_date('30-11-2007', 'dd-mm-yyyy'), '22:15', '3:16', 'Englewood Cliffs', 'SallyPollack', 1264);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1524, to_date('14-05-2005', 'dd-mm-yyyy'), '5:0', '15:33', 'Herdecke', 'JudyBranch', 1121);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1525, to_date('08-05-2010', 'dd-mm-yyyy'), '4:12', '21:58', 'Buenos Aires', 'JakeLynne', 1166);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1526, to_date('01-02-2007', 'dd-mm-yyyy'), '22:4', '21:52', 'Tilst', 'HughBalk', 1204);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1527, to_date('26-06-2005', 'dd-mm-yyyy'), '23:21', '9:2', 'Rockford', 'GwynethVincent', 1226);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1528, to_date('03-10-2020', 'dd-mm-yyyy'), '6:18', '3:32', 'Guadalajara', 'LaurenceEvett', 1155);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1529, to_date('30-12-2007', 'dd-mm-yyyy'), '1:33', '10:16', 'Essex', 'RitchieKlein', 1154);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1530, to_date('14-09-2009', 'dd-mm-yyyy'), '4:55', '12:50', 'Blue bell', 'LorettaPhillippe', 1143);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1531, to_date('20-06-2012', 'dd-mm-yyyy'), '5:16', '8:24', 'Timonium', 'LievShepherd', 1206);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1532, to_date('06-01-2014', 'dd-mm-yyyy'), '17:23', '9:6', 'Thalwil', 'EdgarWesterberg', 1156);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1533, to_date('20-05-2006', 'dd-mm-yyyy'), '0:7', '17:32', 'Newton-le-willows', 'AidaNapolitano', 1172);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1534, to_date('23-12-2008', 'dd-mm-yyyy'), '4:44', '8:39', 'Or-yehuda', 'HenryDafoe', 1111);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1535, to_date('25-07-2004', 'dd-mm-yyyy'), '5:7', '13:29', 'Borger', 'BebePaquin', 1199);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1536, to_date('27-06-2019', 'dd-mm-yyyy'), '23:2', '3:10', 'Green bay', 'ScarlettShaw', 1140);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1537, to_date('31-03-2023', 'dd-mm-yyyy'), '1:42', '8:42', 'New York City', 'ChaleeBrosnan', 1182);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1538, to_date('10-10-2006', 'dd-mm-yyyy'), '11:1', '6:18', 'Allen', 'PamMcAnally', 1228);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1539, to_date('02-09-2017', 'dd-mm-yyyy'), '21:13', '23:42', 'Fairview Heights', 'JudgeFerry', 1225);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1540, to_date('27-09-2016', 'dd-mm-yyyy'), '15:53', '4:12', 'Daejeon', 'GarryConnelly', 1292);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1541, to_date('07-12-2017', 'dd-mm-yyyy'), '21:16', '7:13', 'Québec', 'ColinRubinek', 1212);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1542, to_date('16-11-2016', 'dd-mm-yyyy'), '20:39', '7:13', 'Flushing', 'NoahKidman', 1264);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1543, to_date('05-01-2008', 'dd-mm-yyyy'), '15:35', '14:34', 'Charleston', 'SamClarkson', 1273);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1544, to_date('06-12-2017', 'dd-mm-yyyy'), '16:8', '22:10', 'North Yorkshire', 'JaniceHolmes', 1279);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1545, to_date('30-09-2016', 'dd-mm-yyyy'), '2:59', '0:56', 'Erlangen', 'LivCole', 1206);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1546, to_date('28-11-2000', 'dd-mm-yyyy'), '1:54', '22:9', 'Warszawa', 'JaredEpps', 1309);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1547, to_date('23-08-2005', 'dd-mm-yyyy'), '5:38', '20:48', 'Maidstone', 'JoshuaNolte', 1296);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1548, to_date('02-09-2000', 'dd-mm-yyyy'), '21:52', '20:56', 'Tooele', 'DaveyRubinek', 1113);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1549, to_date('19-03-2020', 'dd-mm-yyyy'), '23:27', '5:12', 'Lecanto', 'WallyAlmond', 1248);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1550, to_date('19-08-2003', 'dd-mm-yyyy'), '6:41', '14:18', 'Haverhill', 'ColleenEat World', 1295);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1551, to_date('29-05-2007', 'dd-mm-yyyy'), '10:10', '13:16', 'Lexington', 'HookahGreenwood', 1177);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1552, to_date('21-09-2003', 'dd-mm-yyyy'), '22:15', '5:57', 'Zurich', 'LupeKattan', 1138);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1553, to_date('09-05-2001', 'dd-mm-yyyy'), '10:6', '9:50', 'Sao roque', 'IanGoodall', 1132);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1554, to_date('05-06-2022', 'dd-mm-yyyy'), '11:2', '1:58', 'Bracknell', 'LinCromwell', 1192);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1555, to_date('19-07-2001', 'dd-mm-yyyy'), '8:56', '17:53', 'Grand Rapids', 'CarolDamon', 1286);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1556, to_date('13-11-2021', 'dd-mm-yyyy'), '14:10', '4:4', 'Overland park', 'JaimeBenet', 1159);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1557, to_date('26-07-2002', 'dd-mm-yyyy'), '1:54', '5:55', 'Valencia', 'AlfredGrant', 1151);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1558, to_date('29-10-2023', 'dd-mm-yyyy'), '9:40', '7:55', 'Zürich', 'ViennaFoxx', 1244);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1559, to_date('10-10-2014', 'dd-mm-yyyy'), '4:55', '14:10', 'Miami', 'BobEaston', 1181);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1560, to_date('31-05-2016', 'dd-mm-yyyy'), '16:28', '1:23', 'Orleans', 'JillBening', 1205);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1561, to_date('14-06-2002', 'dd-mm-yyyy'), '2:27', '15:32', 'Milton', 'SallyPlummer', 1212);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1562, to_date('11-01-2009', 'dd-mm-yyyy'), '13:26', '0:42', 'Market Harborough', 'NickelIdol', 1236);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1563, to_date('11-07-2002', 'dd-mm-yyyy'), '0:9', '23:32', 'Verdun', 'KimberlyBlair', 1117);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1564, to_date('18-02-2017', 'dd-mm-yyyy'), '0:9', '1:41', 'Lincoln', 'OwenBeals', 1264);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1565, to_date('28-12-2005', 'dd-mm-yyyy'), '12:25', '23:24', 'Las Vegas', 'RonnieKeitel', 1252);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1566, to_date('11-02-2017', 'dd-mm-yyyy'), '14:45', '0:6', 'Chicago', 'RedSharp', 1183);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1567, to_date('02-11-2011', 'dd-mm-yyyy'), '15:22', '2:15', 'Valencia', 'OliverSummer', 1233);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1568, to_date('04-09-2007', 'dd-mm-yyyy'), '3:26', '22:45', 'Huntington', 'ZooeyFarris', 1216);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1569, to_date('18-02-2008', 'dd-mm-yyyy'), '4:3', '20:11', 'Thalwil', 'MekhiWilder', 1223);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1570, to_date('11-08-2022', 'dd-mm-yyyy'), '3:42', '9:48', 'Chorzów', 'IsaiahTate', 1209);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1571, to_date('20-11-2014', 'dd-mm-yyyy'), '3:56', '20:12', 'Koppl', 'LonnieWatley', 1288);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1572, to_date('28-06-2016', 'dd-mm-yyyy'), '6:25', '20:30', 'Pandrup', 'DelbertSupernaw', 1225);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1573, to_date('24-06-2009', 'dd-mm-yyyy'), '22:40', '7:8', 'Webster Groves', 'EarlIrons', 1135);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1574, to_date('26-09-2007', 'dd-mm-yyyy'), '19:1', '6:45', 'Pensacola', 'DianneCarrington', 1216);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1575, to_date('19-07-2018', 'dd-mm-yyyy'), '3:14', '10:39', 'Rio de janeiro', 'JeroenCarnes', 1180);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1576, to_date('07-02-2019', 'dd-mm-yyyy'), '22:41', '16:41', 'Issaquah', 'FisherVan Shelton', 1213);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1577, to_date('10-02-2001', 'dd-mm-yyyy'), '11:22', '22:15', 'Echirolles', 'KittyWahlberg', 1254);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1578, to_date('13-03-2016', 'dd-mm-yyyy'), '4:9', '9:45', 'West Launceston', 'LeoAssante', 1208);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1579, to_date('13-09-2005', 'dd-mm-yyyy'), '17:27', '2:2', 'Longueuil', 'RitchieQuinlan', 1140);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1580, to_date('29-01-2004', 'dd-mm-yyyy'), '5:56', '6:9', 'Varzea grande', 'JuanBrody', 1232);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1581, to_date('05-03-2013', 'dd-mm-yyyy'), '13:46', '19:34', 'Gifu', 'SissySevigny', 1133);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1582, to_date('19-11-2013', 'dd-mm-yyyy'), '12:33', '21:36', 'Natal', 'MaureenEllis', 1286);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1583, to_date('26-02-2019', 'dd-mm-yyyy'), '18:51', '22:31', 'Jacksonville', 'KurtwoodPortman', 1288);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1584, to_date('07-01-2023', 'dd-mm-yyyy'), '4:59', '0:43', 'Calgary', 'LesleyFeuerstein', 1202);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1585, to_date('26-09-2013', 'dd-mm-yyyy'), '17:54', '15:29', 'Coppell', 'RupertLoggia', 1171);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1586, to_date('04-02-2007', 'dd-mm-yyyy'), '16:10', '8:39', 'Milsons Point', 'NilsAtkins', 1267);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1587, to_date('22-05-2009', 'dd-mm-yyyy'), '11:23', '18:47', 'West Monroe', 'ShelbyClinton', 1224);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1588, to_date('25-12-2002', 'dd-mm-yyyy'), '6:7', '14:45', 'Marietta', 'HazelPotter', 1156);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1589, to_date('21-01-2023', 'dd-mm-yyyy'), '6:35', '1:15', 'Milsons Point', 'VivicaFord', 1235);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1590, to_date('14-03-2003', 'dd-mm-yyyy'), '9:42', '14:4', 'Conshohocken', 'TalvinZane', 1118);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1591, to_date('04-02-2020', 'dd-mm-yyyy'), '18:57', '17:37', 'Stoneham', 'GwynethSquier', 1215);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1592, to_date('08-10-2021', 'dd-mm-yyyy'), '14:44', '1:41', 'Bretzfeld-Waldbach', 'GordieTambor', 1263);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1593, to_date('15-09-2007', 'dd-mm-yyyy'), '6:4', '4:2', 'Bernex', 'LupeTrejo', 1128);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1594, to_date('15-10-2016', 'dd-mm-yyyy'), '13:16', '20:47', 'Barueri', 'StephenJolie', 1253);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1595, to_date('17-05-2004', 'dd-mm-yyyy'), '21:24', '22:10', 'Oshkosh', 'NanciByrd', 1134);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1596, to_date('12-11-2021', 'dd-mm-yyyy'), '9:14', '16:33', 'Knutsford', 'HeatherKahn', 1151);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1597, to_date('26-05-2022', 'dd-mm-yyyy'), '13:12', '13:35', 'Battle Creek', 'CatherineSlater', 1168);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1598, to_date('03-06-2006', 'dd-mm-yyyy'), '8:7', '6:57', 'St. Louis', 'PamKershaw', 1201);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1599, to_date('31-08-2018', 'dd-mm-yyyy'), '6:41', '10:12', 'Lubbock', 'CourtneySanta Rosa', 1307);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1600, to_date('06-03-2021', 'dd-mm-yyyy'), '9:36', '14:24', 'Bollensen', 'HelenRosas', 1116);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1601, to_date('04-11-2003', 'dd-mm-yyyy'), '19:44', '20:48', 'Vanderbijlpark', 'CarolynPrice', 1171);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1602, to_date('08-09-2001', 'dd-mm-yyyy'), '22:16', '4:39', 'Double Oak', 'FreddyMacLachlan', 1178);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1603, to_date('15-08-2009', 'dd-mm-yyyy'), '20:48', '18:35', 'Paço de Arcos', 'BalthazarBroadbent', 1270);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1604, to_date('06-09-2005', 'dd-mm-yyyy'), '6:16', '21:2', 'Salvador', 'AlbertSawa', 1169);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1605, to_date('25-05-2015', 'dd-mm-yyyy'), '8:0', '10:43', 'Kuopio', 'JoyTolkan', 1150);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1606, to_date('05-01-2001', 'dd-mm-yyyy'), '10:12', '2:7', 'Genève', 'KylieBandy', 1148);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1607, to_date('28-04-2001', 'dd-mm-yyyy'), '13:19', '1:3', 'Veenendaal', 'TemueraNeuwirth', 1303);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1608, to_date('30-12-2009', 'dd-mm-yyyy'), '21:57', '5:50', 'Rome', 'CarlCarrey', 1163);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1609, to_date('01-07-2005', 'dd-mm-yyyy'), '3:29', '0:18', 'Swarthmore', 'SpencerTah', 1115);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1610, to_date('27-09-2003', 'dd-mm-yyyy'), '11:12', '13:15', 'Tottori', 'LiliImbruglia', 1135);
commit;
prompt 500 records committed...
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1611, to_date('09-12-2016', 'dd-mm-yyyy'), '1:27', '0:21', 'Stafford', 'HoraceWopat', 1239);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1612, to_date('16-10-2022', 'dd-mm-yyyy'), '3:6', '12:11', 'St. Louis', 'HoraceCamp', 1269);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1613, to_date('18-07-2001', 'dd-mm-yyyy'), '1:26', '12:29', 'Bruxelles', 'DaveyAdkins', 1258);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1614, to_date('25-05-2021', 'dd-mm-yyyy'), '3:52', '7:11', 'Kagoshima', 'TanyaCharles', 1142);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1615, to_date('01-06-2022', 'dd-mm-yyyy'), '21:38', '8:59', 'Perth', 'HowardLang', 1254);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1616, to_date('30-04-2015', 'dd-mm-yyyy'), '8:21', '22:45', 'Columbus', 'MorganEldard', 1171);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1617, to_date('13-01-2023', 'dd-mm-yyyy'), '6:30', '13:6', 'Hampton', 'CrispinFinn', 1236);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1618, to_date('28-04-2019', 'dd-mm-yyyy'), '16:33', '14:24', 'Newbury', 'DebiChapman', 1128);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1619, to_date('01-07-2023', 'dd-mm-yyyy'), '1:18', '9:46', 'Carlin', 'SherylWainwright', 1280);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1620, to_date('17-10-2009', 'dd-mm-yyyy'), '2:23', '9:18', 'Darmstadt', 'JacksonFrancis', 1270);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1621, to_date('29-04-2010', 'dd-mm-yyyy'), '3:43', '13:36', 'Soroe', 'HikaruDriver', 1169);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1622, to_date('26-03-2006', 'dd-mm-yyyy'), '8:52', '1:22', 'Glenshaw', 'ColmSarandon', 1176);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1623, to_date('10-03-2003', 'dd-mm-yyyy'), '20:58', '21:43', 'Macclesfield', 'LonnieRoth', 1208);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1624, to_date('03-12-2019', 'dd-mm-yyyy'), '18:48', '6:54', 'Yamagata', 'HowardVan Damme', 1242);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1625, to_date('03-01-2015', 'dd-mm-yyyy'), '12:13', '7:11', 'Lecanto', 'MachinePatillo', 1306);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1626, to_date('27-01-2013', 'dd-mm-yyyy'), '19:23', '22:36', 'Edinburgh', 'AngieCarlisle', 1272);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1627, to_date('11-02-2020', 'dd-mm-yyyy'), '21:40', '0:19', 'Zipf', 'LeaPalmer', 1159);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1628, to_date('31-10-2019', 'dd-mm-yyyy'), '10:22', '8:30', 'Salisbury', 'RebekaWills', 1282);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1629, to_date('11-06-2007', 'dd-mm-yyyy'), '12:43', '21:17', 'Pulheim-brauweiler', 'TerenceBracco', 1310);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1630, to_date('11-06-2019', 'dd-mm-yyyy'), '23:53', '9:7', 'Cypress', 'JaneaneJackman', 1183);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1631, to_date('28-09-2001', 'dd-mm-yyyy'), '18:2', '11:22', 'Allen', 'NickelWebb', 1119);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1632, to_date('19-01-2000', 'dd-mm-yyyy'), '12:19', '19:15', 'Immenstaad', 'IreneHyde', 1285);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1633, to_date('16-09-2016', 'dd-mm-yyyy'), '11:4', '21:7', 'Kozani', 'DianeOntiveros', 1142);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1634, to_date('20-09-2017', 'dd-mm-yyyy'), '7:53', '15:29', 'Fairbanks', 'EthanMorton', 1288);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1635, to_date('14-08-2002', 'dd-mm-yyyy'), '19:45', '20:28', 'Omaha', 'MiraGough', 1255);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1636, to_date('29-04-2022', 'dd-mm-yyyy'), '20:19', '19:43', 'Pitstone', 'GordShannon', 1307);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1637, to_date('14-11-2021', 'dd-mm-yyyy'), '16:41', '4:27', 'Trieste', 'DavisBrock', 1135);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1638, to_date('07-10-2013', 'dd-mm-yyyy'), '1:40', '19:33', 'Mechelen', 'RipCollette', 1129);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1639, to_date('28-11-2023', 'dd-mm-yyyy'), '7:41', '23:45', 'Oshawa', 'MadelineTurner', 1270);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1640, to_date('22-05-2009', 'dd-mm-yyyy'), '20:58', '6:41', 'Northbrook', 'ChadMcAnally', 1126);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1641, to_date('02-09-2018', 'dd-mm-yyyy'), '11:11', '4:30', 'Cheshire', 'CevinUnion', 1305);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1642, to_date('06-04-2017', 'dd-mm-yyyy'), '9:30', '2:39', 'Fort McMurray', 'KennyOrbit', 1157);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1643, to_date('08-06-2003', 'dd-mm-yyyy'), '12:47', '12:39', 'New York', 'MindyDorn', 1117);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1644, to_date('11-08-2007', 'dd-mm-yyyy'), '17:13', '0:37', 'Fuerth', 'SpencerMyles', 1154);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1645, to_date('06-04-2010', 'dd-mm-yyyy'), '20:2', '17:0', 'Bolton', 'QuentinHewett', 1202);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1646, to_date('03-08-2001', 'dd-mm-yyyy'), '6:46', '12:27', 'Enfield', 'JeffreyBening', 1239);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1647, to_date('29-08-2023', 'dd-mm-yyyy'), '9:26', '23:13', 'East Peoria', 'TalSchreiber', 1272);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1648, to_date('01-03-2007', 'dd-mm-yyyy'), '10:47', '17:44', 'Leipzig', 'ArmandBurstyn', 1141);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1649, to_date('16-07-2016', 'dd-mm-yyyy'), '8:59', '13:36', 'Solon', 'JulietteFrancis', 1232);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1650, to_date('08-09-2019', 'dd-mm-yyyy'), '9:28', '13:28', 'Concordville', 'ForestSlater', 1285);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1651, to_date('14-11-2020', 'dd-mm-yyyy'), '10:10', '10:33', 'Alcobendas', 'RogerAglukark', 1309);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1652, to_date('03-06-2020', 'dd-mm-yyyy'), '15:53', '17:40', 'Curitiba', 'HalleNegbaur', 1139);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1653, to_date('16-04-2004', 'dd-mm-yyyy'), '1:56', '4:37', 'Offenburg', 'BillyLynne', 1148);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1654, to_date('31-05-2021', 'dd-mm-yyyy'), '10:4', '20:41', 'Moorestown', 'GinDempsey', 1251);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1655, to_date('08-06-2002', 'dd-mm-yyyy'), '10:23', '2:38', 'Berlin', 'ChelyCharles', 1199);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1656, to_date('20-09-2010', 'dd-mm-yyyy'), '22:12', '9:46', 'San Antonio', 'PowersBuscemi', 1132);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1657, to_date('18-01-2021', 'dd-mm-yyyy'), '2:46', '17:7', 'St Jean de Soudain', 'DannyDanes', 1223);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1658, to_date('06-02-2012', 'dd-mm-yyyy'), '15:29', '1:35', 'Victoria', 'DanniWithers', 1178);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1659, to_date('10-06-2017', 'dd-mm-yyyy'), '5:23', '23:52', 'Soest', 'LindsayDerringer', 1139);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1660, to_date('19-01-2009', 'dd-mm-yyyy'), '11:14', '6:34', 'Altstätten', 'DougSingletary', 1281);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1661, to_date('28-11-2005', 'dd-mm-yyyy'), '8:13', '7:59', 'Gauteng', 'WallyLightfoot', 1116);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1662, to_date('30-05-2003', 'dd-mm-yyyy'), '21:33', '8:19', 'Boulogne', 'KatrinMraz', 1239);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1663, to_date('02-11-2004', 'dd-mm-yyyy'), '0:53', '12:27', 'New Hope', 'AliceMacPherson', 1153);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1664, to_date('08-11-2010', 'dd-mm-yyyy'), '8:36', '17:7', 'Gdansk', 'SheenaSpiner', 1210);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1665, to_date('23-01-2013', 'dd-mm-yyyy'), '10:54', '7:18', 'Redwood Shores', 'RhettWopat', 1179);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1666, to_date('29-08-2021', 'dd-mm-yyyy'), '15:48', '12:4', 'Yamaguchi', 'DerekCurfman', 1253);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1667, to_date('15-06-2007', 'dd-mm-yyyy'), '0:34', '10:23', 'Pulheim-brauweiler', 'KirstenHanley', 1228);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1668, to_date('24-09-2004', 'dd-mm-yyyy'), '12:27', '0:51', 'Boulder', 'UdoCosta', 1207);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1669, to_date('12-10-2010', 'dd-mm-yyyy'), '21:6', '22:8', 'Velizy Villacoublay', 'VanessaFlanery', 1213);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1670, to_date('27-06-2008', 'dd-mm-yyyy'), '15:59', '9:21', 'Lippetal', 'SineadParsons', 1217);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1671, to_date('19-07-2017', 'dd-mm-yyyy'), '10:6', '13:46', 'Phoenix', 'AniBlige', 1212);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1672, to_date('26-05-2009', 'dd-mm-yyyy'), '13:14', '21:32', 'Balmoral', 'LaurieHolbrook', 1237);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1673, to_date('27-11-2000', 'dd-mm-yyyy'), '21:12', '10:31', 'Cape town', 'GenaRosas', 1290);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1674, to_date('24-07-2020', 'dd-mm-yyyy'), '9:0', '16:41', 'Pensacola', 'KennyCruise', 1280);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1675, to_date('18-06-2008', 'dd-mm-yyyy'), '10:53', '11:48', 'Appenzell', 'NikkiPerrineau', 1227);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1676, to_date('23-01-2014', 'dd-mm-yyyy'), '8:20', '19:28', 'München', 'ShawnSellers', 1201);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1677, to_date('21-05-2002', 'dd-mm-yyyy'), '0:44', '17:49', 'Stony Point', 'RaulCruz', 1156);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1678, to_date('22-05-2008', 'dd-mm-yyyy'), '15:2', '9:26', 'Newbury', 'AshtonBasinger', 1205);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1679, to_date('10-11-2002', 'dd-mm-yyyy'), '12:56', '22:51', 'Lecanto', 'BridgetteDern', 1283);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1680, to_date('29-05-2008', 'dd-mm-yyyy'), '17:36', '19:48', 'Boise', 'BonnieDuke', 1149);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1681, to_date('21-03-2007', 'dd-mm-yyyy'), '7:45', '12:56', 'Appenzell', 'JudeBloch', 1174);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1682, to_date('11-12-2020', 'dd-mm-yyyy'), '7:55', '1:50', 'Wichita', 'TramaineLloyd', 1237);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1683, to_date('19-04-2011', 'dd-mm-yyyy'), '0:16', '20:47', 'Bad Camberg', 'HarveySampson', 1186);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1684, to_date('08-05-2008', 'dd-mm-yyyy'), '10:44', '2:19', 'Pottendorf', 'DenzelMarx', 1141);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1685, to_date('22-10-2007', 'dd-mm-yyyy'), '1:56', '17:47', 'Kochi', 'ChiKaryo', 1124);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1686, to_date('18-06-2022', 'dd-mm-yyyy'), '14:43', '3:2', 'Colombo', 'JuliettePearce', 1141);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1687, to_date('12-11-2018', 'dd-mm-yyyy'), '13:11', '18:7', 'Parma', 'BrookeWinslet', 1179);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1688, to_date('05-07-2011', 'dd-mm-yyyy'), '17:34', '16:36', 'New Delhi', 'KathyForrest', 1160);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1689, to_date('17-11-2011', 'dd-mm-yyyy'), '8:54', '12:21', 'Happy Valley', 'TyCurtis', 1125);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1690, to_date('11-02-2007', 'dd-mm-yyyy'), '14:8', '12:7', 'Sao caetano do sul', 'BrothersKutcher', 1174);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1691, to_date('04-09-2023', 'dd-mm-yyyy'), '16:33', '2:3', 'Louisville', 'CyndiMakeba', 1134);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1692, to_date('23-05-2010', 'dd-mm-yyyy'), '11:35', '3:21', 'Colombo', 'IsabellaWiedlin', 1259);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1693, to_date('20-04-2021', 'dd-mm-yyyy'), '2:18', '11:54', 'Sale', 'DelroyAssante', 1277);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1694, to_date('27-11-2000', 'dd-mm-yyyy'), '6:7', '17:38', 'Hartford', 'BobBenoit', 1259);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1695, to_date('02-01-2023', 'dd-mm-yyyy'), '10:2', '4:40', 'Pottendorf', 'KevinBoothe', 1244);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1696, to_date('31-08-2001', 'dd-mm-yyyy'), '21:13', '5:59', 'Westport', 'FrancesKleinenberg', 1157);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1697, to_date('03-07-2015', 'dd-mm-yyyy'), '18:14', '15:2', 'Gaza', 'DenzelGosdin', 1197);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1698, to_date('29-06-2002', 'dd-mm-yyyy'), '6:54', '2:38', 'Rio de janeiro', 'LaurieWaite', 1288);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1699, to_date('09-07-2008', 'dd-mm-yyyy'), '12:0', '18:38', 'Dresden', 'ElizabethPeet', 1164);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1700, to_date('07-12-2002', 'dd-mm-yyyy'), '3:44', '17:1', 'Fuchstal-asch', 'NicoleSpeaks', 1185);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1701, to_date('26-09-2015', 'dd-mm-yyyy'), '15:46', '18:10', 'Recife', 'CateHurt', 1186);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1702, to_date('20-08-2007', 'dd-mm-yyyy'), '1:28', '7:23', 'El Masnou', 'SalmaColton', 1265);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1703, to_date('26-02-2007', 'dd-mm-yyyy'), '5:14', '19:13', 'Johannesburg', 'ChloeMills', 1253);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1704, to_date('24-06-2005', 'dd-mm-yyyy'), '23:21', '3:36', 'Recife', 'NileSobieski', 1129);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1705, to_date('30-09-2020', 'dd-mm-yyyy'), '4:6', '2:53', 'Mablethorpe', 'DerrickGuilfoyle', 1114);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1706, to_date('30-01-2003', 'dd-mm-yyyy'), '15:22', '8:35', 'Perth', 'Jean-LucMcGinley', 1249);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1707, to_date('15-01-2007', 'dd-mm-yyyy'), '2:52', '12:38', 'Oxford', 'MollySavage', 1182);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1708, to_date('28-10-2001', 'dd-mm-yyyy'), '20:55', '14:29', 'Schaumburg', 'DennisShort', 1288);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1709, to_date('24-07-2003', 'dd-mm-yyyy'), '7:7', '12:36', 'Kristiansand', 'NikkiStills', 1113);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1710, to_date('27-03-2006', 'dd-mm-yyyy'), '17:52', '16:45', 'Ithaca', 'CeCeGriggs', 1190);
commit;
prompt 600 records committed...
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1711, to_date('25-07-2012', 'dd-mm-yyyy'), '18:31', '4:46', 'Kaohsiung', 'FionaMoody', 1210);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1712, to_date('13-03-2016', 'dd-mm-yyyy'), '2:27', '12:50', 'Duisburg', 'LaurenKinnear', 1197);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1713, to_date('17-07-2003', 'dd-mm-yyyy'), '11:23', '0:6', 'Sendai', 'MattLorenz', 1137);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1714, to_date('28-11-2012', 'dd-mm-yyyy'), '23:44', '20:25', 'Victoria', 'TildaKapanka', 1231);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1715, to_date('02-03-2005', 'dd-mm-yyyy'), '16:23', '22:51', 'Barueri', 'DelroyIglesias', 1168);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1716, to_date('09-01-2000', 'dd-mm-yyyy'), '15:12', '19:24', 'Potsdam', 'SethTorn', 1268);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1717, to_date('28-08-2002', 'dd-mm-yyyy'), '8:18', '13:58', 'Kongserbg', 'LorenForrest', 1273);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1718, to_date('18-12-2005', 'dd-mm-yyyy'), '2:46', '12:1', 'Monroe', 'CleaBelle', 1242);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1719, to_date('03-11-2011', 'dd-mm-yyyy'), '1:43', '15:59', 'Miyazaki', 'SandraCross', 1286);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1720, to_date('06-02-2016', 'dd-mm-yyyy'), '21:51', '0:53', 'Flushing', 'HowardSkaggs', 1301);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1721, to_date('21-09-2006', 'dd-mm-yyyy'), '13:22', '23:26', 'Mobile', 'GinCurry', 1167);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1722, to_date('02-02-2011', 'dd-mm-yyyy'), '5:24', '0:46', 'Ann Arbor', 'MitchellBratt', 1152);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1723, to_date('10-11-2000', 'dd-mm-yyyy'), '3:42', '15:10', 'Hillerød', 'ArtGibbons', 1119);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1724, to_date('19-08-2008', 'dd-mm-yyyy'), '13:14', '3:18', 'Petach-Tikva', 'JillShort', 1112);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1725, to_date('02-04-2020', 'dd-mm-yyyy'), '10:16', '6:27', 'Duisburg', 'TonyMagnuson', 1267);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1726, to_date('17-12-2009', 'dd-mm-yyyy'), '16:50', '12:52', 'Koeln', 'DebraRaye', 1296);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1727, to_date('22-12-2017', 'dd-mm-yyyy'), '6:50', '22:26', 'Paal Beringen', 'YaphetEllis', 1223);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1728, to_date('21-11-2010', 'dd-mm-yyyy'), '4:26', '5:14', 'Mechelen', 'LukeWen', 1223);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1729, to_date('15-12-2003', 'dd-mm-yyyy'), '9:17', '23:54', 'Gauteng', 'SylvesterColtrane', 1253);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1730, to_date('14-09-2021', 'dd-mm-yyyy'), '16:7', '9:15', 'Billerica', 'DeanFeuerstein', 1310);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1731, to_date('04-03-2016', 'dd-mm-yyyy'), '14:16', '17:20', 'Norderstedt', 'FamkeRed', 1174);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1732, to_date('06-10-2007', 'dd-mm-yyyy'), '19:39', '13:22', 'Copenhagen', 'BillSpacey', 1175);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1733, to_date('28-10-2021', 'dd-mm-yyyy'), '22:16', '18:20', 'Samrand', 'JoseMorales', 1302);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1734, to_date('30-03-2001', 'dd-mm-yyyy'), '12:56', '13:26', 'Bremen', 'LouPlowright', 1118);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1735, to_date('10-05-2016', 'dd-mm-yyyy'), '22:25', '18:2', 'Fort McMurray', 'AzucarHaslam', 1126);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1736, to_date('30-07-2009', 'dd-mm-yyyy'), '20:30', '13:56', 'Mendoza', 'BrookeMarx', 1220);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1737, to_date('15-11-2012', 'dd-mm-yyyy'), '3:17', '21:18', 'Hackensack', 'JaneaneReubens', 1260);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1738, to_date('07-10-2013', 'dd-mm-yyyy'), '10:36', '13:9', 'Bingham Farms', 'Carrie-AnneWeston', 1255);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1739, to_date('21-08-2008', 'dd-mm-yyyy'), '1:46', '6:58', 'Double Oak', 'EmilioCraven', 1119);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1740, to_date('08-05-2013', 'dd-mm-yyyy'), '14:53', '7:10', 'Rotterdam', 'VivicaMoriarty', 1182);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1741, to_date('08-04-2023', 'dd-mm-yyyy'), '0:33', '16:12', 'Koppl', 'DorryGatlin', 1125);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1742, to_date('26-10-2002', 'dd-mm-yyyy'), '17:38', '15:11', 'Sugar Land', 'WillAstin', 1256);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1743, to_date('02-04-2003', 'dd-mm-yyyy'), '22:54', '2:56', 'Archbold', 'MikeMraz', 1153);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1744, to_date('28-02-2015', 'dd-mm-yyyy'), '6:51', '14:21', 'Johor Bahru', 'WendyGoldwyn', 1290);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1745, to_date('12-06-2004', 'dd-mm-yyyy'), '4:12', '7:59', 'Wuerzburg', 'RosannaErmey', 1201);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1746, to_date('21-05-2001', 'dd-mm-yyyy'), '11:57', '3:27', 'Oxon', 'ConnieLeto', 1280);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1747, to_date('08-03-2022', 'dd-mm-yyyy'), '16:2', '2:6', 'Horb', 'SissyWopat', 1235);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1748, to_date('08-10-2004', 'dd-mm-yyyy'), '2:5', '12:4', 'Oklahoma city', 'MaryGlenn', 1254);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1749, to_date('01-09-2022', 'dd-mm-yyyy'), '17:57', '1:49', 'Glasgow', 'DonnaBale', 1153);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1750, to_date('24-03-2010', 'dd-mm-yyyy'), '9:36', '12:13', 'North Sydney', 'MickeyUnderwood', 1178);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1751, to_date('01-12-2013', 'dd-mm-yyyy'), '14:28', '10:29', 'Utrecht', 'OwenMeyer', 1230);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1752, to_date('12-12-2002', 'dd-mm-yyyy'), '2:59', '13:48', 'Kaiserslautern', 'RogerFuray', 1218);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1753, to_date('02-11-2013', 'dd-mm-yyyy'), '14:38', '23:31', 'Naestved', 'NoraRispoli', 1113);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1754, to_date('16-04-2015', 'dd-mm-yyyy'), '17:40', '20:34', 'Knoxville', 'ChaleeCollie', 1203);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1755, to_date('16-11-2022', 'dd-mm-yyyy'), '13:27', '16:4', 'Verdun', 'ChetSirtis', 1153);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1756, to_date('03-04-2005', 'dd-mm-yyyy'), '2:4', '12:24', 'Gävle', 'TreyFarris', 1240);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1757, to_date('15-11-2013', 'dd-mm-yyyy'), '3:33', '9:35', 'Edenbridge', 'BernieSylvian', 1211);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1758, to_date('12-01-2020', 'dd-mm-yyyy'), '8:46', '23:21', 'Utrecht', 'FreddyMoraz', 1285);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1759, to_date('04-05-2015', 'dd-mm-yyyy'), '14:35', '12:42', 'Lathrop', 'RebekaMcLachlan', 1146);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1760, to_date('29-10-2003', 'dd-mm-yyyy'), '3:5', '14:35', 'Oldham', 'SuzanneKennedy', 1303);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1761, to_date('16-06-2015', 'dd-mm-yyyy'), '7:18', '19:31', 'Linz', 'ChetSample', 1230);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1762, to_date('10-03-2007', 'dd-mm-yyyy'), '2:49', '19:24', 'Maarssen', 'HankWong', 1251);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1763, to_date('08-09-2004', 'dd-mm-yyyy'), '14:31', '15:35', 'Reading', 'MaryDelta', 1191);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1764, to_date('20-08-2007', 'dd-mm-yyyy'), '0:49', '3:23', 'Bingham Farms', 'AidaFraser', 1233);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1765, to_date('10-11-2015', 'dd-mm-yyyy'), '3:30', '17:6', 'Fleet', 'RalphBradford', 1264);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1766, to_date('20-01-2010', 'dd-mm-yyyy'), '10:27', '10:35', 'Sao jose rio preto', 'AdrienWinter', 1140);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1767, to_date('03-05-2017', 'dd-mm-yyyy'), '21:51', '21:26', 'Tsu', 'MarcValentin', 1178);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1768, to_date('28-06-2003', 'dd-mm-yyyy'), '20:18', '9:11', 'Zafferana Etnea', 'JavonHoward', 1168);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1769, to_date('24-07-2011', 'dd-mm-yyyy'), '0:17', '23:16', 'Research Triangle', 'LeoNielsen', 1178);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1770, to_date('12-07-2006', 'dd-mm-yyyy'), '7:16', '8:0', 'Ettlingen', 'RalphSupernaw', 1305);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1771, to_date('15-01-2014', 'dd-mm-yyyy'), '14:30', '18:51', 'Leipzig', 'LanceDafoe', 1254);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1772, to_date('16-05-2019', 'dd-mm-yyyy'), '5:49', '4:44', 'Ittigen', 'JodieShannon', 1210);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1773, to_date('06-10-2009', 'dd-mm-yyyy'), '8:9', '21:36', 'Virginia Beach', 'MintHopkins', 1169);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1774, to_date('28-08-2010', 'dd-mm-yyyy'), '15:9', '20:2', 'Maidenhead', 'TalHoliday', 1301);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1775, to_date('08-08-2002', 'dd-mm-yyyy'), '21:7', '15:52', 'Mississauga', 'DeanFerry', 1290);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1776, to_date('14-02-2017', 'dd-mm-yyyy'), '8:57', '10:27', 'East sussex', 'Jean-ClaudePaul', 1233);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1777, to_date('30-06-2020', 'dd-mm-yyyy'), '22:31', '12:29', 'Pusan', 'JuddGuilfoyle', 1116);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1778, to_date('05-03-2006', 'dd-mm-yyyy'), '9:44', '12:24', 'Ann Arbor', 'PattiKane', 1262);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1779, to_date('10-02-2016', 'dd-mm-yyyy'), '18:35', '2:39', 'Houston', 'JohnHenriksen', 1183);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1780, to_date('30-08-2017', 'dd-mm-yyyy'), '22:48', '20:18', 'Maceio', 'LiamO''Donnell', 1135);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1781, to_date('04-05-2007', 'dd-mm-yyyy'), '0:50', '9:42', 'Changwon-si', 'ChakaSevigny', 1287);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1782, to_date('18-10-2002', 'dd-mm-yyyy'), '0:19', '19:56', 'Storrington', 'LariRain', 1296);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1783, to_date('21-09-2018', 'dd-mm-yyyy'), '9:3', '23:44', 'Redmond', 'CarlaCleese', 1276);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1784, to_date('18-10-2019', 'dd-mm-yyyy'), '12:32', '17:31', 'Dardilly', 'MorganGates', 1131);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1785, to_date('08-06-2000', 'dd-mm-yyyy'), '23:1', '14:5', 'Köln', 'BoydReno', 1237);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1786, to_date('11-03-2017', 'dd-mm-yyyy'), '0:6', '6:53', 'Nanaimo', 'AlfiePosener', 1141);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1787, to_date('15-10-2013', 'dd-mm-yyyy'), '13:32', '21:57', 'Tucson', 'SamanthaCross', 1155);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1788, to_date('22-11-2003', 'dd-mm-yyyy'), '3:23', '2:44', 'Freising', 'RheaRamis', 1300);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1789, to_date('27-05-2017', 'dd-mm-yyyy'), '14:3', '0:55', 'Philadelphia', 'JudgeBalin', 1297);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1790, to_date('01-02-2005', 'dd-mm-yyyy'), '12:56', '23:52', 'Freiburg', 'SimonTennison', 1212);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1791, to_date('26-10-2018', 'dd-mm-yyyy'), '1:7', '5:16', 'Cincinnati', 'Mary BethScorsese', 1309);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1792, to_date('27-11-2000', 'dd-mm-yyyy'), '18:25', '0:4', 'Staten Island', 'SwoosieFiennes', 1161);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1793, to_date('05-07-2019', 'dd-mm-yyyy'), '11:54', '6:48', 'Mainz-kastel', 'GoranHarmon', 1200);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1794, to_date('02-03-2010', 'dd-mm-yyyy'), '8:24', '11:20', 'Freiburg', 'JudyJoli', 1182);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1795, to_date('05-09-2012', 'dd-mm-yyyy'), '10:9', '1:2', 'Santa Clarat', 'NikkiPlace', 1212);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1796, to_date('16-06-2016', 'dd-mm-yyyy'), '22:11', '12:2', 'Highlands Ranch', 'WillieGambon', 1133);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1797, to_date('04-09-2012', 'dd-mm-yyyy'), '20:47', '2:40', 'New orleans', 'ChristianOszajca', 1155);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1798, to_date('24-10-2004', 'dd-mm-yyyy'), '15:37', '9:39', 'Lowell', 'MikaCarradine', 1225);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1799, to_date('29-09-2009', 'dd-mm-yyyy'), '18:9', '8:21', 'Zwolle', 'WangWeiland', 1267);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1800, to_date('12-05-2022', 'dd-mm-yyyy'), '2:20', '23:43', 'Clark', 'BrentRydell', 1137);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1801, to_date('07-03-2008', 'dd-mm-yyyy'), '2:41', '1:20', 'Rio de janeiro', 'RhonaCarrere', 1158);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1802, to_date('18-12-2021', 'dd-mm-yyyy'), '12:52', '22:21', 'Kyunnam', 'GabrielleForster', 1157);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1803, to_date('14-11-2022', 'dd-mm-yyyy'), '17:50', '14:31', 'Thessaloniki', 'JaniceSandoval', 1222);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1804, to_date('24-06-2003', 'dd-mm-yyyy'), '11:56', '13:6', 'Köln', 'MikeCollins', 1270);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1805, to_date('17-04-2004', 'dd-mm-yyyy'), '11:16', '13:20', 'Fukui', 'JacksonGreen', 1139);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1806, to_date('18-02-2000', 'dd-mm-yyyy'), '8:27', '1:38', 'Horsham', 'HowieBergen', 1167);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1807, to_date('10-05-2002', 'dd-mm-yyyy'), '7:5', '10:54', 'Arlington', 'OssieCooper', 1173);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1808, to_date('01-11-2010', 'dd-mm-yyyy'), '13:19', '12:9', 'Kerava', 'AlessandroWeisz', 1171);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1809, to_date('25-09-2004', 'dd-mm-yyyy'), '3:47', '7:14', 'Oakland', 'TerenceBeals', 1147);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1810, to_date('30-03-2011', 'dd-mm-yyyy'), '5:47', '12:40', 'Royston', 'JulietteHornsby', 1111);
commit;
prompt 700 records committed...
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1811, to_date('22-10-2000', 'dd-mm-yyyy'), '4:28', '15:22', 'Birkenhead', 'JoaquimLineback', 1190);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1812, to_date('02-08-2003', 'dd-mm-yyyy'), '4:39', '13:25', 'Moscow', 'GeoffHatfield', 1156);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1813, to_date('23-12-2017', 'dd-mm-yyyy'), '20:34', '7:54', 'Bellevue', 'HankSkerritt', 1141);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1814, to_date('20-10-2020', 'dd-mm-yyyy'), '6:32', '7:1', 'Mexico City', 'FranceCotton', 1276);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1815, to_date('21-06-2011', 'dd-mm-yyyy'), '3:22', '20:40', 'Winterthur', 'NathanCurtis-Hall', 1137);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1816, to_date('27-06-2010', 'dd-mm-yyyy'), '3:45', '1:49', 'Sainte-foy', 'VingRodgers', 1137);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1817, to_date('10-03-2008', 'dd-mm-yyyy'), '12:12', '7:43', 'Almaty', 'PeaboHolden', 1208);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1818, to_date('03-06-2006', 'dd-mm-yyyy'), '1:54', '8:18', 'Boulogne', 'TyroneGalecki', 1190);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1819, to_date('25-04-2007', 'dd-mm-yyyy'), '14:11', '8:25', 'Meppel', 'TiaGoodman', 1282);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1820, to_date('08-02-2016', 'dd-mm-yyyy'), '10:40', '15:36', 'Bolton', 'HarveyBeatty', 1309);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1821, to_date('09-04-2007', 'dd-mm-yyyy'), '4:22', '10:11', 'Oakland', 'JuddKramer', 1285);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1822, to_date('29-03-2006', 'dd-mm-yyyy'), '10:11', '4:6', 'Dublin', 'PowersTorn', 1121);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1823, to_date('08-01-2019', 'dd-mm-yyyy'), '13:55', '6:58', 'Pensacola', 'AlexSarandon', 1196);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1824, to_date('04-04-2002', 'dd-mm-yyyy'), '20:26', '0:33', 'Edenbridge', 'HilarySossamon', 1127);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1825, to_date('15-05-2013', 'dd-mm-yyyy'), '0:9', '20:21', 'Jun-nam', 'JudgeNess', 1226);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1826, to_date('20-03-2020', 'dd-mm-yyyy'), '18:15', '6:1', 'Fornacette', 'RobinSpine', 1307);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1827, to_date('09-04-2022', 'dd-mm-yyyy'), '20:51', '22:44', 'Jun-nam', 'GarthCampbell', 1144);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1828, to_date('14-02-2006', 'dd-mm-yyyy'), '17:9', '22:33', 'Pandrup', 'LisaBogguss', 1286);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1829, to_date('05-11-2022', 'dd-mm-yyyy'), '1:35', '19:37', 'Pulheim-brauweiler', 'CoreyLogue', 1227);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1830, to_date('07-04-2014', 'dd-mm-yyyy'), '19:24', '7:15', 'Oldwick', 'BoydMann', 1176);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1831, to_date('21-05-2012', 'dd-mm-yyyy'), '22:24', '7:57', 'Shawnee', 'SanderPhillippe', 1196);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1832, to_date('25-12-2021', 'dd-mm-yyyy'), '7:53', '5:52', 'Rozenburg', 'AshleyBlaine', 1125);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1833, to_date('20-09-2007', 'dd-mm-yyyy'), '4:57', '8:52', 'Pompeia', 'MauraJohansson', 1149);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1834, to_date('07-03-2021', 'dd-mm-yyyy'), '22:28', '18:7', 'Barnegat', 'RonnyLizzy', 1207);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1835, to_date('14-03-2017', 'dd-mm-yyyy'), '4:2', '8:24', 'Elche', 'DianneLemmon', 1215);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1836, to_date('23-01-2000', 'dd-mm-yyyy'), '4:48', '2:44', 'Naha', 'RonnySteagall', 1237);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1837, to_date('11-11-2008', 'dd-mm-yyyy'), '22:6', '11:55', 'Reno', 'GabrielPollack', 1118);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1838, to_date('30-04-2009', 'dd-mm-yyyy'), '17:41', '1:27', 'Stony Point', 'EdgarTodd', 1159);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1839, to_date('14-06-2017', 'dd-mm-yyyy'), '14:11', '14:21', 'N. ft. Myers', 'MichelleMacIsaac', 1139);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1840, to_date('25-11-2002', 'dd-mm-yyyy'), '1:5', '23:56', 'Fredericia', 'HumbertoTorn', 1215);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1841, to_date('22-09-2015', 'dd-mm-yyyy'), '9:50', '13:58', 'Trenton', 'StanleyBright', 1254);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1842, to_date('25-09-2021', 'dd-mm-yyyy'), '4:48', '5:7', 'Hässleholm', 'VinChaykin', 1223);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1843, to_date('24-12-2014', 'dd-mm-yyyy'), '23:37', '4:0', 'Laguna Bbeach', 'MiraMacDowell', 1249);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1844, to_date('15-04-2011', 'dd-mm-yyyy'), '2:29', '18:16', 'Frankfurt', 'HankSledge', 1144);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1845, to_date('15-08-2000', 'dd-mm-yyyy'), '18:54', '3:54', 'Fuerth', 'SethParm', 1254);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1846, to_date('02-01-2018', 'dd-mm-yyyy'), '23:9', '12:58', 'Nanaimo', 'WilliamHeald', 1142);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1847, to_date('24-10-2021', 'dd-mm-yyyy'), '18:49', '10:31', 'Fukui', 'MarcMollard', 1144);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1848, to_date('18-07-2013', 'dd-mm-yyyy'), '5:5', '11:51', 'Cambridge', 'BonnieBassett', 1254);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1849, to_date('29-06-2017', 'dd-mm-yyyy'), '6:17', '1:56', 'Lund', 'GeorgeHarmon', 1191);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1850, to_date('03-12-2014', 'dd-mm-yyyy'), '10:19', '20:45', 'Meppel', 'IsaacEvanswood', 1215);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1851, to_date('31-12-2013', 'dd-mm-yyyy'), '14:36', '0:22', 'Kungki', 'NoraYankovic', 1215);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1852, to_date('04-04-2019', 'dd-mm-yyyy'), '14:35', '2:51', 'Kristiansand', 'RupertBranch', 1252);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1853, to_date('23-05-2020', 'dd-mm-yyyy'), '5:7', '9:53', 'Louisville', 'ElizabethDale', 1236);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1854, to_date('11-07-2023', 'dd-mm-yyyy'), '12:40', '4:4', 'Syracuse', 'TimothyDe Almeida', 1198);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1855, to_date('07-03-2013', 'dd-mm-yyyy'), '8:23', '9:22', 'Dardilly', 'MilesStuermer', 1156);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1856, to_date('29-05-2008', 'dd-mm-yyyy'), '16:14', '11:45', 'Monroe', 'MaureenCleese', 1215);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1857, to_date('17-12-2005', 'dd-mm-yyyy'), '4:21', '2:3', 'Budapest', 'DariusKweller', 1126);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1858, to_date('22-04-2001', 'dd-mm-yyyy'), '6:22', '3:32', 'San Jose', 'YaphetFrost', 1174);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1859, to_date('20-04-2012', 'dd-mm-yyyy'), '19:5', '0:17', 'Coslada', 'RicardoMarsden', 1254);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1860, to_date('22-11-2014', 'dd-mm-yyyy'), '7:11', '20:53', 'El Masnou', 'MiliAlexander', 1144);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1861, to_date('03-04-2016', 'dd-mm-yyyy'), '4:56', '9:44', 'Canberra', 'SophieDe Almeida', 1291);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1862, to_date('24-02-2010', 'dd-mm-yyyy'), '6:18', '16:43', 'Miyazaki', 'ParkerPesci', 1306);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1863, to_date('13-05-2016', 'dd-mm-yyyy'), '20:57', '9:44', 'Samrand', 'AlfredTucci', 1232);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1864, to_date('07-07-2018', 'dd-mm-yyyy'), '20:14', '3:18', 'Venice', 'JeroenBurns', 1305);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1865, to_date('28-04-2020', 'dd-mm-yyyy'), '2:46', '3:17', 'Angers', 'TemueraKweller', 1277);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1866, to_date('27-08-2011', 'dd-mm-yyyy'), '23:42', '6:9', 'Eschborn', 'EdgarPresley', 1127);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1867, to_date('26-05-2007', 'dd-mm-yyyy'), '20:22', '23:25', 'Denver', 'GenaPolley', 1148);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1868, to_date('31-03-2014', 'dd-mm-yyyy'), '10:35', '8:29', 'Oldenburg', 'ChubbyCox', 1238);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1869, to_date('25-09-2020', 'dd-mm-yyyy'), '10:31', '15:7', 'Luedenscheid', 'VendettaSteiger', 1124);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1870, to_date('07-01-2000', 'dd-mm-yyyy'), '15:36', '1:45', 'Bloemfontein', 'GeggyDouglas', 1181);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1871, to_date('10-11-2012', 'dd-mm-yyyy'), '12:4', '9:31', 'Cerritos', 'ChubbyPollack', 1227);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1872, to_date('03-11-2018', 'dd-mm-yyyy'), '10:33', '3:14', 'Fukushima', 'RosieGeldof', 1256);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1873, to_date('08-10-2018', 'dd-mm-yyyy'), '16:21', '2:58', 'Morioka', 'PhilHenstridge', 1282);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1874, to_date('28-01-2017', 'dd-mm-yyyy'), '0:48', '10:10', 'Campinas', 'IanStoltz', 1186);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1875, to_date('04-07-2020', 'dd-mm-yyyy'), '4:42', '19:35', 'Amherst', 'EugeneQuinlan', 1224);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1876, to_date('25-05-2022', 'dd-mm-yyyy'), '7:52', '10:58', 'Butner', 'DeniseFrampton', 1127);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1877, to_date('09-05-2023', 'dd-mm-yyyy'), '20:41', '4:1', 'Cambridge', 'AvengedArmstrong', 1196);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1878, to_date('16-08-2015', 'dd-mm-yyyy'), '20:30', '5:12', 'Eschen', 'PeteLunch', 1175);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1879, to_date('30-05-2006', 'dd-mm-yyyy'), '22:46', '19:41', 'Dreieich', 'BebeShepherd', 1189);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1880, to_date('23-01-2019', 'dd-mm-yyyy'), '1:3', '12:10', 'Campinas', 'JuniorProwse', 1223);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1881, to_date('27-12-2008', 'dd-mm-yyyy'), '7:19', '4:47', 'Bernex', 'AlecOverstreet', 1306);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1882, to_date('25-09-2008', 'dd-mm-yyyy'), '21:51', '0:18', 'Warrington', 'MichelleScheider', 1198);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1883, to_date('26-10-2014', 'dd-mm-yyyy'), '13:3', '19:38', 'Ft. Lauderdale', 'LloydNewton', 1267);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1884, to_date('09-02-2001', 'dd-mm-yyyy'), '12:30', '17:40', 'Toledo', 'MickyMcCann', 1173);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1885, to_date('19-07-2020', 'dd-mm-yyyy'), '3:47', '23:30', 'Seoul', 'BrothersMatthau', 1171);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1886, to_date('31-08-2003', 'dd-mm-yyyy'), '6:54', '14:37', 'Colombo', 'DanniWolf', 1123);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1887, to_date('29-06-2011', 'dd-mm-yyyy'), '8:45', '21:12', 'Dresden', 'JamieTaha', 1157);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1888, to_date('01-12-2015', 'dd-mm-yyyy'), '10:21', '12:26', 'Waalwijk', 'AprilDiesel', 1228);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1889, to_date('21-04-2022', 'dd-mm-yyyy'), '3:0', '8:9', 'Redmond', 'WayneDavidson', 1165);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1890, to_date('22-05-2021', 'dd-mm-yyyy'), '21:52', '2:2', 'Nashua', 'VendettaJohansen', 1308);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1891, to_date('26-08-2001', 'dd-mm-yyyy'), '10:15', '11:2', 'Cannock', 'BrittanyDrive', 1264);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1892, to_date('01-08-2007', 'dd-mm-yyyy'), '5:56', '9:45', 'Schenectady', 'AlfieMelvin', 1138);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1893, to_date('23-04-2019', 'dd-mm-yyyy'), '22:44', '6:29', 'Munich', 'EdwinFehr', 1186);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1894, to_date('01-07-2014', 'dd-mm-yyyy'), '20:7', '1:55', 'Jacksonville', 'RheaWheel', 1227);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1895, to_date('12-06-2010', 'dd-mm-yyyy'), '22:29', '7:34', 'Madrid', 'BretHolmes', 1123);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1896, to_date('06-10-2017', 'dd-mm-yyyy'), '9:37', '4:13', 'Dietikon', 'KennyProwse', 1129);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1897, to_date('27-05-2011', 'dd-mm-yyyy'), '3:49', '14:43', 'Warrenton', 'OwenGlenn', 1228);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1898, to_date('14-05-2013', 'dd-mm-yyyy'), '5:32', '12:46', 'Sulzbach', 'LeaStone', 1219);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1899, to_date('22-12-2014', 'dd-mm-yyyy'), '21:1', '15:12', 'Rozenburg', 'EddieZahn', 1176);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1900, to_date('22-01-2023', 'dd-mm-yyyy'), '12:46', '5:1', 'Lakeville', 'TrickMcKellen', 1135);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1901, to_date('09-11-2005', 'dd-mm-yyyy'), '18:30', '1:46', 'Carlsbad', 'AlexDzundza', 1307);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1902, to_date('09-04-2006', 'dd-mm-yyyy'), '14:6', '1:59', 'Rueil-Malmaison', 'GladysMoody', 1291);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1903, to_date('04-01-2013', 'dd-mm-yyyy'), '14:22', '13:19', 'Edenbridge', 'EdMewes', 1154);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1904, to_date('22-01-2000', 'dd-mm-yyyy'), '21:33', '5:52', 'Glen allen', 'JacksonFlanery', 1257);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1905, to_date('07-03-2016', 'dd-mm-yyyy'), '5:3', '1:0', 'St. Petersburg', 'SigourneyFranks', 1211);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1906, to_date('27-08-2023', 'dd-mm-yyyy'), '20:8', '5:32', 'Parsippany', 'Carrie-AnneHeslov', 1121);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1907, to_date('25-09-2008', 'dd-mm-yyyy'), '21:18', '13:46', 'Crete', 'LindsayGreene', 1238);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1908, to_date('09-01-2010', 'dd-mm-yyyy'), '5:7', '12:26', 'Shreveport', 'MarkLaws', 1142);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1909, to_date('02-07-2005', 'dd-mm-yyyy'), '4:19', '6:9', 'Prague', 'RichardCrouch', 1131);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1910, to_date('06-02-2022', 'dd-mm-yyyy'), '20:19', '19:51', 'Cobham', 'VondaSawa', 1240);
commit;
prompt 800 records committed...
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1911, to_date('18-06-2014', 'dd-mm-yyyy'), '16:40', '13:22', 'Bingham Farms', 'BruceKravitz', 1230);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1912, to_date('31-01-2018', 'dd-mm-yyyy'), '13:6', '0:31', 'Oak park', 'EdgarChappelle', 1232);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1913, to_date('26-09-2005', 'dd-mm-yyyy'), '20:6', '14:45', 'Ilmenau', 'RoscoeMolina', 1149);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1914, to_date('02-05-2006', 'dd-mm-yyyy'), '6:38', '18:21', 'Burgess Hill', 'JulieDench', 1283);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1915, to_date('22-01-2023', 'dd-mm-yyyy'), '13:57', '18:23', 'Waldorf', 'DianneKeeslar', 1245);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1916, to_date('09-04-2022', 'dd-mm-yyyy'), '14:20', '7:8', 'Pearland', 'CarrieMasur', 1305);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1917, to_date('27-04-2004', 'dd-mm-yyyy'), '1:47', '0:22', 'Brentwood', 'AmandaSoda', 1158);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1918, to_date('19-07-2002', 'dd-mm-yyyy'), '3:23', '10:6', 'Yucca', 'HaroldPlatt', 1156);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1919, to_date('06-12-2020', 'dd-mm-yyyy'), '23:20', '19:6', 'Toyama', 'WallySewell', 1147);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1920, to_date('05-11-2012', 'dd-mm-yyyy'), '21:44', '10:10', 'Albuquerque', 'SpencerFreeman', 1248);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1921, to_date('08-02-2023', 'dd-mm-yyyy'), '2:56', '10:1', 'Saint-vincent-de-dur', 'LonnieWheel', 1224);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1922, to_date('26-12-2007', 'dd-mm-yyyy'), '21:7', '9:32', 'Adelaide', 'AvengedPlowright', 1191);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1923, to_date('28-12-2020', 'dd-mm-yyyy'), '7:42', '11:8', 'Wilmington', 'ColeyRoundtree', 1300);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1924, to_date('05-05-2008', 'dd-mm-yyyy'), '21:29', '6:18', 'Mumbai', 'ChristineMason', 1258);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1925, to_date('06-10-2019', 'dd-mm-yyyy'), '17:27', '1:57', 'Koufu', 'RhettArquette', 1295);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1926, to_date('25-01-2016', 'dd-mm-yyyy'), '8:0', '0:56', 'Coburg', 'BalthazarEmmerich', 1237);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1927, to_date('24-06-2007', 'dd-mm-yyyy'), '1:43', '2:6', 'Toledo', 'MarcArkenstone', 1185);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1928, to_date('03-06-2018', 'dd-mm-yyyy'), '4:47', '19:39', 'Oberwangen', 'BradleyChecker', 1157);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1929, to_date('02-06-2015', 'dd-mm-yyyy'), '19:4', '16:45', 'Hochwald', 'RawlinsRoundtree', 1168);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1930, to_date('17-10-2011', 'dd-mm-yyyy'), '14:21', '2:31', 'Bedfordshire', 'SigourneyGallagher', 1302);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1931, to_date('03-11-2022', 'dd-mm-yyyy'), '16:1', '4:30', 'Mount Laurel', 'BerniePollack', 1222);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1932, to_date('31-07-2000', 'dd-mm-yyyy'), '7:6', '1:30', 'Aiken', 'IkeSerbedzija', 1284);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1933, to_date('06-11-2003', 'dd-mm-yyyy'), '7:26', '19:34', 'Milano', 'DeniseGunton', 1230);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1934, to_date('28-03-2004', 'dd-mm-yyyy'), '13:24', '18:13', 'Salvador', 'KatrinSoda', 1192);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1935, to_date('18-10-2015', 'dd-mm-yyyy'), '19:35', '5:48', 'Fremont', 'SimonWinstone', 1309);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1936, to_date('23-08-2006', 'dd-mm-yyyy'), '12:33', '19:52', 'Telford', 'VinLemmon', 1216);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1937, to_date('21-09-2023', 'dd-mm-yyyy'), '0:22', '4:52', 'Nagoya', 'JudiMcDonnell', 1133);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1938, to_date('07-04-2023', 'dd-mm-yyyy'), '9:48', '11:23', 'Cerritos', 'SwoosieKlugh', 1251);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1939, to_date('25-05-2017', 'dd-mm-yyyy'), '7:6', '12:57', 'Lake Oswego', 'JuicePreston', 1293);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1940, to_date('24-10-2017', 'dd-mm-yyyy'), '7:1', '22:21', 'Santa Clarita', 'MattReid', 1126);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1941, to_date('11-05-2007', 'dd-mm-yyyy'), '5:47', '13:44', 'Billerica', 'JohnetteReed', 1116);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1942, to_date('28-08-2014', 'dd-mm-yyyy'), '12:8', '12:10', 'New hartford', 'JoaquimShawn', 1292);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1943, to_date('16-12-2021', 'dd-mm-yyyy'), '16:8', '10:48', 'Cedar Park', 'JodieVan Der Beek', 1303);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1944, to_date('26-02-2015', 'dd-mm-yyyy'), '23:48', '9:15', 'Sulzbach', 'ThinQuinn', 1295);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1945, to_date('30-04-2014', 'dd-mm-yyyy'), '7:48', '13:28', 'Coppell', 'MarcMarshall', 1213);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1946, to_date('29-08-2010', 'dd-mm-yyyy'), '6:14', '13:30', 'Itu', 'AlfredPrinze', 1184);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1947, to_date('03-10-2022', 'dd-mm-yyyy'), '21:39', '8:41', 'Englewood Cliffs', 'RichieBryson', 1273);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1948, to_date('31-07-2009', 'dd-mm-yyyy'), '13:19', '18:35', 'Southend on Sea', 'DianeMoorer', 1167);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1949, to_date('29-12-2009', 'dd-mm-yyyy'), '1:49', '12:43', 'Sale', 'AllanMewes', 1120);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1950, to_date('09-04-2005', 'dd-mm-yyyy'), '17:8', '14:39', 'Novara', 'LucySledge', 1209);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1951, to_date('06-12-2011', 'dd-mm-yyyy'), '9:25', '1:28', 'Toronto', 'MiguelGarner', 1114);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1952, to_date('27-09-2004', 'dd-mm-yyyy'), '20:55', '10:55', 'Venice', 'NoahIngram', 1298);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1953, to_date('16-04-2020', 'dd-mm-yyyy'), '22:8', '10:41', 'Traralgon', 'NinaLewis', 1191);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1954, to_date('07-01-2004', 'dd-mm-yyyy'), '18:29', '0:15', 'Spring City', 'JohnetteRomijn-Stamos', 1195);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1955, to_date('18-02-2007', 'dd-mm-yyyy'), '19:56', '16:16', 'Pitstone', 'DaryleRowlands', 1168);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1956, to_date('30-10-2016', 'dd-mm-yyyy'), '6:21', '23:18', 'Anchorage', 'CledusDevine', 1112);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1957, to_date('25-01-2016', 'dd-mm-yyyy'), '15:10', '22:5', 'Biel', 'MoeSlater', 1148);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1958, to_date('04-07-2021', 'dd-mm-yyyy'), '7:35', '14:20', 'Rtp', 'KingMetcalf', 1291);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1959, to_date('04-12-2020', 'dd-mm-yyyy'), '3:37', '12:49', 'Minneapolis', 'ScarlettKeitel', 1310);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1960, to_date('23-07-2013', 'dd-mm-yyyy'), '21:56', '19:44', 'Buffalo', 'RitaJohansen', 1156);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1961, to_date('15-03-2000', 'dd-mm-yyyy'), '14:13', '2:43', 'Hyderabad', 'ElijahBeck', 1170);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1962, to_date('07-12-2008', 'dd-mm-yyyy'), '23:33', '5:36', 'Bellerose', 'LarnelleTobolowsky', 1289);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1963, to_date('06-09-2010', 'dd-mm-yyyy'), '18:14', '19:51', 'Balmoral', 'SydneyMurphy', 1223);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1964, to_date('01-03-2023', 'dd-mm-yyyy'), '1:32', '5:5', 'Vaduz', 'RitaEastwood', 1192);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1965, to_date('19-04-2022', 'dd-mm-yyyy'), '5:15', '3:5', 'Chambersburg', 'AlanaPerrineau', 1235);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1966, to_date('18-07-2018', 'dd-mm-yyyy'), '17:40', '6:33', 'Carlsbad', 'AndrewVassar', 1136);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1967, to_date('05-11-2020', 'dd-mm-yyyy'), '7:11', '6:25', 'Grapevine', 'DermotMoffat', 1185);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1968, to_date('08-07-2019', 'dd-mm-yyyy'), '11:27', '9:30', 'Newcastle upon Tyne', 'BretNolte', 1282);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1969, to_date('01-10-2012', 'dd-mm-yyyy'), '21:9', '10:8', 'Bozeman', 'SuzanneNeil', 1121);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1970, to_date('28-08-2020', 'dd-mm-yyyy'), '16:10', '5:27', 'St Jean de Soudain', 'CleaMyles', 1307);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1971, to_date('26-09-2015', 'dd-mm-yyyy'), '18:0', '18:24', 'Montréal', 'CarlReeves', 1117);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1972, to_date('01-03-2009', 'dd-mm-yyyy'), '9:47', '14:23', 'Madrid', 'WarrenRussell', 1211);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1973, to_date('21-11-2021', 'dd-mm-yyyy'), '9:18', '11:19', 'Hampton', 'LloydSmurfit', 1224);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1974, to_date('02-03-2022', 'dd-mm-yyyy'), '2:12', '12:37', 'Wehrheim', 'RayMcGregor', 1139);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1975, to_date('03-09-2013', 'dd-mm-yyyy'), '13:44', '2:41', 'Alcobendas', 'SanderLoggins', 1306);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1976, to_date('04-01-2007', 'dd-mm-yyyy'), '13:7', '7:9', 'Lecanto', 'GatesBorgnine', 1238);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1977, to_date('29-06-2011', 'dd-mm-yyyy'), '1:18', '19:51', 'Salt Lake City', 'SuzanneShannon', 1171);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1978, to_date('11-01-2022', 'dd-mm-yyyy'), '18:17', '19:31', 'Crete', 'SigourneyFender', 1196);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1979, to_date('25-11-2001', 'dd-mm-yyyy'), '2:18', '7:26', 'Paço de Arcos', 'JimDe Niro', 1193);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1980, to_date('09-08-2023', 'dd-mm-yyyy'), '15:41', '0:34', 'Saint Paul', 'AndieSartain', 1290);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1981, to_date('16-10-2013', 'dd-mm-yyyy'), '9:38', '17:57', 'Happy Valley', 'CatherineBelle', 1175);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1982, to_date('01-10-2007', 'dd-mm-yyyy'), '18:18', '18:31', 'Market Harborough', 'MickyLipnicki', 1256);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1983, to_date('03-02-2018', 'dd-mm-yyyy'), '18:41', '7:42', 'Germantown', 'AaronBloch', 1249);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1984, to_date('20-02-2001', 'dd-mm-yyyy'), '1:40', '4:18', 'Trento', 'RheaNortham', 1118);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1985, to_date('06-12-2022', 'dd-mm-yyyy'), '4:32', '6:36', 'Rorschach', 'DennyAdams', 1217);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1986, to_date('19-10-2017', 'dd-mm-yyyy'), '20:50', '12:12', 'San Antonio', 'RosannaRock', 1201);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1987, to_date('19-05-2009', 'dd-mm-yyyy'), '13:18', '11:48', 'Santa Cruz', 'BurtonBuckingham', 1189);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1988, to_date('02-06-2010', 'dd-mm-yyyy'), '6:35', '16:22', 'Bradenton', 'Mary BethDavidtz', 1128);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1989, to_date('18-07-2004', 'dd-mm-yyyy'), '12:45', '0:35', 'Maebashi', 'GloriaWainwright', 1299);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1990, to_date('08-07-2015', 'dd-mm-yyyy'), '12:22', '2:29', 'Kreuzau', 'JonnyKweller', 1233);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1991, to_date('22-04-2004', 'dd-mm-yyyy'), '7:40', '21:34', 'Malmö', 'MichelleJudd', 1254);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1992, to_date('15-01-2021', 'dd-mm-yyyy'), '6:49', '4:49', 'Pirmasens', 'DylanGrier', 1249);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1993, to_date('27-08-2018', 'dd-mm-yyyy'), '14:45', '2:25', 'Santa Clarita', 'RickBlair', 1237);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1994, to_date('07-05-2002', 'dd-mm-yyyy'), '20:10', '12:5', 'Fuchstal-asch', 'DevonTeng', 1113);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1995, to_date('15-04-2020', 'dd-mm-yyyy'), '8:9', '0:42', 'Chemnitz', 'CaroleRichardson', 1252);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1996, to_date('12-05-2018', 'dd-mm-yyyy'), '21:45', '9:5', 'Hilton', 'SeannLillard', 1207);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1997, to_date('27-09-2017', 'dd-mm-yyyy'), '13:26', '5:4', 'Bollensen', 'LarryVanian', 1158);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1998, to_date('17-03-2013', 'dd-mm-yyyy'), '6:21', '22:12', 'Elche', 'HoraceNelson', 1255);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (1999, to_date('10-04-2021', 'dd-mm-yyyy'), '6:26', '13:22', 'Perth', 'HiltonBenoit', 1309);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2000, to_date('19-03-2007', 'dd-mm-yyyy'), '4:48', '21:43', 'London', 'MorganDavis', 1166);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2001, to_date('25-10-2013', 'dd-mm-yyyy'), '21:28', '0:37', 'Trieste', 'DorryCeasar', 1252);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2002, to_date('26-01-2002', 'dd-mm-yyyy'), '11:21', '14:9', 'Pirapora bom Jesus', 'DenzelIrving', 1230);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2003, to_date('27-03-2005', 'dd-mm-yyyy'), '1:12', '2:54', 'Ittigen', 'KatrinCarrere', 1125);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2004, to_date('27-11-2020', 'dd-mm-yyyy'), '4:55', '20:15', 'Huntsville', 'JoyOntiveros', 1235);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2005, to_date('07-12-2020', 'dd-mm-yyyy'), '14:33', '11:36', 'California', 'AliDanes', 1283);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2006, to_date('08-05-2001', 'dd-mm-yyyy'), '14:53', '12:17', 'Fambach', 'MintReubens', 1135);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2007, to_date('09-08-2003', 'dd-mm-yyyy'), '4:1', '2:37', 'Oosterhout', 'ChaleeSewell', 1190);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2008, to_date('16-02-2009', 'dd-mm-yyyy'), '8:19', '5:39', 'Portsmouth', 'ElleFarina', 1162);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2009, to_date('17-09-2022', 'dd-mm-yyyy'), '21:2', '15:53', 'Media', 'DerrickCollie', 1238);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2010, to_date('24-10-2010', 'dd-mm-yyyy'), '4:32', '11:41', 'Gaithersburg', 'AimeeLeachman', 1272);
commit;
prompt 900 records committed...
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2011, to_date('21-08-2001', 'dd-mm-yyyy'), '22:35', '1:37', 'Bedfordshire', 'JoshuaGibbons', 1284);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2012, to_date('03-11-2022', 'dd-mm-yyyy'), '20:14', '17:47', 'Oshawa', 'WayneRedgrave', 1305);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2013, to_date('29-12-2001', 'dd-mm-yyyy'), '21:14', '7:42', 'Bountiful', 'VincentAlda', 1209);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2014, to_date('18-09-2001', 'dd-mm-yyyy'), '8:32', '6:36', 'Uden', 'CarolSerbedzija', 1292);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2015, to_date('20-11-2004', 'dd-mm-yyyy'), '3:52', '8:14', 'N. ft. Myers', 'OwenRuiz', 1221);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2016, to_date('24-04-2007', 'dd-mm-yyyy'), '17:18', '17:50', 'Lake Oswego', 'ElleFiorentino', 1240);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2017, to_date('27-07-2012', 'dd-mm-yyyy'), '11:36', '16:30', 'Bischofshofen', 'LizzyNavarro', 1225);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2018, to_date('16-06-2015', 'dd-mm-yyyy'), '18:48', '15:5', 'Bretzfeld-Waldbach', 'CeiliGambon', 1270);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2019, to_date('12-08-2001', 'dd-mm-yyyy'), '23:12', '19:57', 'Syracuse', 'PeteHatfield', 1297);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2020, to_date('04-01-2005', 'dd-mm-yyyy'), '17:53', '18:20', 'Fort gordon', 'SelmaHirsch', 1268);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2021, to_date('21-10-2015', 'dd-mm-yyyy'), '16:0', '5:50', 'Stuttgart', 'KathleenLeary', 1119);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2022, to_date('10-06-2005', 'dd-mm-yyyy'), '10:32', '20:4', 'Maceio', 'NikConway', 1199);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2023, to_date('06-09-2004', 'dd-mm-yyyy'), '21:21', '2:40', 'Brookfield', 'LauraBailey', 1131);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2024, to_date('17-01-2021', 'dd-mm-yyyy'), '20:6', '14:34', 'Glasgow', 'PeaboPostlethwaite', 1167);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2025, to_date('10-02-2019', 'dd-mm-yyyy'), '23:55', '15:28', 'San Francisco', 'PenelopePostlethwaite', 1252);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2026, to_date('11-04-2018', 'dd-mm-yyyy'), '23:42', '13:45', 'Tustin', 'MarieZahn', 1111);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2027, to_date('10-09-2017', 'dd-mm-yyyy'), '4:31', '16:13', 'Lublin', 'BrittanyDench', 1126);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2028, to_date('01-05-2011', 'dd-mm-yyyy'), '22:2', '8:25', 'St. Petersburg', 'MelanieHenstridge', 1264);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2029, to_date('10-02-2017', 'dd-mm-yyyy'), '21:25', '12:39', 'Bologna', 'GordieNewton', 1190);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2030, to_date('16-09-2021', 'dd-mm-yyyy'), '3:50', '22:27', 'Conshohocken', 'JoeBrickell', 1137);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2031, to_date('21-03-2008', 'dd-mm-yyyy'), '22:41', '8:4', 'Juneau', 'ArtLeoni', 1205);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2032, to_date('13-09-2015', 'dd-mm-yyyy'), '23:17', '17:45', 'Natal', 'KelliBoone', 1263);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2033, to_date('19-06-2019', 'dd-mm-yyyy'), '14:35', '6:9', 'Warszawa', 'JuanJenkins', 1228);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2034, to_date('10-08-2023', 'dd-mm-yyyy'), '19:7', '0:2', 'Crete', 'AlbertPostlethwaite', 1283);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2035, to_date('23-05-2017', 'dd-mm-yyyy'), '23:20', '9:16', 'Melrose', 'IsaiahMacPherson', 1195);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2036, to_date('03-05-2003', 'dd-mm-yyyy'), '9:7', '10:12', 'Cobham', 'TeaDriver', 1292);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2037, to_date('30-12-2013', 'dd-mm-yyyy'), '21:25', '16:45', 'Soroe', 'BebeKnight', 1147);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2038, to_date('20-07-2000', 'dd-mm-yyyy'), '8:25', '20:39', 'Alcobendas', 'RebeccaWine', 1174);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2039, to_date('04-03-2013', 'dd-mm-yyyy'), '6:33', '20:55', 'Wien', 'JonathaIrons', 1214);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2040, to_date('30-07-2022', 'dd-mm-yyyy'), '22:31', '14:58', 'Barueri', 'LukePalmieri', 1208);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2041, to_date('09-10-2011', 'dd-mm-yyyy'), '9:27', '19:3', 'Pointe-claire', 'FredSupernaw', 1201);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2042, to_date('28-09-2000', 'dd-mm-yyyy'), '13:32', '15:32', 'Ebersdorf', 'DonalUggams', 1217);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2043, to_date('08-06-2001', 'dd-mm-yyyy'), '0:34', '21:59', 'Albany', 'MerylKimball', 1242);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2044, to_date('04-02-2022', 'dd-mm-yyyy'), '7:0', '13:28', 'St. Petersburg', 'MinnieWagner', 1183);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2045, to_date('28-02-2004', 'dd-mm-yyyy'), '17:52', '18:5', 'Saudarkrokur', 'NickCage', 1296);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2046, to_date('11-09-2012', 'dd-mm-yyyy'), '23:13', '22:18', 'Mexico City', 'BebeWeber', 1279);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2047, to_date('01-08-2013', 'dd-mm-yyyy'), '21:15', '11:55', 'Padova', 'NeveLapointe', 1168);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2048, to_date('15-02-2003', 'dd-mm-yyyy'), '2:9', '3:45', 'Lund', 'KevnDavidson', 1187);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2049, to_date('05-04-2014', 'dd-mm-yyyy'), '20:58', '12:58', 'Santa Clarita', 'VanessaPollack', 1137);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2050, to_date('23-02-2013', 'dd-mm-yyyy'), '3:17', '3:29', 'Rimini', 'LionelSevigny', 1237);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2051, to_date('07-12-2006', 'dd-mm-yyyy'), '21:45', '11:9', 'Belgrad', 'ElvisSanta Rosa', 1228);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2052, to_date('05-09-2016', 'dd-mm-yyyy'), '16:42', '13:7', 'Visselhövede', 'LeslieCeasar', 1193);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2053, to_date('28-02-2011', 'dd-mm-yyyy'), '18:53', '3:52', 'Akita', 'TaraRobards', 1240);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2054, to_date('28-05-2002', 'dd-mm-yyyy'), '0:13', '19:14', 'Fort Lee', 'LesleyDuke', 1141);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2055, to_date('14-07-2001', 'dd-mm-yyyy'), '8:46', '3:23', 'Bristol', 'KarenBoyle', 1168);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2056, to_date('09-03-2006', 'dd-mm-yyyy'), '0:30', '1:19', 'Coslada', 'JackieKahn', 1290);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2057, to_date('22-07-2019', 'dd-mm-yyyy'), '8:19', '18:15', 'Birmensdorf', 'GilbertoDolenz', 1226);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2058, to_date('25-11-2022', 'dd-mm-yyyy'), '22:23', '2:58', 'Tucson', 'NicholasReed', 1286);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2059, to_date('23-02-2020', 'dd-mm-yyyy'), '20:57', '7:17', 'Maryville', 'AnnaKrieger', 1226);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2060, to_date('01-09-2007', 'dd-mm-yyyy'), '3:12', '0:38', 'Coimbra', 'ThomasTeng', 1166);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2061, to_date('22-11-2016', 'dd-mm-yyyy'), '23:29', '13:36', 'East Peoria', 'BobFox', 1251);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2062, to_date('15-04-2000', 'dd-mm-yyyy'), '4:36', '4:16', 'Groton', 'MirandaCagle', 1175);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2063, to_date('04-09-2000', 'dd-mm-yyyy'), '3:34', '1:11', 'Maidstone', 'RobertOlin', 1237);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2064, to_date('21-12-2000', 'dd-mm-yyyy'), '17:7', '1:20', 'Spring Valley', 'NightMerchant', 1305);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2065, to_date('04-07-2002', 'dd-mm-yyyy'), '7:5', '3:48', 'League city', 'TalvinEdmunds', 1142);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2066, to_date('30-03-2009', 'dd-mm-yyyy'), '20:1', '2:5', 'Mogliano Veneto', 'HarrietValentin', 1242);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2067, to_date('27-05-2007', 'dd-mm-yyyy'), '13:54', '2:49', 'Eindhoven', 'RichardTucker', 1279);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2068, to_date('23-09-2014', 'dd-mm-yyyy'), '1:53', '21:27', 'Gävle', 'MaxineBosco', 1122);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2069, to_date('08-05-2005', 'dd-mm-yyyy'), '7:56', '14:48', 'Mayfield Village', 'NoahBerenger', 1199);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2070, to_date('21-11-2022', 'dd-mm-yyyy'), '11:57', '13:32', 'Cincinnati', 'KimberlyEpps', 1172);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2071, to_date('08-03-2012', 'dd-mm-yyyy'), '18:27', '16:59', 'Udine', 'RutgerTobolowsky', 1251);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2072, to_date('09-09-2022', 'dd-mm-yyyy'), '12:12', '20:21', 'Riverdale', 'NicholasBurton', 1128);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2073, to_date('14-05-2016', 'dd-mm-yyyy'), '23:13', '3:23', 'Toronto', 'BurtonHannah', 1228);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2074, to_date('03-04-2021', 'dd-mm-yyyy'), '12:7', '15:22', 'Coldmeece', 'LizzyBachman', 1296);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2075, to_date('20-05-2005', 'dd-mm-yyyy'), '1:29', '17:59', 'Bad Oeynhausen', 'RawlinsRockwell', 1156);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2076, to_date('24-08-2007', 'dd-mm-yyyy'), '21:19', '21:6', 'Virginia Beach', 'BurtGracie', 1130);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2077, to_date('11-10-2023', 'dd-mm-yyyy'), '13:11', '18:39', 'Philadelphia', 'BrentIdol', 1286);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2078, to_date('09-05-2008', 'dd-mm-yyyy'), '9:42', '16:18', 'Salvador', 'HexSingh', 1303);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2079, to_date('02-09-2022', 'dd-mm-yyyy'), '20:21', '8:48', 'Stanford', 'PattiKenoly', 1261);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2080, to_date('07-06-2022', 'dd-mm-yyyy'), '7:16', '22:18', 'Thames Ditton', 'DebbieCole', 1122);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2081, to_date('03-04-2002', 'dd-mm-yyyy'), '10:36', '2:2', 'Saitama', 'ChrisMoorer', 1290);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2082, to_date('10-01-2011', 'dd-mm-yyyy'), '18:41', '1:53', 'Riverdale', 'NilsConnery', 1295);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2083, to_date('04-03-2017', 'dd-mm-yyyy'), '6:58', '4:21', 'Soroe', 'KieranMiller', 1275);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2084, to_date('19-05-2017', 'dd-mm-yyyy'), '22:54', '0:29', 'Chiba', 'NikkaNapolitano', 1222);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2085, to_date('24-04-2002', 'dd-mm-yyyy'), '22:24', '19:53', 'Wichita', 'KylieHenstridge', 1228);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2086, to_date('31-01-2020', 'dd-mm-yyyy'), '17:37', '8:31', 'Horsens', 'HugoArmstrong', 1260);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2087, to_date('29-10-2021', 'dd-mm-yyyy'), '11:25', '8:57', 'Mablethorpe', 'LaurieMacIsaac', 1284);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2088, to_date('14-08-2009', 'dd-mm-yyyy'), '2:48', '4:9', 'Wakayama', 'LupeColeman', 1152);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2089, to_date('17-04-2011', 'dd-mm-yyyy'), '15:18', '21:42', 'Sainte-foy', 'GoldieMcIntosh', 1193);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2090, to_date('26-11-2018', 'dd-mm-yyyy'), '17:24', '20:41', 'Holts Summit', 'KurtPerry', 1146);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2091, to_date('15-07-2006', 'dd-mm-yyyy'), '23:36', '23:38', 'Oldwick', 'IkeConroy', 1175);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2092, to_date('15-01-2020', 'dd-mm-yyyy'), '19:56', '15:1', 'Claymont', 'ZooeyMichaels', 1224);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2093, to_date('24-04-2022', 'dd-mm-yyyy'), '0:59', '2:44', 'Billerica', 'DanielWheel', 1193);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2094, to_date('15-07-2006', 'dd-mm-yyyy'), '15:2', '4:13', 'San Dimas', 'CornellKennedy', 1280);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2095, to_date('25-03-2019', 'dd-mm-yyyy'), '0:55', '2:35', 'Paço de Arcos', 'NikMcAnally', 1111);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2096, to_date('05-01-2023', 'dd-mm-yyyy'), '14:34', '19:1', 'Kuraby', 'ScarlettBryson', 1293);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2097, to_date('03-07-2021', 'dd-mm-yyyy'), '13:34', '3:9', 'Istanbul', 'KayJoli', 1189);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2098, to_date('02-08-2007', 'dd-mm-yyyy'), '22:9', '8:43', 'Stocksbridge', 'JuddBrothers', 1191);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2099, to_date('25-06-2010', 'dd-mm-yyyy'), '10:20', '12:44', 'New Castle', 'FirstManning', 1180);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2100, to_date('26-03-2003', 'dd-mm-yyyy'), '7:53', '15:36', 'Bautzen', 'CheechDiCaprio', 1220);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2101, to_date('20-09-2016', 'dd-mm-yyyy'), '22:42', '2:42', 'Munich', 'MarieImbruglia', 1232);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2102, to_date('17-11-2016', 'dd-mm-yyyy'), '15:32', '11:1', 'Bristol', 'GeggyBurns', 1223);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2103, to_date('30-12-2020', 'dd-mm-yyyy'), '15:37', '1:50', 'New hartford', 'NedPfeiffer', 1121);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2104, to_date('01-01-2017', 'dd-mm-yyyy'), '16:47', '23:44', 'Zipf', 'ShannonKattan', 1176);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2105, to_date('20-11-2021', 'dd-mm-yyyy'), '11:39', '17:54', 'San Diego', 'PragaTaha', 1298);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2106, to_date('04-09-2014', 'dd-mm-yyyy'), '16:34', '6:57', 'Immenstaad', 'SalmaBotti', 1225);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2107, to_date('26-09-2022', 'dd-mm-yyyy'), '13:34', '12:20', 'Ludbreg', 'DarylBracco', 1204);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2108, to_date('27-03-2006', 'dd-mm-yyyy'), '15:48', '1:35', 'Cincinnati', 'ElleLoggins', 1218);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2109, to_date('05-09-2005', 'dd-mm-yyyy'), '7:4', '9:25', 'Mountain View', 'DomVan Helden', 1239);
insert into SHIFTS (shift_id, daate, start_time, end_time, shift_location, shift_leader, event_id)
values (2110, to_date('21-04-2020', 'dd-mm-yyyy'), '11:45', '22:46', 'Richardson', 'ToddPollak', 1130);
commit;
prompt 1000 records loaded
prompt Loading VOLUNTEERSHIFTALLOCATION...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000456, 1255);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000032, 1578);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000430, 1917);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000082, 1990);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000174, 1789);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000074, 1337);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000343, 1994);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000107, 1256);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000064, 1895);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000205, 1884);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000272, 1503);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000421, 1797);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000398, 1800);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000027, 1877);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000097, 2089);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000372, 1477);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000204, 1455);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000069, 1727);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000140, 2030);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000314, 1966);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000471, 1429);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000407, 1577);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000021, 1268);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000218, 1308);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000129, 1451);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000117, 1733);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000288, 1186);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000241, 2104);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000233, 1601);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000244, 2069);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000202, 2062);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000314, 1993);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000213, 1552);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000341, 1860);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000294, 1726);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000275, 2008);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000275, 1501);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000308, 1162);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000343, 1276);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000164, 1503);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000193, 1171);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000388, 1771);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000248, 1856);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000168, 1624);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000019, 1869);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000319, 1734);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000321, 1499);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000228, 1367);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000194, 1612);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000138, 1423);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000467, 2030);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000300, 1173);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000068, 1308);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000149, 1175);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000288, 2036);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000268, 2107);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000325, 2009);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000041, 1496);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000084, 1891);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000023, 1586);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000310, 1217);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000165, 1819);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000261, 1852);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000186, 1675);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000271, 1262);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000466, 1837);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000148, 1210);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000001, 1945);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000002, 1732);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000071, 1386);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000216, 1507);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000372, 1891);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000389, 1975);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000038, 1897);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000211, 1818);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000061, 1918);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000370, 1659);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000254, 1414);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000183, 2091);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000046, 1882);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000297, 1394);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000492, 1165);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000428, 1551);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000029, 1200);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000202, 1418);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000126, 1703);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000337, 1166);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000103, 1517);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000474, 1344);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000005, 1608);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000146, 1180);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000078, 1944);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000440, 1974);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000471, 1748);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000096, 1700);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000456, 1846);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000350, 1167);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000049, 2108);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000000, 1354);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000071, 1205);
commit;
prompt 100 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000274, 1779);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000283, 1177);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000212, 2006);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000379, 1536);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000399, 1658);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000230, 1899);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000007, 1535);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000406, 1374);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000236, 1707);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000115, 1190);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000364, 1679);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000353, 1312);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000234, 2004);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000134, 2008);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000158, 1936);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000357, 1616);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000296, 1992);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000422, 1997);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000254, 1534);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000407, 1391);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000204, 1722);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000169, 1685);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000014, 1458);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000419, 1310);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000452, 1167);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000401, 1252);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000200, 1543);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000463, 1919);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000482, 1595);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000409, 1849);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000297, 1628);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000153, 1483);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000327, 2001);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000339, 1494);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000229, 1773);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000182, 1413);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000161, 1609);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000439, 1519);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000488, 1537);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000028, 1247);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000259, 1432);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000455, 1584);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000171, 1323);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000303, 1194);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000351, 1894);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000197, 1255);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000416, 1778);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000266, 1242);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000399, 1513);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000244, 1141);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000252, 1262);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000490, 1827);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000266, 1656);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000321, 1595);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000353, 1380);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000185, 2067);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000302, 1343);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000320, 1979);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000192, 1567);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000176, 1557);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000325, 1122);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000488, 1490);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000112, 1749);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000042, 1723);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000022, 2005);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000261, 1548);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000293, 2057);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000404, 1747);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000241, 1468);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000262, 1747);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000134, 1605);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000378, 2045);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000205, 1507);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000451, 1369);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000034, 1335);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000175, 1316);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000116, 1765);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000435, 1460);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000086, 1919);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000364, 1145);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000183, 1716);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000427, 1470);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000169, 1726);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000288, 1177);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000036, 1912);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000372, 1452);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000455, 1851);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000138, 1846);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000067, 1297);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000218, 1827);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000316, 1208);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000184, 1673);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000162, 1575);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000354, 1710);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000140, 1684);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000156, 1120);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000345, 1651);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000194, 1799);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000053, 1356);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000293, 2013);
commit;
prompt 200 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000327, 1124);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000424, 1825);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000046, 1768);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000032, 1525);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000466, 1852);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000405, 1567);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000011, 1277);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000373, 1717);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000127, 1570);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000228, 1427);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000178, 1453);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000382, 1646);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000447, 1582);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000428, 1569);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000467, 1548);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000360, 2042);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000016, 1504);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000358, 1623);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000235, 2026);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000168, 1529);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000454, 2075);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000210, 1943);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000440, 1153);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000204, 1429);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000401, 2033);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000200, 1437);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000204, 1652);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000042, 1117);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000406, 2047);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000410, 1956);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000285, 1420);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000220, 1939);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000232, 1717);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000275, 1244);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000454, 1308);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000191, 1694);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000061, 1637);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000244, 1450);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000281, 1960);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000426, 1683);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000102, 1511);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000082, 1209);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000326, 1722);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000177, 1314);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000114, 1347);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000332, 1274);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000233, 1604);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000392, 1271);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000332, 1696);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000442, 1725);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000233, 1312);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000286, 1247);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000292, 1973);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000035, 1724);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000059, 1339);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000078, 1241);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000074, 1821);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000345, 1850);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000251, 1120);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000368, 1410);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000442, 1550);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000304, 1980);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000388, 1248);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000183, 1498);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000397, 1638);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000289, 1745);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000209, 1753);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000179, 1808);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000130, 1284);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000021, 1541);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000152, 1446);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000487, 1754);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000387, 2041);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000127, 2109);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000289, 1319);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000232, 1968);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000234, 1492);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000347, 1669);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000179, 2017);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000193, 1966);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000236, 2004);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000410, 1623);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000116, 1363);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000132, 1383);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000035, 1537);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000058, 1819);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000289, 1952);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000271, 1769);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000338, 1517);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000230, 1377);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000352, 1806);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000428, 1943);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000313, 1770);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000397, 2080);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000387, 2089);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000306, 1916);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000384, 1524);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000064, 1319);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000291, 1885);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000448, 1374);
commit;
prompt 300 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000441, 1464);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000413, 1613);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000053, 2045);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000336, 1718);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000452, 1861);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000118, 1683);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000452, 2086);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000152, 1678);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000478, 1751);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000306, 2089);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000143, 1160);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000199, 1478);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000104, 1192);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000173, 1434);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000172, 2084);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000469, 1569);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000262, 1563);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000269, 1124);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000377, 1429);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000376, 1928);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000478, 1948);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000423, 1698);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000203, 1678);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000142, 1909);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000005, 1565);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000336, 1716);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000432, 1441);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000335, 1670);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000383, 1266);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000324, 1208);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000301, 1734);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000074, 1149);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000387, 2098);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000222, 1688);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000043, 1321);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000376, 1613);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000393, 1923);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000437, 1733);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000323, 1117);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000171, 1763);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000146, 2109);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000167, 1120);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000088, 1659);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000470, 1405);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000437, 1274);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000269, 1523);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000319, 1630);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000184, 1686);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000180, 2097);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000282, 1787);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000189, 1456);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000108, 1880);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000400, 1192);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000118, 1741);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000128, 1954);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000054, 1754);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000130, 2044);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000391, 1599);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000298, 2055);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000144, 1485);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000208, 2005);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000420, 1903);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000469, 1580);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000257, 1140);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000483, 1356);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000375, 2039);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000301, 2083);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000135, 1726);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000429, 1430);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000088, 1314);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000037, 1754);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000144, 1791);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000161, 1798);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000015, 1595);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000101, 1387);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000190, 1601);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000363, 1515);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000358, 1508);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000096, 1408);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000291, 1865);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000116, 1434);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000338, 1205);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000219, 1969);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000309, 2038);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000137, 1575);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000133, 1685);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000072, 2101);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000334, 1171);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000422, 1564);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000459, 1688);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000386, 1928);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000229, 1336);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000297, 1128);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000325, 1144);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000147, 1954);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000322, 1604);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000373, 1659);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000425, 1187);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000134, 1395);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000269, 1596);
commit;
prompt 400 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000406, 1833);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000202, 1728);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000354, 1590);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000055, 1583);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000071, 1301);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000058, 1601);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000394, 1468);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000170, 1164);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000132, 1431);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000228, 1255);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000170, 2072);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000428, 1490);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000026, 1121);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000301, 2026);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000087, 1156);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000444, 2067);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000347, 1675);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000409, 1958);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000107, 1837);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000277, 2106);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000243, 1734);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000060, 1194);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000219, 1311);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000213, 1449);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000215, 1276);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000138, 1925);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000313, 1635);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000222, 2048);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000323, 1678);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000048, 1905);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000473, 1566);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000054, 2011);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000294, 1836);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000033, 1530);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000157, 1468);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000009, 1208);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000049, 1353);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000129, 1471);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000305, 1276);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000345, 1445);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000121, 1785);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000290, 1879);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000329, 1528);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000358, 1192);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000489, 1953);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000161, 1148);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000036, 1453);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000106, 1878);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000312, 1319);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000016, 1240);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000431, 1129);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000301, 1751);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000078, 1413);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000341, 1576);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000447, 1701);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000344, 1299);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000151, 1339);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000083, 1484);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000071, 1653);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000030, 1228);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000225, 1335);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000048, 1217);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000374, 1159);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000397, 2008);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000189, 1390);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000463, 1523);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000457, 1480);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000239, 1986);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000395, 1935);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000187, 1792);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000295, 1436);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000276, 2046);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000332, 1592);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000080, 1747);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000491, 1930);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000470, 1852);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000209, 1977);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000032, 1717);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000434, 1545);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000011, 1634);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000441, 1583);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000146, 1458);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000364, 1197);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000451, 1553);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000039, 1708);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000072, 1544);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000347, 1848);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000495, 1613);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000418, 1457);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000009, 1314);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000147, 1290);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000448, 1151);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000097, 1800);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000351, 1393);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000018, 1986);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000324, 1877);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000310, 1697);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000497, 1762);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000386, 1970);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000102, 1484);
commit;
prompt 500 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000030, 1283);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000315, 1397);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000453, 1820);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000146, 1816);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000391, 1117);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000261, 1475);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000196, 1684);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000276, 1602);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000018, 1488);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000155, 1131);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000276, 1371);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000000, 1750);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000265, 1796);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000116, 1792);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000355, 1507);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000397, 1204);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000361, 1979);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000150, 2058);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000317, 1751);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000162, 1365);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000456, 2018);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000391, 1156);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000396, 2076);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000302, 2074);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000080, 1493);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000010, 1958);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000211, 2107);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000490, 1155);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000002, 1209);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000265, 1549);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000205, 1530);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000080, 1524);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000004, 1879);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000222, 1372);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000491, 1554);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000266, 1857);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000049, 1874);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000119, 1929);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000109, 1446);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000415, 1825);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000368, 2032);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000394, 2039);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000179, 1116);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000038, 1887);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000443, 1533);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000371, 1671);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000473, 1777);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000433, 1649);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000405, 1833);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000094, 1328);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000382, 1659);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000469, 1782);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000329, 1663);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000295, 1790);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000042, 1504);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000442, 2087);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000201, 1682);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000385, 1835);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000175, 1631);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000237, 1629);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000023, 1438);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000297, 2002);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000278, 1174);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000490, 1457);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000242, 2053);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000246, 2012);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000071, 1518);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000183, 1628);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000065, 1225);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000020, 1120);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000150, 1152);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000340, 1405);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000238, 1336);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000388, 1217);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000219, 1960);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000258, 1623);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000477, 1772);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000417, 1975);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000478, 2083);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000157, 1130);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000053, 1814);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000193, 2072);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000163, 1338);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000225, 1281);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000043, 2091);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000448, 1463);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000244, 1198);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000075, 1501);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000228, 1589);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000096, 1730);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000280, 1341);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000109, 1909);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000151, 1234);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000173, 1481);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000431, 1753);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000285, 1999);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000332, 2023);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000181, 1816);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000122, 1401);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000294, 1395);
commit;
prompt 600 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000136, 1730);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000346, 1862);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000369, 1465);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000138, 1653);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000304, 1171);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000271, 1360);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000257, 1131);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000117, 1143);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000127, 2025);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000008, 1319);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000077, 1950);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000228, 1977);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000295, 1227);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000023, 1737);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000116, 1760);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000458, 2012);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000386, 1916);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000082, 1376);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000108, 1163);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000495, 1907);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000016, 1952);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000025, 1605);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000336, 1575);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000338, 1250);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000153, 1989);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000465, 1307);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000394, 1831);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000315, 1740);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000076, 1117);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000383, 1842);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000103, 1356);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000009, 1438);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000495, 2060);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000126, 2078);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000085, 1895);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000091, 2072);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000329, 1941);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000322, 1482);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000494, 1812);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000053, 1419);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000140, 1609);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000192, 1277);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000399, 1944);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000353, 1733);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000219, 1525);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000274, 1654);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000327, 2023);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000468, 1245);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000331, 1218);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000050, 2058);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000461, 1655);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000346, 1725);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000120, 1292);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000477, 1521);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000497, 1871);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000270, 2106);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000162, 2008);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000435, 2075);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000149, 1228);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000126, 1163);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000183, 1422);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000064, 1213);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000324, 1483);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000080, 1271);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000426, 2081);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000027, 1421);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000437, 1826);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000155, 1208);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000180, 1294);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000159, 1769);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000397, 1669);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000223, 2029);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000458, 1952);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000042, 1565);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000239, 2010);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000394, 2006);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000343, 1920);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000470, 2073);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000417, 1352);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000318, 1620);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000477, 1987);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000330, 1289);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000253, 1181);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000393, 1627);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000215, 1382);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000385, 1789);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000040, 2016);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000374, 1177);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000431, 1845);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000465, 1627);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000304, 2012);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000392, 2001);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000486, 1271);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000062, 1304);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000220, 1134);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000382, 1661);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000343, 1910);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000338, 1799);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000188, 1887);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000409, 1856);
commit;
prompt 700 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000345, 1127);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000026, 1659);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000057, 1612);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000410, 1800);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000149, 1733);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000255, 1153);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000016, 1342);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000335, 1655);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000315, 1870);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000261, 1491);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000135, 1224);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000198, 2028);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000048, 1466);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000027, 2101);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000059, 1499);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000030, 1533);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000104, 1244);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000304, 1971);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000370, 2048);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000246, 1417);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000342, 1302);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000065, 2055);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000090, 1503);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000412, 1238);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000445, 1250);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000340, 1737);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000352, 1908);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000417, 1621);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000281, 1912);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000476, 1365);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000225, 1962);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000058, 2063);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000440, 1587);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000293, 1836);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000190, 1806);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000023, 1810);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000406, 1880);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000151, 1258);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000275, 1384);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000289, 1788);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000405, 2086);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000422, 1659);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000352, 1363);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000421, 1606);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000394, 1145);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000366, 1773);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000081, 1614);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000273, 1615);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000214, 1151);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000416, 1879);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000016, 1257);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000107, 2027);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000400, 1434);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000370, 1703);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000364, 1270);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000109, 2107);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000141, 1194);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000484, 1389);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000404, 1657);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000313, 1416);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000403, 1703);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000480, 1526);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000063, 1182);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000430, 1124);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000204, 2072);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000451, 1239);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000137, 1664);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000093, 1384);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000047, 1573);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000179, 1347);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000185, 1831);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000491, 1763);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000010, 1529);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000353, 1575);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000067, 1746);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000426, 1746);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000488, 1766);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000202, 1836);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000144, 1784);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000264, 1292);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000098, 1626);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000026, 1573);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000131, 1179);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000301, 1460);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000235, 1545);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000138, 1163);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000108, 1132);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000031, 2091);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000284, 1187);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000207, 1382);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000187, 1480);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000319, 1561);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000494, 1151);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000017, 1936);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000339, 1929);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000482, 1586);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000002, 1230);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000121, 2053);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000365, 1848);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000279, 2101);
commit;
prompt 800 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000015, 1240);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000409, 1139);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000040, 1627);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000302, 1190);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000150, 1407);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000078, 1488);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000402, 1598);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000277, 2087);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000430, 1319);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000013, 2070);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000199, 1516);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000270, 1237);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000433, 1441);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000066, 1367);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000494, 1604);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000299, 1417);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000102, 1187);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000254, 1278);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000429, 1160);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000352, 1924);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000207, 1565);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000347, 2090);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000136, 1729);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000313, 1819);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000467, 1371);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000377, 1501);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000316, 1835);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000291, 1244);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000324, 1957);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000045, 1716);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000464, 1272);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000362, 1787);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000377, 1559);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000038, 1601);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000260, 1966);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000207, 1925);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000471, 1180);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000248, 1897);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000104, 1395);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000164, 1518);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000443, 2046);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000401, 1505);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000321, 1566);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000184, 1370);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000021, 1618);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000092, 1820);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000010, 1568);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000196, 1852);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000382, 1166);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000227, 1141);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000059, 1672);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000369, 1589);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000370, 1912);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000365, 1137);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000310, 2005);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000295, 1207);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000358, 1729);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000475, 1376);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000383, 1781);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000064, 1144);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000284, 1402);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000093, 1913);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000153, 2098);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000252, 1520);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000326, 1460);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000389, 1950);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000389, 1293);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000318, 2078);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000245, 1560);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000137, 1552);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000046, 1861);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000399, 1179);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000377, 1439);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000094, 1421);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000211, 1942);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000023, 1861);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000289, 1430);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000285, 1744);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000206, 1360);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000211, 1965);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000081, 1534);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000192, 2095);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000355, 1237);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000007, 1320);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000354, 2064);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000350, 1399);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000395, 1156);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000394, 1989);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000329, 1841);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000352, 1966);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000052, 1900);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000129, 1582);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000123, 1961);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000258, 1581);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000270, 1741);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000480, 1627);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000181, 1121);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000408, 1656);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000097, 1302);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000370, 2008);
commit;
prompt 900 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000367, 1505);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000145, 1451);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000226, 1973);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000423, 1460);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000207, 1238);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000446, 1349);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000194, 1899);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000428, 1132);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000290, 1399);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000452, 1202);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000237, 1519);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000191, 1210);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000328, 1595);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000408, 1732);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000299, 1675);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000313, 1600);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000369, 2105);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000014, 1997);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000201, 1286);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000359, 1679);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000166, 1574);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000174, 1927);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000463, 1573);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000441, 2104);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000205, 1283);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000158, 1906);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000284, 1863);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000204, 1685);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000384, 1971);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000166, 1435);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000179, 1937);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000224, 1321);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000359, 1226);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000298, 1843);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000266, 1957);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000299, 2000);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000030, 1435);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000435, 2069);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000222, 1946);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000167, 1854);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000200, 1297);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000022, 1505);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000381, 1832);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000106, 1288);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000379, 1904);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000258, 1895);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000497, 2056);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000462, 1162);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000249, 1371);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000193, 1308);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000162, 1743);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000068, 2042);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000282, 2045);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000231, 1164);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000377, 1432);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000080, 1505);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000019, 1265);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000038, 1326);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000285, 1376);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000208, 1521);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000004, 1689);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000361, 1255);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000053, 1392);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000366, 1878);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000366, 1183);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000245, 1227);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000414, 1287);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000216, 1689);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000071, 1270);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000164, 1612);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000371, 1838);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000131, 1947);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000322, 1148);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000053, 1213);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000043, 1337);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000050, 1151);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000114, 1263);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000253, 1677);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000183, 1698);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000250, 1990);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000451, 1446);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000351, 1954);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000339, 1128);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000022, 2092);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000211, 1618);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000438, 1832);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000185, 1360);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000250, 1833);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000181, 2053);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000266, 1526);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000490, 1445);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000398, 1212);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000232, 1203);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000314, 1334);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000264, 1113);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000406, 1786);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000159, 2085);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000261, 1353);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000042, 1690);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000489, 1667);
commit;
prompt 1000 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000180, 1236);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000360, 1257);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000340, 1583);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000339, 1583);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000084, 1224);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000226, 1139);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000251, 1323);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000244, 2002);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000040, 1726);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000027, 1420);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000211, 1171);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000102, 1317);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000059, 1165);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000075, 1809);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000418, 1292);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000347, 2094);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000118, 1911);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000336, 1336);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000397, 1487);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000280, 1382);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000431, 2047);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000336, 1444);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000239, 1482);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000307, 2086);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000387, 1692);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000473, 1141);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000481, 1793);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000082, 1403);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000134, 1892);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000246, 1219);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000148, 1142);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000055, 1323);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000330, 2072);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000377, 1534);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000456, 1438);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000432, 1182);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000037, 2047);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000347, 1345);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000158, 1327);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000033, 1293);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000285, 1598);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000338, 1718);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000066, 1294);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000066, 1627);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000282, 1613);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000077, 1998);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000207, 1336);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000295, 1564);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000286, 1789);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000091, 1332);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000154, 1195);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000127, 1699);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000132, 1892);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000365, 1265);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000000, 1150);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000094, 1719);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000411, 1584);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000408, 1391);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000499, 1377);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000253, 1339);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000313, 1815);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000225, 2075);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000355, 1866);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000479, 1296);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000121, 1772);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000192, 1225);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000168, 1909);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000176, 1415);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000359, 1389);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000347, 1141);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000045, 1137);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000388, 1725);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000106, 1431);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000072, 1414);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000353, 1137);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000315, 1653);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000453, 1126);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000195, 1895);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000142, 1611);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000243, 1265);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000130, 1370);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000493, 1725);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000217, 1118);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000368, 1579);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000275, 1487);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000099, 1426);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000363, 1363);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000040, 1939);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000373, 1559);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000317, 2054);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000238, 2058);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000405, 1451);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000342, 1314);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000347, 1419);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000409, 1340);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000450, 1478);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000276, 1575);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000410, 1359);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000054, 1753);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000465, 1203);
commit;
prompt 1100 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000352, 1273);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000282, 2089);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000314, 1793);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000403, 1252);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000382, 2030);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000236, 1599);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000304, 2018);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000148, 1379);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000031, 1288);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000391, 1123);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000284, 1716);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000191, 1212);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000184, 2018);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000458, 1670);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000475, 1135);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000209, 2068);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000475, 1979);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000405, 1614);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000045, 1283);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000054, 1823);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000466, 1545);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000022, 1348);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000241, 1282);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000149, 1848);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000490, 2098);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000388, 2000);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000184, 1289);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000282, 2007);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000145, 1972);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000257, 1217);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000313, 1977);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000315, 1718);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000443, 1972);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000333, 2001);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000494, 1581);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000299, 2075);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000120, 1448);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000467, 1617);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000277, 1508);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000488, 2037);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000100, 1934);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000252, 1557);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000317, 1502);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000266, 1670);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000112, 1350);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000442, 1380);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000479, 1462);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000470, 1765);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000278, 1766);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000387, 1324);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000169, 1698);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000006, 1721);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000468, 1739);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000179, 1743);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000222, 1888);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000155, 1128);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000248, 1818);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000177, 1688);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000414, 1272);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000202, 1706);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000087, 1329);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000272, 1837);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000369, 1379);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000185, 2008);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000306, 1938);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000239, 2040);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000421, 1646);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000450, 1989);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000023, 2060);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000253, 1426);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000383, 1111);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000366, 1150);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000492, 1321);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000051, 2070);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000220, 1153);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000198, 1233);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000362, 2089);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000255, 1233);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000132, 1308);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000127, 1493);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000335, 2067);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000356, 1149);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000041, 1141);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000438, 1516);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000229, 1945);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000345, 1385);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000483, 1180);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000357, 1613);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000451, 1121);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000011, 1763);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000409, 1915);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000046, 1767);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000377, 1475);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000380, 1842);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000393, 1858);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000254, 1153);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000133, 1213);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000329, 1958);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000239, 1668);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000126, 1207);
commit;
prompt 1200 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000288, 1772);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000340, 1840);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000007, 1335);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000166, 1269);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000446, 1789);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000421, 1771);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000430, 1426);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000356, 1783);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000258, 1123);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000177, 1328);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000250, 1401);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000435, 2061);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000321, 1954);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000042, 1670);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000454, 1980);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000329, 1608);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000000, 1936);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000160, 1402);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000419, 1582);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000243, 2013);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000148, 1409);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000433, 1990);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000458, 1823);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000401, 1397);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000232, 1685);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000214, 1747);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000279, 2076);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000453, 1430);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000370, 1385);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000166, 1374);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000349, 2093);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000030, 1905);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000271, 1845);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000268, 2071);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000158, 1692);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000455, 1878);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000079, 1584);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000487, 1205);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000396, 1504);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000121, 1366);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000129, 1830);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000098, 1545);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000035, 1786);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000008, 1615);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000104, 1114);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000162, 2051);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000315, 1290);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000372, 1926);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000104, 1927);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000167, 1238);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000140, 1202);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000083, 2038);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000113, 1430);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000315, 2094);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000373, 1137);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000117, 2086);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000379, 1240);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000474, 1559);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000045, 1203);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000210, 1112);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000198, 1267);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000279, 1574);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000470, 1122);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000166, 1138);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000107, 1622);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000396, 1687);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000259, 1415);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000319, 1810);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000476, 1581);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000435, 1223);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000245, 1652);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000155, 1597);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000014, 1615);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000029, 2016);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000317, 1761);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000086, 1554);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000178, 1484);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000057, 1705);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000158, 1401);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000385, 1648);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000488, 1387);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000036, 1589);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000383, 1399);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000273, 1649);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000246, 1184);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000156, 2051);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000094, 1247);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000167, 1577);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000170, 1670);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000486, 1535);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000333, 1661);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000076, 1720);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000423, 1921);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000323, 2097);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000449, 1208);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000166, 1208);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000055, 1696);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000205, 1508);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000358, 1988);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000466, 1151);
commit;
prompt 1300 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000351, 1904);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000075, 1925);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000228, 1384);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000245, 1344);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000081, 1135);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000110, 1124);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000052, 1870);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000034, 1525);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000162, 1250);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000195, 1295);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000139, 1888);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000310, 1204);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000222, 2035);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000061, 1398);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000008, 1781);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000335, 2055);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000072, 1920);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000078, 2086);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000184, 1791);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000150, 1859);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000085, 1755);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000201, 1182);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000410, 1120);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000229, 2027);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000476, 1657);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000077, 1732);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000254, 2053);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000284, 1669);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000000, 1909);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000301, 1604);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000130, 1144);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000229, 1237);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000041, 1927);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000341, 1662);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000223, 1464);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000303, 1723);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000119, 1294);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000103, 1500);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000319, 1910);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000342, 1425);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000299, 1848);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000165, 1734);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000042, 1580);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000216, 1273);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000004, 1836);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000162, 1860);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000001, 1208);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000414, 1716);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000241, 1136);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000328, 1675);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000291, 1175);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000225, 1526);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000194, 1258);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000168, 1502);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000471, 2056);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000414, 2038);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000443, 1516);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000481, 1610);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000400, 1326);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000450, 1354);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000418, 1293);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000372, 1867);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000067, 1651);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000008, 1273);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000294, 2034);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000230, 1908);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000365, 2099);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000044, 1247);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000396, 2026);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000322, 1926);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000125, 1401);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000457, 1964);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000184, 1185);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000275, 1552);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000295, 1781);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000156, 2011);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000383, 1419);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000473, 1786);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000281, 1342);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000028, 1581);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000280, 1543);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000355, 1995);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000439, 2015);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000319, 1263);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000167, 1768);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000123, 1977);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000229, 2079);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000417, 1875);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000451, 1738);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000352, 2080);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000021, 1232);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000041, 1374);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000411, 1145);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000008, 1390);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000062, 1229);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000340, 1818);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000118, 1893);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000376, 1979);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000092, 2089);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000396, 1400);
commit;
prompt 1400 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000004, 1834);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000391, 1215);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000121, 1852);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000131, 1537);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000094, 2062);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000369, 1133);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000365, 1910);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000124, 2025);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000394, 1769);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000159, 1874);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000332, 1893);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000333, 1256);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000429, 1667);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000189, 1183);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000067, 1122);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000221, 1496);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000444, 1969);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000419, 1966);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000055, 1619);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000291, 1230);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000254, 1935);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000209, 1915);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000277, 1690);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000030, 1561);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000264, 1979);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000085, 1196);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000425, 2056);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000249, 1684);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000124, 1338);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000413, 1194);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000272, 1559);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000341, 1407);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000063, 1306);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000480, 1322);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000197, 1424);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000439, 1751);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000361, 2027);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000483, 1898);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000370, 2087);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000481, 1597);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000489, 1855);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000421, 2081);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000089, 1579);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000181, 1407);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000400, 1271);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000398, 1865);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000276, 1485);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000407, 2005);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000476, 1369);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000322, 1140);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000127, 1448);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000469, 1413);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000132, 1896);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000025, 1818);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000422, 1255);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000303, 1760);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000081, 1865);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000278, 2019);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000488, 1467);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000072, 1246);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000247, 1720);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000217, 1315);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000315, 1625);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000170, 1176);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000337, 2073);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000169, 2043);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000341, 2016);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000125, 2044);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000076, 1993);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000399, 1677);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000376, 1990);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000423, 1694);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000088, 1870);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000245, 1266);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000197, 1861);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000221, 1536);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000440, 1831);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000171, 1930);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000289, 1346);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000482, 1821);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000339, 1723);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000224, 1419);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000247, 1589);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000005, 1987);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000489, 1659);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000394, 1741);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000338, 1730);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000368, 2061);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000097, 1122);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000385, 1843);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000209, 2046);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000273, 1128);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000046, 1640);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000288, 1359);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000259, 1654);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000297, 1859);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000214, 2017);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000163, 1424);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000169, 1773);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000058, 2101);
commit;
prompt 1500 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000456, 1124);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000026, 1545);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000078, 1550);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000271, 1535);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000235, 1261);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000241, 1536);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000428, 1447);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000228, 1390);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000421, 2074);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000323, 1518);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000455, 1197);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000172, 1224);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000234, 2040);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000142, 1976);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000343, 1314);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000082, 1763);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000352, 1511);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000036, 1886);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000030, 1168);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000361, 1809);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000167, 1319);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000329, 1900);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000172, 1629);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000438, 1205);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000208, 1949);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000255, 1589);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000266, 1262);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000264, 1864);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000209, 1271);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000292, 1761);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000420, 2095);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000230, 1861);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000341, 1832);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000395, 1830);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000292, 1943);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000473, 1588);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000099, 1719);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000145, 1251);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000176, 1298);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000103, 1970);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000340, 1974);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000292, 2019);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000248, 1779);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000332, 1744);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000487, 1576);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000219, 1230);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000465, 1145);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000005, 1802);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000376, 1991);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000297, 1706);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000127, 1874);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000040, 1595);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000274, 1276);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000158, 1673);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000086, 1301);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000279, 1599);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000041, 1746);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000368, 1520);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000121, 1315);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000237, 1844);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000457, 1215);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000009, 1600);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000459, 1629);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000261, 1508);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000198, 1781);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000165, 2109);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000462, 1600);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000100, 1569);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000475, 1191);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000317, 2017);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000464, 1624);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000370, 1522);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000321, 1757);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000143, 2072);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000268, 2082);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000439, 1161);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000047, 1837);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000222, 1853);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000293, 1855);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000205, 1417);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000340, 1888);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000147, 1901);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000386, 1402);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000290, 1263);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000024, 2061);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000046, 1898);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000285, 1396);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000135, 1685);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000482, 1384);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000004, 1917);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000236, 1929);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000004, 1706);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000224, 1483);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000395, 1737);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000275, 1271);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000395, 1480);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000119, 1884);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000118, 1209);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000155, 1199);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000349, 1447);
commit;
prompt 1600 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000282, 1871);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000245, 1695);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000437, 1885);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000180, 1548);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000111, 1898);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000064, 1567);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000238, 1348);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000096, 1506);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000492, 1581);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000042, 1766);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000127, 1466);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000239, 1168);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000147, 1238);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000181, 1425);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000187, 1554);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000119, 1905);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000149, 1995);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000291, 1556);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000226, 1500);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000467, 2087);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000089, 1461);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000164, 1795);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000149, 1471);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000483, 1605);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000396, 1955);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000153, 1218);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000484, 1170);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000499, 1463);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000320, 1304);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000162, 1207);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000064, 1668);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000042, 1439);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000065, 1202);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000038, 1392);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000367, 1791);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000307, 1795);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000083, 1124);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000370, 1643);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000008, 2069);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000032, 2059);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000021, 1815);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000196, 1139);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000396, 1251);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000288, 1867);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000326, 1330);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000118, 1479);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000035, 1385);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000163, 1865);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000007, 1647);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000316, 1881);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000493, 1448);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000363, 1680);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000049, 1829);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000475, 1418);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000020, 1556);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000213, 1945);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000488, 1763);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000115, 1338);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000325, 1722);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000068, 1394);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000142, 1454);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000330, 1431);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000008, 1187);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000126, 2014);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000493, 1879);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000432, 1466);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000149, 1301);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000150, 1264);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000233, 1409);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000498, 1691);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000052, 1985);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000099, 1351);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000460, 1794);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000328, 1393);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000151, 1733);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000157, 1576);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000032, 1703);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000306, 1516);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000060, 1198);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000179, 1734);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000079, 1835);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000170, 1356);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000295, 1324);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000035, 1586);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000170, 1588);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000187, 1301);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000137, 2050);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000361, 1383);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000137, 1290);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000233, 1644);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000163, 1576);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000221, 1459);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000051, 1997);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000280, 1457);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000429, 1183);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000172, 1889);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000360, 1846);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000289, 1526);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000304, 1627);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000236, 1202);
commit;
prompt 1700 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000185, 1980);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000014, 1350);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000469, 2087);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000275, 1161);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000260, 2027);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000203, 1199);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000069, 1683);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000279, 1606);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000042, 1144);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000213, 1238);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000018, 1547);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000054, 1357);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000472, 1630);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000026, 1716);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000464, 1463);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000321, 1181);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000389, 2089);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000179, 1208);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000410, 2071);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000216, 1823);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000107, 1168);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000088, 1931);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000488, 1629);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000200, 2094);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000293, 1113);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000395, 1336);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000377, 2032);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000087, 1298);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000094, 1431);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000478, 1227);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000213, 2109);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000186, 1312);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000107, 1510);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000483, 1618);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000163, 1520);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000496, 1269);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000215, 1478);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000454, 1125);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000208, 1518);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000261, 1692);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000435, 1598);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000290, 1236);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000296, 1824);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000418, 1351);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000183, 1943);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000461, 1451);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000183, 2087);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000266, 1933);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000450, 1155);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000377, 1984);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000194, 1420);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000285, 1277);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000385, 1245);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000414, 2027);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000376, 1987);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000121, 1164);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000278, 1476);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000099, 1574);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000064, 1660);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000217, 1679);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000458, 1289);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000443, 1811);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000357, 1734);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000109, 1130);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000089, 1309);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000444, 2068);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000491, 1708);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000370, 1528);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000379, 1402);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000232, 1330);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000127, 1125);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000218, 1634);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000192, 1796);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000380, 1318);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000039, 1480);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000275, 1566);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000063, 1271);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000368, 1122);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000209, 1180);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000484, 1970);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000128, 1405);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000199, 1406);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000336, 1581);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000185, 1750);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000453, 1883);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000182, 1170);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000240, 2074);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000340, 1364);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000268, 1872);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000358, 2077);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000178, 1241);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000420, 1684);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000117, 1458);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000094, 1340);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000067, 2076);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000451, 1411);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000401, 1139);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000324, 1178);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000113, 1255);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000206, 2060);
commit;
prompt 1800 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000339, 1390);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000455, 1822);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000342, 1488);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000065, 1508);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000329, 1285);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000419, 2098);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000042, 1917);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000023, 2096);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000215, 1183);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000393, 1562);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000111, 1583);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000356, 1301);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000465, 1473);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000163, 1202);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000308, 1960);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000446, 1969);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000246, 1389);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000155, 1704);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000412, 1540);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000261, 2110);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000421, 1880);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000116, 1272);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000292, 1494);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000491, 1256);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000431, 1546);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000452, 2024);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000370, 1383);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000335, 1379);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000105, 1638);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000224, 1939);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000007, 1942);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000456, 1373);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000361, 1114);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000301, 1372);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000283, 1918);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000083, 2104);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000317, 1768);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000163, 1128);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000190, 1977);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000270, 2009);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000313, 1413);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000370, 2105);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000226, 1671);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000314, 1275);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000335, 1125);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000180, 1490);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000399, 1463);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000330, 1565);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000345, 1561);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000324, 1526);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000137, 1824);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000477, 1314);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000018, 1326);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000440, 1839);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000102, 1386);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000348, 1591);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000387, 1413);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000163, 1322);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000413, 1156);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000008, 1510);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000392, 1696);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000368, 1594);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000274, 1799);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000196, 1224);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000337, 1495);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000071, 2003);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000007, 1977);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000175, 1458);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000250, 1197);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000491, 1213);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000492, 1754);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000248, 1626);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000155, 1943);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000258, 1336);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000017, 2066);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000420, 1495);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000242, 1374);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000287, 1634);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000025, 1244);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000225, 1421);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000453, 1444);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000303, 1784);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000281, 1611);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000202, 1140);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000468, 1288);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000024, 1705);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000430, 1134);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000036, 1131);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000095, 1166);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000499, 1945);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000473, 1143);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000343, 1531);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000075, 1452);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000104, 1632);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000145, 2106);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000125, 1618);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000285, 1703);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000194, 1988);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000195, 1476);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000370, 1859);
commit;
prompt 1900 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000350, 1773);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000410, 1407);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000083, 1591);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000314, 1514);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000163, 2008);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000141, 2090);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000071, 1644);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000359, 1810);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000311, 1486);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000146, 1251);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000227, 1709);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000145, 1667);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000401, 1333);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000333, 1876);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000339, 1837);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000280, 2001);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000303, 2092);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000185, 2051);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000223, 1207);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000225, 1573);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000291, 1164);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000355, 1853);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000449, 1342);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000338, 1416);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000093, 1298);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000407, 1795);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000470, 1394);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000070, 1813);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000346, 1160);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000221, 1849);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000153, 1477);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000321, 1845);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000460, 1950);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000049, 2012);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000221, 2080);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000450, 1495);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000387, 2091);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000225, 1453);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000100, 1528);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000440, 1321);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000293, 1975);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000043, 1208);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000171, 1514);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000228, 1687);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000142, 1775);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000277, 1449);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000430, 1690);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000174, 1559);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000182, 1316);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000366, 1305);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000052, 1322);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000209, 1859);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000336, 2015);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000252, 1254);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000366, 2004);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000115, 1390);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000010, 1871);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000376, 2075);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000229, 1442);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000482, 1316);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000288, 1536);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000330, 1358);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000312, 1291);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000308, 1203);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000052, 1428);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000164, 1583);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000291, 2063);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000262, 1636);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000000, 1925);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000346, 1759);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000443, 2092);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000099, 1379);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000067, 1605);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000390, 1621);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000146, 1564);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000236, 1112);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000257, 1565);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000126, 1400);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000297, 1606);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000479, 1728);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000386, 1787);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000135, 1144);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000115, 1447);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000407, 1185);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000217, 1577);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000336, 1610);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000375, 1627);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000421, 1931);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000015, 2062);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000235, 1712);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000025, 1281);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000435, 1883);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000002, 1752);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000323, 1538);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000229, 1480);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000233, 1973);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000221, 1161);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000135, 1924);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000303, 1634);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000483, 1258);
commit;
prompt 2000 records committed...
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000300, 1493);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000462, 1593);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000060, 1961);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000396, 1584);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000132, 1392);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000224, 1856);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000069, 2013);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000059, 1824);
insert into VOLUNTEERSHIFTALLOCATION (volunteer_id, shift_id)
values (100000451, 1750);
commit;
prompt 2009 records loaded
prompt Enabling foreign key constraints for EEVENTS...
alter table EEVENTS enable constraint SYS_C007457;
prompt Enabling foreign key constraints for EVENT_ACTIVITY...
alter table EVENT_ACTIVITY enable constraint SYS_C007441;
prompt Enabling foreign key constraints for ROOLES...
alter table ROOLES enable constraint SYS_C007449;
prompt Enabling foreign key constraints for SHIFTS...
alter table SHIFTS enable constraint SYS_C007466;
prompt Enabling foreign key constraints for VOLUNTEERSHIFTALLOCATION...
alter table VOLUNTEERSHIFTALLOCATION enable constraint SYS_C007470;
alter table VOLUNTEERSHIFTALLOCATION enable constraint SYS_C007471;
prompt Enabling triggers for ACTIVITIES...
alter table ACTIVITIES enable all triggers;
prompt Enabling triggers for REPORTS...
alter table REPORTS enable all triggers;
prompt Enabling triggers for EEVENTS...
alter table EEVENTS enable all triggers;
prompt Enabling triggers for EVENT_ACTIVITY...
alter table EVENT_ACTIVITY enable all triggers;
prompt Enabling triggers for VOLUNTEERS...
alter table VOLUNTEERS enable all triggers;
prompt Enabling triggers for ROOLES...
alter table ROOLES enable all triggers;
prompt Enabling triggers for SHIFTS...
alter table SHIFTS enable all triggers;
prompt Enabling triggers for VOLUNTEERSHIFTALLOCATION...
alter table VOLUNTEERSHIFTALLOCATION enable all triggers;
set feedback on
set define on
prompt Done.
