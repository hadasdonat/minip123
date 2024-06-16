prompt PL/SQL Developer import file
prompt Created on �������� 26 ��� 2024 by HP
set feedback off
set define off
prompt Creating ACTIVITIES...
create table ACTIVITIES
(
  activity_id         INTEGER not null,
  activity_name       VARCHAR2(255) not null,
  activity_date       DATE not null,
  activity_start_time VARCHAR2(255) not null,
  shift_id            INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIVITIES
  add primary key (ACTIVITY_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EEVENTS...
create table EEVENTS
(
  event_id     INTEGER not null,
  event_date   DATE not null,
  event_time   VARCHAR2(5) not null,
  loocation    VARCHAR2(255) not null,
  deescription VARCHAR2(255) not null,
  shift_id     INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EEVENTS
  add primary key (EVENT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating REPORTS...
create table REPORTS
(
  report_id     INTEGER not null,
  creation_date DATE not null,
  report_type   VARCHAR2(255) not null,
  coontent      VARCHAR2(255) not null,
  event_id      INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REPORTS
  add primary key (REPORT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REPORTS
  add unique (COONTENT)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROOLES...
create table ROOLES
(
  role_id           INTEGER not null,
  role_name         VARCHAR2(255) not null,
  deescription      VARCHAR2(255) not null,
  required_training VARCHAR2(255) not null,
  max_volunteers    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOLES
  add primary key (ROLE_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOLES
  add unique (ROLE_NAME)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SHIFTS...
create table SHIFTS
(
  shift_id     INTEGER not null,
  daate        DATE not null,
  start_time   VARCHAR2(255) not null,
  loocation    VARCHAR2(255) not null,
  shift_leader VARCHAR2(255) not null,
  event_id     INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SHIFTS
  add primary key (SHIFT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SHIFTS
  add unique (DAATE)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SHIFTS
  add foreign key (EVENT_ID)
  references EEVENTS (EVENT_ID);

prompt Creating VOLUNTEERROLE...
create table VOLUNTEERROLE
(
  rolename     VARCHAR2(255) not null,
  role_id      INTEGER not null,
  volunteer_id INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VOLUNTEERROLE
  add primary key (ROLE_ID, VOLUNTEER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VOLUNTEERROLE
  add foreign key (ROLE_ID)
  references ROOLES (ROLE_ID);

prompt Creating VOLUNTEERS...
create table VOLUNTEERS
(
  volunteer_id  INTEGER not null,
  first_name    VARCHAR2(255) not null,
  last_name     VARCHAR2(255) not null,
  address       VARCHAR2(255) not null,
  phone_number  INTEGER not null,
  email         VARCHAR2(255) not null,
  role_id       INTEGER not null,
  volunteerrole VARCHAR2(255) not null,
  status        VARCHAR2(255) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VOLUNTEERS
  add primary key (VOLUNTEER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating VOLUNTEERSHIFTALLOCATION...
create table VOLUNTEERSHIFTALLOCATION
(
  daate        DATE not null,
  volunteer_id INTEGER not null,
  shift_id     INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VOLUNTEERSHIFTALLOCATION
  add primary key (VOLUNTEER_ID, SHIFT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for ACTIVITIES...
alter table ACTIVITIES disable all triggers;
prompt Disabling triggers for EEVENTS...
alter table EEVENTS disable all triggers;
prompt Disabling triggers for REPORTS...
alter table REPORTS disable all triggers;
prompt Disabling triggers for ROOLES...
alter table ROOLES disable all triggers;
prompt Disabling triggers for SHIFTS...
alter table SHIFTS disable all triggers;
prompt Disabling triggers for VOLUNTEERROLE...
alter table VOLUNTEERROLE disable all triggers;
prompt Disabling triggers for VOLUNTEERS...
alter table VOLUNTEERS disable all triggers;
prompt Disabling triggers for VOLUNTEERSHIFTALLOCATION...
alter table VOLUNTEERSHIFTALLOCATION disable all triggers;
prompt Disabling foreign key constraints for SHIFTS...
alter table SHIFTS disable constraint SYS_C007375;
prompt Disabling foreign key constraints for VOLUNTEERROLE...
alter table VOLUNTEERROLE disable constraint SYS_C007302;
prompt Deleting VOLUNTEERSHIFTALLOCATION...
delete from VOLUNTEERSHIFTALLOCATION;
commit;
prompt Deleting VOLUNTEERS...
delete from VOLUNTEERS;
commit;
prompt Deleting VOLUNTEERROLE...
delete from VOLUNTEERROLE;
commit;
prompt Deleting SHIFTS...
delete from SHIFTS;
commit;
prompt Deleting ROOLES...
delete from ROOLES;
commit;
prompt Deleting REPORTS...
delete from REPORTS;
commit;
prompt Deleting EEVENTS...
delete from EEVENTS;
commit;
prompt Deleting ACTIVITIES...
delete from ACTIVITIES;
commit;
prompt Loading ACTIVITIES...
prompt Table is empty
prompt Loading EEVENTS...
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (214, to_date('31-01-1987', 'dd-mm-yyyy'), '20:50', 'Lucca', 'Combo Intel P4 1.8Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support SD.', 946);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (43, to_date('14-09-1989', 'dd-mm-yyyy'), '12:29', 'Livermore', 'ATA 100 Controller Card PCI', 535);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (291, to_date('07-12-2005', 'dd-mm-yyyy'), '1:10', 'Hannover', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 101);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (772, to_date('06-01-2019', 'dd-mm-yyyy'), '3:57', 'Bekescsaba', 'AMD XP 2600+ Retail box. (with 333Mhz Front Side Bus)', 783);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (914, to_date('09-04-1988', 'dd-mm-yyyy'), '15:53', 'Hartford', 'Biostar M7SXD P4 M/B Socket 478 Support SD/DDR (30 day D.O.A Warranty)', 318);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (37, to_date('21-08-2007', 'dd-mm-yyyy'), '3:57', 'Duluth', '512Mb DDR 333 PC2700 (samsung)', 159);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (518, to_date('14-01-1989', 'dd-mm-yyyy'), '22:36', 'West Launceston', 'Seagate 120GB Serial ATA150 7200RPM.', 224);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (486, to_date('07-10-2019', 'dd-mm-yyyy'), '14:58', 'Slidel', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Biostar U8668 P4 M/B Socket 478 Support SD.', 996);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (559, to_date('27-03-2001', 'dd-mm-yyyy'), '22:25', 'Yokohama', 'Combo Intel P4 1.6Ghz 478pin(box)CPU + Gigabyte GA-8IRX (DDR up to 2GB/4 USB)M/B + Fan.', 518);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (200, to_date('02-08-1993', 'dd-mm-yyyy'), '7:3', 'Key Biscayne', 'AMD XP 2700+ Retail box. (with 333Mhz Front Side Bus)', 579);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (705, to_date('09-11-1988', 'dd-mm-yyyy'), '8:50', 'Whitehouse Station', 'Assembly & Testing of the CPU/Fan; Motherboard; Case; and Other Products.', 341);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (565, to_date('08-06-1993', 'dd-mm-yyyy'), '18:0', 'Pulheim-brauweiler', 'YS Intel P4 2.0Ghz POWER SYSTEM', 777);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (366, to_date('03-07-2021', 'dd-mm-yyyy'), '3:38', 'N. ft. Myers', 'AMD XP 1800+ & Biostar M7VIG-Pro MB w/ 313M case. Free PS2 Mouse.', 502);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (402, to_date('28-02-2015', 'dd-mm-yyyy'), '11:18', 'Ohtsu', 'TV Tuner card PCI (KWorld M878A)', 411);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (315, to_date('02-10-1998', 'dd-mm-yyyy'), '14:39', 'Boulder', 'Intel Celeron 1.7ghz & Gigabyte GA-8LS533 MB w/ 313M Case. W/ Free PS2 Mouse.', 281);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (528, to_date('16-03-2012', 'dd-mm-yyyy'), '22:27', 'Knoxville', 'Cooler Master ATA133 Rounded IDE Cable . PTC-A18', 713);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (626, to_date('04-09-2015', 'dd-mm-yyyy'), '14:26', 'New Delhi', '312B ATX Case 250W P4/AMD Ready Power Supply.', 237);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (686, to_date('13-06-1980', 'dd-mm-yyyy'), '6:5', 'Waite Park', 'Logitech Cordless Optical Mouse.', 751);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (62, to_date('07-04-1983', 'dd-mm-yyyy'), '21:3', 'Westfield', 'AMD XP 2000+ Box/with AMD Fan', 985);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (641, to_date('22-10-2002', 'dd-mm-yyyy'), '10:47', 'Bad Camberg', '512MB DDR PC2700 Kingston(KVR333X64C25/512)', 750);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (862, to_date('06-01-2022', 'dd-mm-yyyy'), '9:40', 'Highlands Ranch', 'Intel Celeron 1.3GHz 256k S370 FCPGA2 (Retail Box)', 428);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (727, to_date('13-09-1997', 'dd-mm-yyyy'), '0:47', 'Chirignago', 'Intel P3 1.13 GMhz FC-PGA 256KB PC133 OEM', 403);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (113, to_date('06-12-1981', 'dd-mm-yyyy'), '23:19', 'Echirolles', 'Linksys Instant Wireless Network Adapter - Version 3.0 for Notbooks. (Model No. WPC11 ver.3)', 265);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (689, to_date('17-04-1985', 'dd-mm-yyyy'), '5:18', 'Helsingborg', 'Combo AMD XP 1900+ cpu Gigabyte GA-7VKMLS m/b fan.', 302);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (979, to_date('02-02-2015', 'dd-mm-yyyy'), '20:24', 'Olsztyn', 'Mircosoft Ergonomic Keyboard and Mouse Set.', 943);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (398, to_date('03-07-2023', 'dd-mm-yyyy'), '13:17', 'Exeter', '313G-B ATX case 400W P4/AMD Free Fan and 2 Front USB.', 225);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (249, to_date('26-11-1977', 'dd-mm-yyyy'), '2:13', 'Ashland', 'AMD XP 2000+ & Biostar M7VIG-Pro MB w/ 313M case. Free PS2 Mouse.', 451);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (761, to_date('28-07-1976', 'dd-mm-yyyy'), '18:50', 'League city', 'LABTEC Internet Keyboard (Spanish Edition).', 968);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (733, to_date('30-12-2016', 'dd-mm-yyyy'), '20:48', 'Joinville', 'MITSUMI 54X CD-Rom Black.', 468);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (947, to_date('04-03-1998', 'dd-mm-yyyy'), '5:3', 'Birmensdorf', 'Intel Pentium4 1.8ghz & Gigabyte GA-8LS533 MB w/ 313N Case. W/ Free PS2 Mouse.', 425);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (634, to_date('13-09-1995', 'dd-mm-yyyy'), '0:19', 'Moorestown', 'Combo Intel P4 1.6ghz CPU + Fan (BOX);Biostar M7SXF P4 478pin M/B Support DDR DIMM', 763);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (420, to_date('03-12-1974', 'dd-mm-yyyy'), '5:16', 'Ipswich', 'Cyber Power 325SL Battery Back Up', 331);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (371, to_date('22-11-2023', 'dd-mm-yyyy'), '17:55', 'Macclesfield', 'AOC 19" Monitor .26 9GLR', 366);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (174, to_date('25-01-1980', 'dd-mm-yyyy'), '10:54', 'Mount Olive', 'Combo AMD XP 2200+( Box cpu) Gigabyte GA-7DXE.', 685);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (757, to_date('30-04-2012', 'dd-mm-yyyy'), '18:50', 'Nordhausen', 'AMD XP 1900+ & Gigabyte GA-7DXE MB w/ 313M Case', 323);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (354, to_date('17-05-1988', 'dd-mm-yyyy'), '2:35', 'Enfield', 'Windows XP Pro Registered OEM', 147);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (590, to_date('10-02-2013', 'dd-mm-yyyy'), '18:17', 'Streamwood', 'AMD Duron 1.3 Ghz (Oem)', 890);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (888, to_date('23-05-1996', 'dd-mm-yyyy'), '16:49', 'Fukui', '10/100 REALTEK NETWORK CARD 8139 chipset RETAIL BOX', 553);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (589, to_date('14-06-1983', 'dd-mm-yyyy'), '13:13', 'Rockland', 'Allied 400watt Powersupply; Intel and AMD approved.', 714);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (56, to_date('28-06-1999', 'dd-mm-yyyy'), '7:29', 'Ribeirao preto', 'W.D 80.0Gb 7200rpm ATA100 (WD800BB)', 691);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (940, to_date('05-04-1990', 'dd-mm-yyyy'), '4:13', 'Coslada', 'CNet External 56k V.92 Fax modem (Serial).', 403);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (363, to_date('26-01-2000', 'dd-mm-yyyy'), '12:17', 'Carlsbad', 'Intel P4 2.4ghz', 143);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (776, to_date('13-12-1994', 'dd-mm-yyyy'), '9:9', 'Double Oak', 'AMD XP 2200+ & Gigabyte 7DXE w/ 313M case . W/ Free PS2 Mouse.', 229);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (577, to_date('07-10-1999', 'dd-mm-yyyy'), '16:47', 'Santa Clarita', 'YS Intel Celeron 1.1GHz Work Station Series', 733);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (930, to_date('22-11-2004', 'dd-mm-yyyy'), '8:31', 'Lake Oswego', '512MB DDR400 PC3200 Kingston(KVR400X64C3/512 )', 594);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (935, to_date('17-01-2022', 'dd-mm-yyyy'), '4:3', 'Goteborg', 'Windows XP Pro Registered OEM', 605);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (247, to_date('26-05-2010', 'dd-mm-yyyy'), '14:36', 'Butner', 'CNet External 56k V.92 Fax modem (Serial).', 532);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (977, to_date('14-11-2000', 'dd-mm-yyyy'), '23:57', 'Olsztyn', 'Intel Pentium4 1.7Ghz & Biostar M7TDB MB w/ 313M Case.', 180);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (606, to_date('25-06-1983', 'dd-mm-yyyy'), '21:10', 'Cle Elum', 'Combo Intel P4 2.0Ghz (Box CPU)+ Biostar M7SXF m/b (478pin)CPU & Fan', 849);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (642, to_date('14-06-1970', 'dd-mm-yyyy'), '13:46', 'Telford', 'AMD 1.1Ghz BareBone System W/Free M&M', 621);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (245, to_date('11-10-1989', 'dd-mm-yyyy'), '22:32', 'Joinville', 'Maxtor 30GB 7200RPM ATA133', 426);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (467, to_date('29-01-1973', 'dd-mm-yyyy'), '13:21', 'Menlo Park', 'Combo Intel P4 1.6ghz CPU + Fan (BOX);Biostar M7SXF P4 478pin M/B Support DDR DIMM', 928);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (879, to_date('27-09-1998', 'dd-mm-yyyy'), '13:11', 'Buffalo Grove', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 Intel�845E Chipset.', 694);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (964, to_date('07-05-2011', 'dd-mm-yyyy'), '21:46', 'Ottawa', 'Cooler Master DP5-6J31C AMD Approved HeatSync.', 589);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (866, to_date('30-01-1992', 'dd-mm-yyyy'), '7:48', 'Athens', 'GA-7VA VIA KT400 chipset 8X AGP DDR400 onboard Sound.', 129);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (919, to_date('29-07-1972', 'dd-mm-yyyy'), '23:38', 'Nagoya', 'ADS USB2000 USB Turbo 2.0 pci Controller card', 553);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (281, to_date('20-07-1985', 'dd-mm-yyyy'), '2:14', 'San Francisco', '312B ATX Case with 300W P4/P3/AMD PS. USB Ready.', 797);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (92, to_date('11-05-2023', 'dd-mm-yyyy'), '18:6', 'Chaam', 'Seagate 60GB 7200rpm EIDE Hard Drive Barracuda V ST360015A (OEM).', 963);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (683, to_date('30-09-2022', 'dd-mm-yyyy'), '13:0', 'Bismarck', 'AMD XP 2100+ Box w/Fan', 788);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1, to_date('20-08-2012', 'dd-mm-yyyy'), '14:38', 'Vaduz', 'Biostar M6VCG skt 370 m/b (30 day D.O.A Warranty)', 838);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (2, to_date('14-11-2015', 'dd-mm-yyyy'), '17:18', 'Jacksonville', 'Intel Pentium 4 2.0 GHz 512k 400MHz FSB( Socket 478 )Retail Box', 881);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (3, to_date('17-12-1977', 'dd-mm-yyyy'), '14:58', 'Vallauris', 'AMD XP 2200+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.', 793);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (4, to_date('28-08-2011', 'dd-mm-yyyy'), '3:22', 'Gettysburg', '312B ATX Case with 300W P4/P3/AMD PS. USB Ready.', 906);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (5, to_date('09-05-2007', 'dd-mm-yyyy'), '8:34', 'Rosario', 'Intel Celeron 1.8ghz & Gigabyte GA-8LD533 MB w/ 313N Case. W/ Free PS2 Mouse.', 844);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (6, to_date('01-08-1981', 'dd-mm-yyyy'), '11:20', 'Canal Winchester', 'Biostar M6TWL skt 370 Motherboard. (D.O.A 30 days)', 662);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (7, to_date('22-04-2002', 'dd-mm-yyyy'), '16:6', 'Sheffield', 'Logitech Quick Cam W/Free Headset', 336);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (8, to_date('11-08-2010', 'dd-mm-yyyy'), '0:54', 'Linz', 'Windows XP Pro Registered OEM', 137);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (9, to_date('20-04-2001', 'dd-mm-yyyy'), '15:14', 'Brookfield', 'CyberPower PhoneSaver', 148);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (10, to_date('17-08-1974', 'dd-mm-yyyy'), '7:22', 'Piacenza', 'ATI Radion 7000; 64Mb DDR AGP +CRT+DVI+TV', 515);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (11, to_date('20-09-1975', 'dd-mm-yyyy'), '14:56', 'Qu�bec', '2 Year Warranty On BareBones.', 728);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (12, to_date('22-12-1971', 'dd-mm-yyyy'), '8:0', 'Brisbane', '312B ATX Case (No Power Supply)', 422);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (13, to_date('09-03-1972', 'dd-mm-yyyy'), '22:51', 'Fredericia', 'Printer Cable', 726);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (14, to_date('31-08-1998', 'dd-mm-yyyy'), '21:9', 'Fukuoka', 'YS AMD XP 2000+ Performance System', 236);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (15, to_date('04-12-1981', 'dd-mm-yyyy'), '12:41', 'Moorestown', 'Combo Intel Celeron 1.1Ghz (Box)Tulatin core Biostar M6VLR m/b (Free AMR Modem.)', 810);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (16, to_date('23-08-1970', 'dd-mm-yyyy'), '20:12', 'Araras', 'AMD Duron 1.3Ghz & Gigabyte GA-7VKMLE MB w/ 312D Color Case. W/ Free PS2 Mouse.', 572);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (17, to_date('17-02-2004', 'dd-mm-yyyy'), '0:43', 'Frankfurt', 'Combo AMD XP 2000+ cpu Gigabyte GA-7VKMLS m/b fan.', 414);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (18, to_date('11-09-1995', 'dd-mm-yyyy'), '18:36', 'Toyama', 'Combo AMD XP 2200+ CPU; Gigabyte GA-7VA M/B.', 429);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (19, to_date('26-05-2022', 'dd-mm-yyyy'), '23:59', 'Kanata', 'ADS External USB 2.0 Drive Kit', 957);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (20, to_date('07-05-2000', 'dd-mm-yyyy'), '8:35', 'Gainesville', '2 Year Warranty On MotherBoards.', 187);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (21, to_date('28-05-2017', 'dd-mm-yyyy'), '4:5', 'Kyunnam', 'Intel P4 1;8Ghz (478)pin 512K 3 Year MFG warr.', 418);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (22, to_date('26-09-2003', 'dd-mm-yyyy'), '20:48', 'Padova', 'Combo Intel P4 1.6ghz CPU + Fan (BOX);Biostar M7SXF P4 478pin M/B Support DDR DIMM', 750);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (23, to_date('09-05-1979', 'dd-mm-yyyy'), '0:18', 'Pusan-city', 'Combo AMD Duron 1.3Ghz + Biostar M7VKQ Pro', 380);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (24, to_date('13-08-1993', 'dd-mm-yyyy'), '11:46', 'Seattle', 'AMD Duron 1.3 Ghz (Oem)', 239);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (25, to_date('30-07-2016', 'dd-mm-yyyy'), '18:9', 'Oyten', 'AMDXP2200/128M/30G Black Complete System.', 783);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (26, to_date('26-06-1984', 'dd-mm-yyyy'), '4:53', 'League city', 'AOC 19" Monitor .26 9GLR', 829);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (27, to_date('31-01-2003', 'dd-mm-yyyy'), '4:39', 'Sulzbach', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7VA M/B.', 992);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (28, to_date('28-05-1986', 'dd-mm-yyyy'), '14:19', 'Stone Mountain', 'Biostar M6TBA skt 370 Motherboard. (D.O.A 30 days)', 843);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (29, to_date('23-10-1989', 'dd-mm-yyyy'), '13:25', 'Sao jose rio preto', 'Combo AMD XP 1800+ Gigabyte GA-7VKML M/B + Fan', 439);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (30, to_date('26-10-1988', 'dd-mm-yyyy'), '8:14', 'Gainesville', 'Biostar M6TBA skt 370 Motherboard. (D.O.A 30 days)', 691);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (31, to_date('05-05-2014', 'dd-mm-yyyy'), '6:18', 'San Diego', 'ATI Radeon 9800 Pro 128MB Gold Edition.', 943);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (32, to_date('09-10-2010', 'dd-mm-yyyy'), '10:13', 'Springfield', '512mb DDR ECC Registerd. For Dual Processor Server MotherBoards.', 864);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (33, to_date('21-06-1970', 'dd-mm-yyyy'), '6:38', 'Tokushima', 'AMD XP 2600+ Retail box. (with 333Mhz Front Side Bus)', 486);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (34, to_date('31-01-1997', 'dd-mm-yyyy'), '17:37', 'West Lafayette', 'Gigabyte GA-7VAXP AMD Motherboard. VIA KT400 RAID ATA133 with DDR support', 896);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (35, to_date('25-02-1975', 'dd-mm-yyyy'), '8:20', 'Tyne & Wear', 'Biostar M7VIK SKT A AMD� DDR400 AGP 8x ;onboard Raid & Sound & 1394 .', 725);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (36, to_date('10-08-1971', 'dd-mm-yyyy'), '0:37', 'New Haven', 'AMD XP 2000+ & Gigabyte GA-7DXE MB w/ 313M Case W/ Free PS2 Mouse.', 503);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (38, to_date('03-10-2017', 'dd-mm-yyyy'), '5:18', 'Denver', 'Cooler Master Copper HEAT PIPE Cooler. HHC-001', 560);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (39, to_date('26-02-2001', 'dd-mm-yyyy'), '9:24', 'Campinas', 'Double RJ45 Surface Mount', 139);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (40, to_date('20-05-1999', 'dd-mm-yyyy'), '16:17', 'Reston', 'AMD XP 2600+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', 747);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (41, to_date('08-01-1978', 'dd-mm-yyyy'), '14:12', 'Anyang-si', 'Intel D845WN 478Pin SDRAM retail Box', 357);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (42, to_date('05-01-1988', 'dd-mm-yyyy'), '12:6', 'Westport', 'Mitsumi PS/2 Net scroll 5 button mouse', 237);
commit;
prompt 100 records committed...
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1000, to_date('06-10-1970', 'dd-mm-yyyy'), '21:2', 'Hearst', 'LABTEC Cordless Desktop Keyboard & Mouse (Spanish Edition).', 714);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1001, to_date('13-03-1980', 'dd-mm-yyyy'), '1:34', 'Madrid', 'Combo AMD XP 2000+ Gigabyte GA-7VKML MB', 311);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1002, to_date('13-08-1984', 'dd-mm-yyyy'), '0:51', 'Paderborn', 'AMD XP 2200+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.', 406);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1003, to_date('07-06-2006', 'dd-mm-yyyy'), '15:21', 'Di Savigliano', 'Intel P4 1;7Ghz + Intel 845wn M/B;fan and ATX6053 Case w/350w power supply', 265);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1004, to_date('27-01-1970', 'dd-mm-yyyy'), '20:24', 'Bischofshofen', 'AMD XP 2000+ & GigaByte GA-7VT600L MB w/ 313M case. Free PS2 Mouse.', 368);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1005, to_date('08-02-2017', 'dd-mm-yyyy'), '11:31', 'Lublin', 'AOC 15" Monitor .27mm Pitch', 755);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1006, to_date('01-08-2001', 'dd-mm-yyyy'), '14:30', 'Philadelphia', 'Combo AMD XP 2000+ Gigabyte GA-7VKML MB', 448);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1007, to_date('11-10-1993', 'dd-mm-yyyy'), '17:40', 'Moscow', 'Mircosoft Ergonomic Keyboard and Mouse Set.', 386);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1008, to_date('16-08-2023', 'dd-mm-yyyy'), '17:16', 'Encinitas', 'Intel Pentium 4 2.0 GHz 512k 400MHz FSB( Socket 478 )Retail Box', 430);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1009, to_date('25-11-1978', 'dd-mm-yyyy'), '13:37', 'Nepean', 'AMD XP 2200+ & Biostar M7VIK KT400 MB w/ 313M case. Free PS2 Mouse.', 174);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1010, to_date('22-01-2014', 'dd-mm-yyyy'), '22:35', 'Lubbock', 'Intel Pentium4 3.0ghz & Asus P4C800 MB w/ Antec Performance Plus II 1040B Case.', 240);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1011, to_date('28-08-1987', 'dd-mm-yyyy'), '19:51', 'Ellicott City', 'Black RF Wireless Keyboard Track Ball .', 889);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1012, to_date('06-11-1970', 'dd-mm-yyyy'), '10:35', 'Herzlia', 'Combo AMD XP 2200+ CPU; Gigabyte GA-7VA M/B.', 682);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1013, to_date('02-08-1989', 'dd-mm-yyyy'), '6:43', 'Piacenza', 'Creative Sound Blaster LIVE 5.1 (OEM - SB0220 ).', 555);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1014, to_date('04-11-1981', 'dd-mm-yyyy'), '13:4', 'Cheshire', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Biostar U8668 P4 M/B Socket 478 Support SD.', 279);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1015, to_date('13-06-1979', 'dd-mm-yyyy'), '14:19', 'Seoul', '312D ATX color case(translucent blue) with 400Watt P4/P3/AMD Support PS.', 507);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1016, to_date('29-05-2022', 'dd-mm-yyyy'), '7:32', 'Michendorf', 'AMD XP 1900+ & Gigabyte GA-7DXE MB w/ 313M Case', 970);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1017, to_date('02-10-1988', 'dd-mm-yyyy'), '18:27', 'Biel', 'Pentiume 4 1.8Ghz/128M/30G Black Complete System.', 787);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1018, to_date('23-04-1991', 'dd-mm-yyyy'), '2:51', 'Erlangen', 'HP 1300 Laser Jet New.', 800);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1019, to_date('03-11-1975', 'dd-mm-yyyy'), '18:39', 'Saint Ouen', 'Combo Intel P4 1.9Ghz (Box CPU)+ Biostar U8668 m/b (478pin)CPU & Fan Support SD.', 141);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1020, to_date('30-11-1979', 'dd-mm-yyyy'), '8:53', 'Recife', 'Keyboard Converter from (old) standard form to (new) PS/2.', 463);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1021, to_date('17-04-1988', 'dd-mm-yyyy'), '10:20', 'Soroe', 'W.D 120G 7200RPM (1200JB) 8MB Cache and 3 year MDW', 593);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1022, to_date('13-01-1985', 'dd-mm-yyyy'), '23:32', 'Baarn', '256MB DDR 400 (PC3200) Kingston(KVR400X64C3/256)', 926);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1023, to_date('14-01-1972', 'dd-mm-yyyy'), '7:4', 'Indianapolis', '6072-1 case with side window 400W Powersupply.', 825);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1024, to_date('03-01-1970', 'dd-mm-yyyy'), '1:41', 'Cardiff', 'Epson Stylus C42UX - C11C482001.', 934);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1025, to_date('30-06-1980', 'dd-mm-yyyy'), '5:51', 'Eschen', 'Intel Celeron 1.8ghz & Gigabyte GA-8LS533 MB w/ 313M Case. W/ Free PS2 Mouse.', 436);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1026, to_date('28-10-1993', 'dd-mm-yyyy'), '5:56', 'Hounslow', 'GA-7N400 Pro nForce 2 Ultra400 chipset.', 593);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1027, to_date('27-07-2000', 'dd-mm-yyyy'), '19:40', 'Yavne', 'AMD XP 1700+ & Biostar M7VKQ w/ 313N case . W/ Free AMR 56k & PS2 Mouse.', 586);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1028, to_date('06-06-1978', 'dd-mm-yyyy'), '3:28', 'Ludbreg', 'Allied 300watt Powersupply; Intel P4 and AMD XP and Barton approved.', 161);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1029, to_date('26-08-1981', 'dd-mm-yyyy'), '0:37', 'Bedfordshire', '10/100 REALTEK NETWORK CARD 8139 chipset RETAIL BOX', 676);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1030, to_date('17-10-1982', 'dd-mm-yyyy'), '19:17', 'Akita', 'LABTEC Internet Keyboard (Spanish Edition).', 619);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1031, to_date('12-03-2015', 'dd-mm-yyyy'), '21:4', 'Fort Saskatchewan', 'Seagate Baraccuda 40Gb 7200rpm', 449);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1032, to_date('04-10-1999', 'dd-mm-yyyy'), '10:0', 'Ponta grossa', 'GA-8LD533 Intel�845GL Chipset VC/SC/Lan.', 385);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1033, to_date('27-02-1985', 'dd-mm-yyyy'), '23:11', 'Yokohama', '1.7Ghz Intel Celeron(box)478pin+ Biostar M7SXF M/b +fan', 351);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1034, to_date('12-08-1977', 'dd-mm-yyyy'), '5:16', 'Paraju', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7VR M/B(W/DDR333 up to 3GB/ATA133) .', 179);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1035, to_date('16-08-1986', 'dd-mm-yyyy'), '4:5', 'Barueri', '10ft Cat 5 network cable w/RJ45 connectors', 253);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1036, to_date('13-02-1971', 'dd-mm-yyyy'), '9:29', 'Solon', '8012 Black case with 400W Powersupply.', 809);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1037, to_date('28-06-2001', 'dd-mm-yyyy'), '5:24', 'Pitstone', 'Intel P4 1;7Ghz Box CPU+fan (478 pin)', 371);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1038, to_date('09-04-1989', 'dd-mm-yyyy'), '20:11', 'Drogenbos', 'Combo AMD XP 2100+ w/ Cpu Fan & Biostar M7VKQ +', 459);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1039, to_date('26-05-1989', 'dd-mm-yyyy'), '19:4', 'Darmstadt', 'Intel Pentium4 1.9ghz & Biostar U8668 MB w/ 313N Case. W/ Free CNR 56k & PS2 Mouse.', 996);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1040, to_date('12-04-2019', 'dd-mm-yyyy'), '22:0', 'Franklin', 'CyberPower 1500VA UPS Upto 135 minutes', 257);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1041, to_date('25-08-2011', 'dd-mm-yyyy'), '1:14', 'Carmichael', 'Headphone & Mic', 429);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1042, to_date('28-08-1999', 'dd-mm-yyyy'), '7:52', 'Petach-Tikva', '2 Year Warranty On BareBones.', 335);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1043, to_date('23-08-1999', 'dd-mm-yyyy'), '17:3', 'Frankfurt am Main', '312D ATX color case(translucent blue) with 400Watt P4/P3/AMD Support PS.', 146);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1044, to_date('15-08-2021', 'dd-mm-yyyy'), '19:12', 'Ipswich', 'Intel Pentium4 1.6Ghz & Biostar M7TDB MB w/ 313M Case.', 315);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1045, to_date('15-07-1977', 'dd-mm-yyyy'), '0:9', 'Gdansk', 'Asus P4C800 Deluxe intel 875 Chip 800FSB DDR SATA ATA133 RAID GIGABIT LAN USB2.0 ATX Retail Box + Intel Pentium 4 2.4Ghz; 800MHz FSB; Fan; Retail Box CPU/MB.', 643);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1046, to_date('01-08-2003', 'dd-mm-yyyy'), '3:50', 'West Chester', 'AMD XP 2000+ & Biostar M7VKQ Pro MB w/ 313M case. W/ PS2 Mouse.', 363);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1047, to_date('05-02-2023', 'dd-mm-yyyy'), '22:23', 'Trento', 'xAMD XP 1600+ Biostar M7VIB M/B + Cooler master fan', 812);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1048, to_date('04-01-1992', 'dd-mm-yyyy'), '5:28', 'Pordenone', 'Serial ATA Power Connector for the Hard Drive.', 275);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1049, to_date('12-05-2019', 'dd-mm-yyyy'), '0:10', 'Albuquerque', '312B ATX Case with 400Watt P4/P3/AMD Ready PS.', 310);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1050, to_date('14-08-1984', 'dd-mm-yyyy'), '9:23', 'Stanford', 'Antec PlusView1000AMG Metallic Gray SOHO File Server without PowerSupply.', 270);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1051, to_date('19-12-2022', 'dd-mm-yyyy'), '17:54', 'Sao jose rio preto', 'AMD XP 1800+ Biostar M7VIG Pro m/b + Cooler Master fan', 680);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1052, to_date('04-11-2012', 'dd-mm-yyyy'), '15:13', 'Ciudad del Este', 'Gigabyte GA-7NNXP MotherBoard w/ Nforce2 400 chipset.', 529);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1053, to_date('21-11-2020', 'dd-mm-yyyy'), '23:51', 'Bad Oeynhausen', 'Combo AMD XP 2200+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 576);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1054, to_date('17-07-1980', 'dd-mm-yyyy'), '8:18', 'Samrand', 'KIT Keyboard Mouse and Speakers to match color case', 890);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1055, to_date('17-11-1988', 'dd-mm-yyyy'), '9:1', 'Anyang-si', 'Combo AMD XP 2700+ CPU ASUS A7N8X Deluxe NVIDIA Force2', 414);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1056, to_date('23-09-1988', 'dd-mm-yyyy'), '4:20', 'Moscow', 'Intel P3 1.13 GMhz FC-PGA 256KB PC133 OEM', 320);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1057, to_date('21-07-1970', 'dd-mm-yyyy'), '12:32', 'West Monroe', 'Logitech Cordless Elite Duo Optical Kit(KB/MS)', 699);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1058, to_date('16-03-2002', 'dd-mm-yyyy'), '13:12', 'Lexington', 'Combo Intel Celeron 1.3ghz Biostar M6VLQ m/b + fan.', 148);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1059, to_date('01-07-1998', 'dd-mm-yyyy'), '4:14', 'Bloemfontein', '17" Filter Screen', 725);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1060, to_date('09-12-2012', 'dd-mm-yyyy'), '6:47', 'Tsu', 'Black Mitsumi CD-RW 52x24x52x.', 627);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1061, to_date('13-11-2016', 'dd-mm-yyyy'), '11:9', 'Butner', 'GA-7VA VIA KT400 chipset 8X AGP DDR400 onboard Sound.', 285);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1062, to_date('19-05-1988', 'dd-mm-yyyy'), '20:30', 'Shelton', 'Biostar M7SXF P4 478pin M/B Intel P4 1;8ghz CPU + Fan(BOx)Support DDR DIMM', 458);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1063, to_date('02-11-1989', 'dd-mm-yyyy'), '16:2', 'Santa Cruz', 'Antec Plus 660 ATX Mid tower 330w Power Supply', 932);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1064, to_date('18-07-2001', 'dd-mm-yyyy'), '6:40', 'Goslar', 'Combo AMD XP 2100+ w/ Cpu Fan & Biostar M7VKQ +', 941);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1065, to_date('08-03-1976', 'dd-mm-yyyy'), '11:48', 'Charleston', 'Sound Blaster PC128 Sound card', 129);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1066, to_date('15-05-1998', 'dd-mm-yyyy'), '13:8', 'N. ft. Myers', 'AMD XP 2000+ & Gigabyte GA-7VKML MB w/ 313M case W/ Free PS2 Mouse.', 948);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1067, to_date('17-11-1985', 'dd-mm-yyyy'), '7:4', 'Harrisburg', 'AMD XP 2200+ & Gigabyte 7DXE w/ 313M case . W/ Free PS2 Mouse.', 778);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1068, to_date('09-02-1991', 'dd-mm-yyyy'), '19:46', 'Battle Creek', 'GA-7VA VIA KT400 chipset 8X AGP DDR400 onboard Sound.', 184);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1069, to_date('28-10-1993', 'dd-mm-yyyy'), '5:28', 'Almaty', 'AMD XP 1700+ & Gigabyte GA-7ZXE MB w/ 313N Case. W/ Free PS2 Mouse.', 871);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1070, to_date('19-12-2000', 'dd-mm-yyyy'), '11:8', 'Montr�al', 'AMD XP 2700+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', 185);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1071, to_date('13-11-1992', 'dd-mm-yyyy'), '0:8', 'durham', 'Biostar M7VKB Ver2.0 ATA100 socket A (w/30 day limit warranty)', 288);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1072, to_date('21-07-1987', 'dd-mm-yyyy'), '16:30', 'Sao roque', 'Biostar M7VKQ Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', 262);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1073, to_date('12-12-1992', 'dd-mm-yyyy'), '6:40', 'Scottsdale', 'ATI Radeon 7000 32MB DDR TV-Out&DVI', 274);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1074, to_date('04-06-2009', 'dd-mm-yyyy'), '20:48', 'Birmingham', 'Combo AMD Duron 1.2Ghz + Biostar M7VKQ mb & fan (Free AMR Modem.)', 986);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1075, to_date('04-09-2016', 'dd-mm-yyyy'), '6:54', 'Dubai', 'ADS Technologies Firewire 1394 3 Port PCI', 531);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1076, to_date('24-12-2010', 'dd-mm-yyyy'), '9:21', 'Sao jose rio preto', 'Black RF Wireless Keyboard Track Ball .', 742);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1077, to_date('19-12-1987', 'dd-mm-yyyy'), '17:1', 'New boston', 'Combo Intel P4 1.8Ghz retail CPU + Gigabyte GA-8IE533 M/B + Fan.', 315);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1078, to_date('07-05-2004', 'dd-mm-yyyy'), '11:44', 'Monroe', 'Gigabyte GA-7NNXP MotherBoard w/ Nforce2 400 chipset.', 437);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1079, to_date('20-02-2021', 'dd-mm-yyyy'), '15:40', 'Knoxville', 'Creative Inspire 2.1 2500 surround sound', 685);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1080, to_date('11-06-1976', 'dd-mm-yyyy'), '23:49', 'Offenburg', 'Combo Intel Celeron 1.7ghz Gigabyte GA-8LD533 m/b onboard sound;video ;10/100 Lan USB2.0 + fan.', 375);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1081, to_date('08-10-1979', 'dd-mm-yyyy'), '20:40', 'Echirolles', 'AMD XP 1800+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.', 918);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1082, to_date('26-01-2018', 'dd-mm-yyyy'), '23:15', 'Lengdorf', 'Combo AMD XP 2000 Biostar M7VIK Skt A MotherBoard; KT400.', 512);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1083, to_date('05-12-2007', 'dd-mm-yyyy'), '18:8', 'Rozenburg', 'AMD XP 1800+ (oem)', 160);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1084, to_date('25-08-1975', 'dd-mm-yyyy'), '11:21', 'Saint Paul', '256Mb DDR 333 PC2700 (samsung)', 598);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1085, to_date('29-08-1970', 'dd-mm-yyyy'), '14:45', 'Kopavogur', 'Asus P4C800 Deluxe intel 875 Chip 800FSB DDR SATA ATA133 RAID GIGABIT LAN USB2.0 ATX Retail Box + Intel Pentium 4 3.0Ghz; 800MHz FSB; Fan; Retail Box CPU/MB.', 725);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1086, to_date('27-01-1974', 'dd-mm-yyyy'), '2:50', 'Frankfurt am Main', 'Intel D875PBZ M/B onboard S-ATA 150 + Intel Pentium 4 2.4Ghz; 800MHz FSB; Fan; Retail Box CPU/MB.', 186);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1087, to_date('07-02-1983', 'dd-mm-yyyy'), '4:7', 'Shoreline', 'AMD XP 2500+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', 370);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1088, to_date('09-06-2002', 'dd-mm-yyyy'), '14:8', 'Reno', 'PowerColor 128MB USB Portable MP3 Player.', 308);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1089, to_date('27-03-1986', 'dd-mm-yyyy'), '19:30', 'Stockholm', '6066-C10 Black Computer case w/Window panel', 376);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1090, to_date('12-12-2012', 'dd-mm-yyyy'), '0:30', 'Holts Summit', 'AMD Duron 1.1/128M/30G Black Complete System.', 958);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1091, to_date('21-07-1974', 'dd-mm-yyyy'), '12:37', 'Fort McMurray', 'Combo Intel P4 1.6Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.', 704);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1092, to_date('18-03-1992', 'dd-mm-yyyy'), '4:52', 'Slmea', 'Antec PFII Series 1040BII 400W PSU.', 680);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1093, to_date('25-10-1979', 'dd-mm-yyyy'), '0:48', 'Londrina', 'Seagate 20GB ATA100 5400RPM.', 187);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1094, to_date('04-02-1995', 'dd-mm-yyyy'), '8:4', 'T�by', 'Sound Blaster Audigy with 1394 firewire (oem)', 572);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1095, to_date('05-04-2023', 'dd-mm-yyyy'), '12:45', 'Oosterhout', 'USB to Parallel Printer Cable.', 844);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1096, to_date('28-05-2007', 'dd-mm-yyyy'), '23:21', 'Bartlesville', 'W.D 120G 7200RPM (1200JB) 8MB Cache and 3 year MDW', 232);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1097, to_date('25-09-1988', 'dd-mm-yyyy'), '14:9', 'Fairborn', 'Intel Celeron 1.3GHz 256k S370 FCPGA2 (Retail Box)', 469);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1098, to_date('04-11-1996', 'dd-mm-yyyy'), '6:32', 'Alpharetta', 'ATI Radion 7000 64Mb SD CRT+TV-Out', 541);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1099, to_date('21-01-2013', 'dd-mm-yyyy'), '4:38', 'Limeira', 'W.D 120G 7200RPM (1200JB) 8MB Cache and 3 year MDW', 358);
commit;
prompt 200 records committed...
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1100, to_date('10-08-1972', 'dd-mm-yyyy'), '12:2', 'Tilburg', 'Intel Celeron 1.1Ghz & Gigabyte GA6VEML MB w/ 312D Color Case. W/ Free PS2 Mouse.', 947);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1101, to_date('27-12-1992', 'dd-mm-yyyy'), '12:17', 'West Launceston', 'Logitech Quick Cam W/Free Headset', 992);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1102, to_date('03-04-2003', 'dd-mm-yyyy'), '9:46', 'Rio Rancho', '512Mb DDRam PC2100 (one piece) Micron', 290);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1103, to_date('16-07-2010', 'dd-mm-yyyy'), '14:15', 'Cary', 'PowerColor 128MB USB Portable MP3 Player.', 933);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1104, to_date('09-10-2008', 'dd-mm-yyyy'), '13:28', 'Rotterdam', 'MITSUMI 54X CD-Rom FX5401W .', 960);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1105, to_date('18-02-2007', 'dd-mm-yyyy'), '17:21', 'Pitstone', 'AOC LM520 Flat Screen (LCD) 15" Monitor', 734);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1106, to_date('30-01-2011', 'dd-mm-yyyy'), '2:38', 'Derwood', 'GA-8LD533 Intel�845GL Chipset VC/SC/Lan.', 140);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1107, to_date('18-08-1977', 'dd-mm-yyyy'), '10:21', 'Ashdod', 'Combo AMD Duron 1.3Ghz cpu Gigabyte GA-7VKMLS m/b fan.', 558);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1108, to_date('27-02-1992', 'dd-mm-yyyy'), '19:58', 'Sao caetano do sul', 'Intel Celeron 1.3GHz 256k S370 FCPGA2 (Retail Box)', 348);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1109, to_date('08-02-1979', 'dd-mm-yyyy'), '9:29', 'Eiksmarka', 'Assembly CPU/Fan; Motherboard; Case; and Other Products.', 865);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1110, to_date('15-09-1995', 'dd-mm-yyyy'), '9:42', 'Sydney', '128Mb PC2100 266Mhz DDR Ram ( Micron )', 281);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1111, to_date('01-07-2018', 'dd-mm-yyyy'), '10:4', 'Dietikon', '312D ATX translucent blue color case with 300W P4/AMD with(front USB ready) .', 540);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1112, to_date('25-08-1979', 'dd-mm-yyyy'), '17:49', 'Tilst', '313B Black 400W P4/AMD Fan&USB', 143);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1113, to_date('21-03-1995', 'dd-mm-yyyy'), '10:58', 'Sao caetano do sul', 'Sound Blaster Audigy with 1394 firewire (oem)', 967);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1114, to_date('08-07-1976', 'dd-mm-yyyy'), '22:43', 'Westfield', 'AOC LM520 Flat Screen (LCD) 15" Monitor', 167);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1115, to_date('04-05-2006', 'dd-mm-yyyy'), '16:17', 'Juno Beach', 'ATI Radion 7000; 64Mb DDR AGP +CRT+DVI+TV', 383);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1116, to_date('01-09-1975', 'dd-mm-yyyy'), '13:31', 'Delafield', 'AMD XP 2600+ & Biostar M7VIK KT400 MB w/ 313M case. Free PS2 Mouse.', 963);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1117, to_date('18-07-2023', 'dd-mm-yyyy'), '2:32', 'Campinas', '312D ATX color case translucent blue(No PowerSupply).', 655);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1118, to_date('02-08-2011', 'dd-mm-yyyy'), '5:27', 'Vallauris', 'GA-8LD533 Intel�845GL Chipset VC/SC/Lan.', 334);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1119, to_date('20-06-1984', 'dd-mm-yyyy'), '19:57', 'Aurora', 'Boka 1050 Sub Woofer and Speakers', 679);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1120, to_date('22-09-1973', 'dd-mm-yyyy'), '10:33', 'Enfield', 'ATI Radeon 7000 32MB DDR PCI CRT+DVI+TV.', 576);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1121, to_date('11-08-2014', 'dd-mm-yyyy'), '19:25', 'Shizuoka', 'CNet External 56k V.92 Fax modem (Serial).', 532);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1122, to_date('25-11-1987', 'dd-mm-yyyy'), '13:53', 'L�beck', 'Intel D845PEBT2 P4 M/B DDR-333 & 533MHz FSB.', 996);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1123, to_date('12-03-2001', 'dd-mm-yyyy'), '21:58', 'Birmingham', '312D ATX color case(translucent blue) with 300Watt P4/P3/AMD Support PowerSupply.', 304);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1124, to_date('04-03-1992', 'dd-mm-yyyy'), '23:16', 'Cedar Park', 'Intel Pentium4 2.0ghz & Gigabyte 8ID533 MB w/ 313N Case. W/ Free PS2 Mouse.', 534);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1125, to_date('29-11-2006', 'dd-mm-yyyy'), '15:0', 'South Jordan', 'AMD XP2000+ Biostar M7VKQ Pro', 402);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1126, to_date('21-10-1981', 'dd-mm-yyyy'), '16:33', 'L''union', 'Biostar M7VKG M/B up to 32Mb Video (30 day D.O.A Warranty)', 173);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1127, to_date('24-03-1994', 'dd-mm-yyyy'), '10:19', 'Minneapolis', 'Creative Sound Blaster', 850);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1128, to_date('06-09-1982', 'dd-mm-yyyy'), '8:38', 'Malm�', 'Biostar Mini BareBone PC > iDEQ 200S.', 152);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1129, to_date('02-01-1977', 'dd-mm-yyyy'), '0:39', 'Eindhoven', 'Combo Intel P4 1.6Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.', 767);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1130, to_date('16-10-2000', 'dd-mm-yyyy'), '22:36', 'Laredo', 'Seagate Baraccuda 40Gb 7200rpm', 657);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1131, to_date('23-11-1987', 'dd-mm-yyyy'), '14:28', 'Yogyakarta', '14inch LCD MG-015A Xgen2 Monitor.', 577);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1132, to_date('18-08-1998', 'dd-mm-yyyy'), '8:22', 'Melbourne', 'AMD XP 1700+ & Gigabyte GA-7VKML MB w/313N case. W/ Free PS2 Mouse.', 333);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1133, to_date('06-06-2013', 'dd-mm-yyyy'), '23:34', 'Aiken', 'Intel Pentium4 1.8ghz & Gigabyte GA-8LD533 MB w/ 313N Case. W/ Free PS2 Mouse.', 541);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1134, to_date('05-06-2019', 'dd-mm-yyyy'), '17:10', 'Lublin', 'GeForceFX 5200 128MB DDR (Light Version) DVI + TV-out and software DVD.', 367);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1135, to_date('10-02-1976', 'dd-mm-yyyy'), '10:38', 'Gattico', 'Combo AMD XP 2000+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 667);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1136, to_date('09-11-2001', 'dd-mm-yyyy'), '18:8', 'Silver Spring', 'AMD Duron 1.3Ghz & Gigabyte GA-7VKML MB w/ 312J Color Case. W/ Free PS2 Mouse.', 516);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1137, to_date('11-07-1973', 'dd-mm-yyyy'), '5:9', 'Pasadena', 'AMD Duron 1.1/128M/30G Black Complete System.', 866);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1138, to_date('03-07-2014', 'dd-mm-yyyy'), '12:49', 'Rimini', 'USB Cable 6ft. Long.', 231);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1139, to_date('20-11-1999', 'dd-mm-yyyy'), '14:28', 'Hyderabad', 'AMD XP 2000+ & Biostar M7VIG-Pro MB w/ 313M case. Free PS2 Mouse.', 781);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1140, to_date('03-04-2008', 'dd-mm-yyyy'), '2:19', 'Waltham', 'Combo AMD Duron 1.2Ghz + Biostar M7VKQ mb & fan (Free AMR Modem.)', 358);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1141, to_date('11-04-1989', 'dd-mm-yyyy'), '7:46', 'Chemnitz', 'Seagate 40GB 5400RPM ATA100', 646);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1142, to_date('17-04-2021', 'dd-mm-yyyy'), '12:5', 'Moreno Valley', 'Intel D875PBZ M/B onboard S-ATA 150 + Intel Pentium 4 3.0Ghz; 800MHz FSB; Fan; Retail Box CPU/MB.', 492);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1143, to_date('15-10-2018', 'dd-mm-yyyy'), '14:0', 'Orleans', 'KIT Keyboard Mouse and Speakers to match color case', 645);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1144, to_date('02-12-2023', 'dd-mm-yyyy'), '8:15', 'Sugar Land', 'Flat Panel Speakers Boka-206', 397);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1145, to_date('20-09-1973', 'dd-mm-yyyy'), '0:19', 'Heiligenhaus', 'ATX 300W High Quality Switching Power Supply', 797);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1146, to_date('10-01-1970', 'dd-mm-yyyy'), '17:26', 'Vienna', 'AMD 1.3Ghz BareBone System Free Mouse', 617);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1147, to_date('27-12-2012', 'dd-mm-yyyy'), '10:2', 'Slough', 'Intel Pentium4 1.7Ghz & Biostar M7TDB MB w/ 313M Case.', 440);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1148, to_date('08-03-2023', 'dd-mm-yyyy'), '21:3', 'Immenstaad', 'Combo AMD XP 2500+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2', 950);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1149, to_date('08-05-2000', 'dd-mm-yyyy'), '4:53', 'Woking', 'GeForceFX 5200 128MB DDR (Light Version) DVI + TV-out and software DVD.', 929);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1150, to_date('18-12-1985', 'dd-mm-yyyy'), '12:33', 'Highlands Ranch', 'SVA-USA VR-17S 17" TFT LCD Display.', 472);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1151, to_date('02-02-1978', 'dd-mm-yyyy'), '10:24', 'Media', 'AMD XP 1800+ Biostar M7VIG Pro m/b + Cooler Master fan', 544);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1152, to_date('11-12-2019', 'dd-mm-yyyy'), '11:35', 'K�benhavn', 'CyberPower PhoneSaver', 313);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1153, to_date('02-03-1972', 'dd-mm-yyyy'), '7:53', 'Michendorf', '312B ATX Case with 250W P4/P3/AMD PS.', 444);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1154, to_date('16-09-2007', 'dd-mm-yyyy'), '18:39', 'Harahan', 'ADS Technologies Firewire External Drive.', 700);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1155, to_date('07-08-1997', 'dd-mm-yyyy'), '19:43', 'Boise', 'ASUS A7N8X Deluxe NVIDIA Force2 w/ AMD XP 2700+ CPU.', 760);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1156, to_date('05-04-1974', 'dd-mm-yyyy'), '16:36', 'Bretzfeld-Waldbach', 'Combo AMD XP 2500+ CPU; Gigabyte GA-7N400L M/B(W/DDR400 up to 3GB/ATA133 USB2.0) +Fan.', 806);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1157, to_date('01-01-2008', 'dd-mm-yyyy'), '7:53', 'Lake Forest', '512MB DDR400 PC3200 Kingston(KVR400X64C25/512 )', 385);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1158, to_date('05-10-2001', 'dd-mm-yyyy'), '3:58', 'Rockland', 'KIT Keyboard Mouse and Speakers to match color case', 381);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1159, to_date('20-12-1998', 'dd-mm-yyyy'), '2:12', 'Nordhausen', 'Intel Celeron 1.7ghz & Gigabyte GA-8LS533 MB w/ 313M Case. W/ Free PS2 Mouse.', 310);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1160, to_date('15-10-1980', 'dd-mm-yyyy'), '12:38', 'Lancaster', 'Double RJ45 Surface Mount', 184);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1161, to_date('27-09-1991', 'dd-mm-yyyy'), '9:22', 'Waite Park', 'WD Caviar 20.0G 7200rpm Hard Drive', 548);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1162, to_date('21-08-1990', 'dd-mm-yyyy'), '1:31', 'Media', 'Linksys USB Wireless (WUSB11)', 306);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1163, to_date('06-10-1999', 'dd-mm-yyyy'), '21:36', 'Santa Fe', 'Combo Intel P4 2.4Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.', 610);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1164, to_date('28-02-2007', 'dd-mm-yyyy'), '6:24', 'Ann Arbor', '312J ATX color case(translucent blue) with 400Watt P4/P3/AMD Ready PS.', 869);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1165, to_date('24-06-2009', 'dd-mm-yyyy'), '16:53', 'Chinnor', 'Microsoft Windows XP Home Full Registered.', 877);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1166, to_date('01-10-2009', 'dd-mm-yyyy'), '3:32', 'Coppell', 'AMD 1.1Ghz BareBone System W/Free M&M', 525);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1167, to_date('25-07-1974', 'dd-mm-yyyy'), '19:19', 'Burlington', 'ADS USB2000 USB Turbo 2.0 pci Controller card', 798);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1168, to_date('28-02-1976', 'dd-mm-yyyy'), '13:14', 'Rueil-Malmaison', 'Combo AMD XP 2000+ CPU; Gigabyte GA-7VT600L M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 266);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1169, to_date('22-07-1996', 'dd-mm-yyyy'), '6:7', 'Utrecht', 'AOC 15" Monitor .27mm Pitch', 550);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1170, to_date('02-01-1987', 'dd-mm-yyyy'), '1:33', 'Birkenhead', 'Intel P4 1;6Ghz Box CPU (478pin)(256KB L2 Cache)', 459);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1171, to_date('01-12-1984', 'dd-mm-yyyy'), '15:53', 'Hilversum', 'Gigabyte GA-7NNXP MotherBoard w/ Nforce2 400 chipset.', 806);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1172, to_date('23-12-2010', 'dd-mm-yyyy'), '16:49', 'Sao jose rio preto', 'Case Fan 3 1/2"(80mm) 12V', 387);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1173, to_date('24-08-1997', 'dd-mm-yyyy'), '4:57', 'Bingham Farms', 'Combo AMD XP 1900+ cpu Gigabyte GA-7DXE Motherboard + Fan', 906);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1174, to_date('09-02-1985', 'dd-mm-yyyy'), '23:57', 'Americana', 'AMD XP 1800+ & Biostar M7VKQ Pro MB w/ 313M Case. W/ PS2 Mouse.', 436);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1175, to_date('07-05-1998', 'dd-mm-yyyy'), '21:46', 'Shoreline', 'AOC 15" Monitor .27mm Pitch', 678);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1176, to_date('03-09-1997', 'dd-mm-yyyy'), '2:14', 'New orleans', 'Linksys Wireless PCI card (WMP11)', 780);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1177, to_date('27-08-1981', 'dd-mm-yyyy'), '20:17', 'Greenwood Village', '512Mb SDRam PC133', 394);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1178, to_date('22-02-1997', 'dd-mm-yyyy'), '23:59', 'Brossard', 'Gigabyte GA-8IPE1000 Pro (intel 865PE Chipset) Pentium 4 ;DDR400 and FSB 800.', 116);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1179, to_date('14-07-2002', 'dd-mm-yyyy'), '16:0', 'Arlington', 'Biostar M6VCG skt 370 m/b (30 day D.O.A Warranty)', 636);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1180, to_date('26-06-2016', 'dd-mm-yyyy'), '12:17', 'Colombo', 'Combo AMD XP 2500+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 640);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1181, to_date('08-02-2002', 'dd-mm-yyyy'), '2:26', 'Campana', 'Gigabyte GA-7VKMLE', 148);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1182, to_date('23-12-1989', 'dd-mm-yyyy'), '10:0', 'Torino', 'GigaByte 7N400Pro AntecCase+AMDXP2700', 392);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1183, to_date('07-05-2008', 'dd-mm-yyyy'), '21:51', 'North Point', 'Testing of CPU/Fan and Motherboard.', 297);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1184, to_date('23-06-2000', 'dd-mm-yyyy'), '21:21', 'Royersford', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Biostar U8668 P4 M/B Socket 478 Support SD.', 904);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1185, to_date('13-10-1993', 'dd-mm-yyyy'), '23:42', 'Caracas', '256MB DDR PC2700 Kingston', 700);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1186, to_date('21-12-2021', 'dd-mm-yyyy'), '8:14', 'Conshohocken', 'Gigabyte GA-7VAXP AMD Motherboard. VIA KT400 RAID ATA133 with DDR support', 247);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1187, to_date('02-06-2023', 'dd-mm-yyyy'), '20:37', 'Ebersberg', '312B ATX Case with 300W P4/P3/AMD PS.', 458);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1188, to_date('04-02-2022', 'dd-mm-yyyy'), '7:43', 'Franklin', 'Cyber Power 1250VA Back Up.', 665);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1189, to_date('28-03-2000', 'dd-mm-yyyy'), '2:2', 'Sao jose rio preto', 'AOC 19" Monitor .26 9GLR', 772);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1190, to_date('27-05-2021', 'dd-mm-yyyy'), '21:32', 'Indianapolis', 'Black RF Wireless Keyboard Track Ball (USB) w/ Antenna.', 143);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1191, to_date('20-09-2001', 'dd-mm-yyyy'), '9:40', 'Woking', 'Biostar Mini BareBone PC > iDEQ 200N.', 256);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1192, to_date('06-11-2011', 'dd-mm-yyyy'), '20:0', 'Austin', 'Combo AMD Duron 1.2Ghz Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', 835);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1193, to_date('27-03-2022', 'dd-mm-yyyy'), '23:0', 'Lake Forest', '512MB DDR400 PC3200 Kingston(KVR400X64C25/512 )', 444);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1194, to_date('12-11-2015', 'dd-mm-yyyy'), '5:56', 'Juneau', '512Mb DDR 333 PC2700 (samsung)', 403);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1195, to_date('27-02-1976', 'dd-mm-yyyy'), '14:36', 'W�rth', 'ATA 100 RAID controller card', 342);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1196, to_date('24-05-2018', 'dd-mm-yyyy'), '9:55', 'Southend on Sea', 'ATI Radeon 9600 256MB DVI+CRT+TV 8X .', 672);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1197, to_date('16-07-1991', 'dd-mm-yyyy'), '22:8', 'New orleans', '512Mb SDRam PC133 Kingston', 588);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1198, to_date('27-04-1993', 'dd-mm-yyyy'), '19:2', 'Milford', 'GA-7N400L nForce 2 Ultra400 chipset.', 398);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1199, to_date('10-09-2016', 'dd-mm-yyyy'), '8:19', 'Bern', 'Biostar M6VLB Intel PPGA (w/30day limit warranty)', 424);
commit;
prompt 300 records committed...
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1200, to_date('21-09-1988', 'dd-mm-yyyy'), '18:12', 'Charleston', 'Desk Top Microphone', 181);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1201, to_date('31-12-2004', 'dd-mm-yyyy'), '10:26', 'Reisterstown', 'Creative Inspire 5200 5.1 surround sound.', 868);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1202, to_date('08-01-1975', 'dd-mm-yyyy'), '23:6', 'Madison', 'Antec PFII Series 1040BII 400W PSU.', 183);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1203, to_date('13-04-2023', 'dd-mm-yyyy'), '23:11', 'Goslar', 'Headset with Mircophone.', 965);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1204, to_date('30-07-2014', 'dd-mm-yyyy'), '7:1', 'Anyang-si', 'Combo AMD Duron 1.3Ghz + Biostar M7VKQ Pro', 974);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1205, to_date('17-10-1989', 'dd-mm-yyyy'), '9:28', 'Middleburg Heights', 'TV Tuner card PCI (KWorld M878A)', 713);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1206, to_date('12-07-1998', 'dd-mm-yyyy'), '23:34', 'Valencia', 'Combo AMD XP 2600+ CPU ASUS A7N8X Deluxe NVIDIA Force2', 385);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1207, to_date('02-02-2010', 'dd-mm-yyyy'), '7:23', 'Takamatsu', 'Cyber Power 725VA Battery Back Up', 173);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1208, to_date('22-11-1990', 'dd-mm-yyyy'), '18:11', 'Tooele', 'Asus P4C800 Deluxe intel 875 Chip 800FSB DDR SATA ATA133 RAID GIGABIT LAN USB2.0 ATX Retail Box + Intel Pentium 4 3.0Ghz; 800MHz FSB; Fan; Retail Box CPU/MB.', 359);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1209, to_date('05-08-1987', 'dd-mm-yyyy'), '6:1', 'Lummen', 'HP 1300 Laser Jet New.', 641);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1210, to_date('08-06-2012', 'dd-mm-yyyy'), '18:20', 'Freiburg', 'Biostar M7VKQ Duron 850Mhz B/B w/Video/Sound &10/100 LAN 312case.', 384);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1211, to_date('19-01-2018', 'dd-mm-yyyy'), '17:59', 'Coburg', 'AMD XP 1700+ & Gigabyte GA-7ZXE MB w/ 313N Case. W/ Free PS2 Mouse.', 159);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1212, to_date('07-10-2002', 'dd-mm-yyyy'), '1:27', 'Fukushima', 'KIT with Mistumi Internet Keyboard & Optical Mouse & 54X CDrom to match Black case .', 796);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1213, to_date('30-12-1993', 'dd-mm-yyyy'), '1:30', 'Haverhill', 'Combo Intel P4 2.4Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.', 246);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1214, to_date('16-10-1978', 'dd-mm-yyyy'), '13:10', 'Nuernberg', 'Gigabyte GA-7NNXP MotherBoard w/ Nforce2 400 chipset.', 546);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1215, to_date('06-05-1988', 'dd-mm-yyyy'), '20:54', 'Richmond', 'Combo AMD XP 1800+ Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', 479);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1216, to_date('02-06-2002', 'dd-mm-yyyy'), '12:22', 'Osaka', '256Mb SDRam PC133 Kingston', 929);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1217, to_date('02-06-2023', 'dd-mm-yyyy'), '2:42', 'San Jose', 'Combo AMD XP 2100+ CPU; Gigabyte GA-7VA M/B.', 326);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1218, to_date('17-06-1999', 'dd-mm-yyyy'), '14:43', 'Richmond Hill', 'AMD MP 1900+ OEM cpu', 323);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1219, to_date('05-01-1995', 'dd-mm-yyyy'), '10:27', 'Tokyo', 'Combo Intel P4 2.4Ghz retail CPU + Gigabyte GA-8IE800 M/B + Fan.', 478);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1220, to_date('28-01-1981', 'dd-mm-yyyy'), '0:17', 'Fair Lawn', 'Intel Celeron 1.7Ghz 478 pin Box cpu + fan', 966);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1221, to_date('27-11-2019', 'dd-mm-yyyy'), '17:57', 'West Point', 'Intel Celeron 2.2Ghz 478 pin Box cpu + fan', 272);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1222, to_date('24-06-1986', 'dd-mm-yyyy'), '14:48', 'Atlanta', 'Epson Stylus C42UX - C11C482001.', 704);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1223, to_date('20-05-1991', 'dd-mm-yyyy'), '20:59', 'Ft. Leavenworth', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 576);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1224, to_date('16-07-1972', 'dd-mm-yyyy'), '14:41', 'Kaiserslautern', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Biostar U8668 P4 M/B Socket 478 Support SD.', 752);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1225, to_date('22-12-2023', 'dd-mm-yyyy'), '9:59', 'Biel', '128Mb SDRAM PC133 Micron;Lifetime Warranty! We offer a 100% Compatibility Guarantee. 7.5ns PC133', 845);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1226, to_date('26-11-2004', 'dd-mm-yyyy'), '4:46', 'Boucherville', 'Gigabyte GA-7VKMLE', 883);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1227, to_date('27-07-1995', 'dd-mm-yyyy'), '5:58', 'Rockford', '9011 ATX Mid Server Case 450W w/3 case fans', 208);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1228, to_date('11-07-2022', 'dd-mm-yyyy'), '6:55', 'Warren', 'MITSUMI 54X CD-Rom Black.', 473);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1229, to_date('15-04-1979', 'dd-mm-yyyy'), '22:41', 'Saint Paul', '14inch LCD MG-015A Xgen2 Monitor.', 474);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1230, to_date('28-12-1989', 'dd-mm-yyyy'), '18:34', 'Claymont', 'Combo AMD MP 1500+ Gigabyte GA-7DPXDW Dual CPU M/B +Fan (one cpu only)', 201);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1231, to_date('08-04-2023', 'dd-mm-yyyy'), '0:59', 'Stuttgart', 'Keyboard Converter from (old) standard form to (new) PS/2.', 401);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1232, to_date('11-06-2014', 'dd-mm-yyyy'), '7:11', 'Foster City', '256Mb PC133 SDRam Micron 168 PIN SDRAM - Lifetime Warranty! We offer a 100% Compatibility Guarantee. 7.5ns PC133', 666);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1233, to_date('25-02-1991', 'dd-mm-yyyy'), '15:51', 'Newnan', 'ATX 300W High Quality Switching Power Supply', 590);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1234, to_date('12-06-1997', 'dd-mm-yyyy'), '16:7', 'Neuch�tel', 'Combo AMD XP 2200+ CPU; Gigabyte GA-7VA M/B.', 557);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1235, to_date('17-03-1982', 'dd-mm-yyyy'), '15:53', 'Vancouver', 'WD Caviar 20.0G 7200rpm Hard Drive', 178);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1236, to_date('21-04-1996', 'dd-mm-yyyy'), '17:21', 'Chemnitz', 'Desk Top Microphone', 885);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1237, to_date('08-02-2022', 'dd-mm-yyyy'), '9:46', 'Macclesfield', 'Combo Intel P4 1.6Ghz (Box CPU)+ Biostar U8668 m/b (478pin)CPU & Fan Support SD.', 765);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1238, to_date('24-09-1972', 'dd-mm-yyyy'), '23:25', 'Chambersburg', 'Intel D875PBZ M/B onboard S-ATA 150 + Intel Pentium 4 2.4Ghz; 800MHz FSB; Fan; Retail Box CPU/MB.', 131);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1239, to_date('07-06-2000', 'dd-mm-yyyy'), '8:51', 'Herzlia', 'Intel Celeron 1.3GHz 256k S370 FCPGA2 (Retail Box)', 577);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1240, to_date('28-08-2021', 'dd-mm-yyyy'), '17:31', 'Goteborg', 'OptoRite 48X16X48X CDRW Retail Box', 764);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1241, to_date('04-06-1992', 'dd-mm-yyyy'), '0:27', 'West Chester', 'CyberPower 525VA(525SL)', 843);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1242, to_date('14-02-1991', 'dd-mm-yyyy'), '19:44', 'Herdecke', 'KDS 15" Flat Screen LCD monitor (black).', 610);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1243, to_date('27-07-2011', 'dd-mm-yyyy'), '3:12', 'Darmstadt', 'Surge protector', 621);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1244, to_date('13-12-2022', 'dd-mm-yyyy'), '15:8', 'Glasgow', 'Microsoft Internet Keyboard AND MOUSE', 920);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1245, to_date('13-11-1975', 'dd-mm-yyyy'), '13:53', 'Utsunomiya', 'AMDXP2400/128M/30G Black Complete System.', 139);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1246, to_date('22-12-1978', 'dd-mm-yyyy'), '15:57', 'Nantes', 'AMD XP 1800+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', 999);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1247, to_date('02-04-2020', 'dd-mm-yyyy'), '18:27', 'Aomori', 'Mitsumi 1.44 Floppy Drive (Black)', 410);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1248, to_date('29-03-1980', 'dd-mm-yyyy'), '4:8', 'Billund', 'KIT Keyboard Mouse and Speakers to match Black cases.', 687);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1249, to_date('13-11-1980', 'dd-mm-yyyy'), '11:14', 'Chiba', '500W P4 Dual Fan Codegen Power supply.', 779);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1250, to_date('17-03-2018', 'dd-mm-yyyy'), '21:53', 'San Francisco', 'YS AMD T-Bird 1.2 Ghz Performance Series', 605);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1251, to_date('14-07-2020', 'dd-mm-yyyy'), '22:25', 'Fukui', 'Biostar Mini BareBone PC > iDEQ 200S.', 172);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1252, to_date('01-09-1976', 'dd-mm-yyyy'), '13:16', 'Tucson', 'ADS USB 4 Port Hub', 345);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1253, to_date('17-04-2010', 'dd-mm-yyyy'), '3:47', 'Goslar', 'AMD XP 2100+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', 945);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1254, to_date('08-01-1982', 'dd-mm-yyyy'), '21:17', 'Hanover', '512mb DDR ECC Registerd. For Dual Processor Server MotherBoards.', 368);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1255, to_date('23-06-1974', 'dd-mm-yyyy'), '12:49', 'Beaverton', 'Combo AMD MP 1500+ Gigabyte GA-7DPXDW Dual CPU M/B +Fan (one cpu only)', 859);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1256, to_date('04-11-1987', 'dd-mm-yyyy'), '7:28', 'Londrina', 'Combo AMD XP 2000+ CPU; Gigabyte GA-7VT600L M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 726);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1257, to_date('01-04-1970', 'dd-mm-yyyy'), '21:19', 'Cypress', 'YS AMD T-Bird 1.2 Ghz Performance Series', 470);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1258, to_date('11-11-1981', 'dd-mm-yyyy'), '23:5', 'Greenville', '17" Filter Screen', 426);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1259, to_date('13-11-1989', 'dd-mm-yyyy'), '3:5', 'Noumea', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Biostar U8668 P4 M/B Socket 478 Support SD.', 877);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1260, to_date('24-12-2017', 'dd-mm-yyyy'), '18:39', 'Silver Spring', 'ASUS P4C800 Deluxe Skt 478 Intel 875P (800MHZ FSB).', 797);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1261, to_date('09-11-2017', 'dd-mm-yyyy'), '9:5', 'Valladolid', '10 Pack CD-R cd''s Color pack', 574);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1262, to_date('26-02-2008', 'dd-mm-yyyy'), '5:28', 'Jacksonville', 'Gigabyte GA-7DPXDW-P Dual AMD Server board w/RAID up to 4GB of Registered DDR memory', 803);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1263, to_date('07-12-1970', 'dd-mm-yyyy'), '10:29', 'Wageningen', 'Intel Celeron 1.2Ghz & Biostar M6VLR MB w/ 312J Color Case. W/ Free AMR 56k & PS2 Mouse.', 300);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1264, to_date('08-11-2006', 'dd-mm-yyyy'), '1:10', 'Daejeon', '319A ATX case 400W P4/AMD Free Fan and 2 Front USB.', 877);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1265, to_date('25-08-2016', 'dd-mm-yyyy'), '3:43', 'Monument', 'Maxtor 40G 7200RPM ATA133', 172);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1266, to_date('21-11-1998', 'dd-mm-yyyy'), '9:42', 'Tours', 'Gigabyte GA-8IE533 Intel�845E Chipset', 785);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1267, to_date('03-02-1999', 'dd-mm-yyyy'), '18:45', 'Dinslaken', 'Intel D845WN 478Pin SDRAM retail Box', 383);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1268, to_date('13-09-2010', 'dd-mm-yyyy'), '18:46', 'Freiburg', 'LABTEC Cordless Desktop Keyboard & Mouse (Spanish Edition).', 480);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1269, to_date('23-01-1988', 'dd-mm-yyyy'), '6:36', 'Buenos Aires', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 504);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1270, to_date('13-07-2002', 'dd-mm-yyyy'), '4:22', 'El Masnou', 'Intel P4 1;7Ghz + Intel 845wn M/B;fan and ATX6053 Case w/350w power supply', 757);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1271, to_date('27-10-2018', 'dd-mm-yyyy'), '12:17', 'Berwyn', 'AMD XP 1800+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.', 222);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1272, to_date('07-10-1984', 'dd-mm-yyyy'), '16:58', 'Yavne', 'Biostar Mini BareBone PC > iDEQ 200N.', 288);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1273, to_date('04-08-1986', 'dd-mm-yyyy'), '0:9', 'Riverdale', '312A Black ATX case 300W P4/AMD (Front USB Optional.)', 178);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1274, to_date('27-12-2021', 'dd-mm-yyyy'), '14:8', 'Guamo', 'Intel D845WN 478Pin SDRAM retail Box', 878);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1275, to_date('17-01-1980', 'dd-mm-yyyy'), '17:14', 'Th�rishaus', 'Intel P4 1;6Ghz Bare Bone CPU & Fan;', 117);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1276, to_date('07-07-2014', 'dd-mm-yyyy'), '12:49', 'Knoxville', 'GA-SINXP1394(GA-8SQ800 Ultra2) (SiS 655 Chipset) w/ Pentium 4 2.4 Ghz (Box CPU)', 486);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1277, to_date('29-04-2005', 'dd-mm-yyyy'), '12:28', 'North Sydney', 'Intel P3 1.13 GMhz FC-PGA 256KB PC133 OEM', 952);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1278, to_date('07-04-1987', 'dd-mm-yyyy'), '9:43', 'Paderborn', 'Combo Intel Celeron 1.7G Gigabyte MB GA-8LS533', 559);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1279, to_date('23-09-2011', 'dd-mm-yyyy'), '17:35', 'Carlin', 'Intel Pentium4 2.0ghz & Gigabyte 8IRX MB w/ 313N Case.', 305);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1280, to_date('17-05-2017', 'dd-mm-yyyy'), '21:18', 'Arlington', 'Intel P3 1.13 GMhz FC-PGA 256KB PC133 OEM', 666);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1281, to_date('01-08-1974', 'dd-mm-yyyy'), '22:11', 'Birmingham', 'Intel Pentium4 2.4ghz & Gigabyte 8IRX MB w/ 313M Case.', 481);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1282, to_date('27-08-2014', 'dd-mm-yyyy'), '16:55', 'Golden', 'Promise Fast Track ATA 100 RAID Controller Kit.', 541);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1283, to_date('26-07-1988', 'dd-mm-yyyy'), '3:4', 'New orleans', 'Intel Pentium4 1.6ghz & Gigabyte 8ID533 MB w/ 313N Case. W/ Free PS2 Mouse.', 234);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1284, to_date('19-05-1990', 'dd-mm-yyyy'), '12:18', 'Elche', 'LG 52x24x52x CD-RW (OEM).', 696);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1285, to_date('07-09-2018', 'dd-mm-yyyy'), '19:42', 'Niigata', 'AMD XP 2100+ Box w/Fan & Biostar M7VKQ Pro MB w/ 313M Case. W/ PS2 Mouse.', 789);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1286, to_date('04-04-2001', 'dd-mm-yyyy'), '9:22', 'O''fallon', 'Sony 48x24x40 and 16x CD-RW/DVD OEM.', 416);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1287, to_date('19-05-1991', 'dd-mm-yyyy'), '8:59', 'Schlieren', '512mb DDR ECC Registerd. For Dual Processor Server MotherBoards.', 605);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1288, to_date('08-11-1987', 'dd-mm-yyyy'), '11:36', 'Spring Valley', 'Biostar M7SXF P4 478pin M/B Intel P4 1;8ghz CPU + Fan(BOx)Support DDR DIMM', 357);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1289, to_date('07-02-1982', 'dd-mm-yyyy'), '20:17', 'Matsue', 'ATA 100 RAID controller card', 137);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1290, to_date('08-09-1975', 'dd-mm-yyyy'), '23:22', 'Orleans', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 103);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1291, to_date('09-09-1971', 'dd-mm-yyyy'), '2:17', 'Kagoshima', 'Combo AMD XP 2200+( Box cpu) Gigabyte GA-7DXE.', 355);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1292, to_date('03-12-2022', 'dd-mm-yyyy'), '15:12', 'Ismaning', 'Combo Intel Celeron 1.8ghz Gigabyte GA-8LS533 m/b + fan.', 805);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1293, to_date('12-11-1997', 'dd-mm-yyyy'), '11:41', 'Bethesda', 'Intel Celeron 1.8Ghz 478 pin Box cpu + fan', 186);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1294, to_date('08-09-1974', 'dd-mm-yyyy'), '21:37', 'Juazeiro', 'Dynatron CPU Cooler DF1206BH AMD Athlon\Duron Fan. (AMD Recommend)', 971);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1295, to_date('27-11-1973', 'dd-mm-yyyy'), '4:41', 'Maebashi', 'Intel Pentium4 3.0ghz & Asus P4C800 MB w/ Antec Performance Plus II 1040B Case.', 385);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1296, to_date('17-11-2008', 'dd-mm-yyyy'), '20:50', 'Altamonte Springs', 'Combo Intel Celeron 1.7Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.', 996);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1297, to_date('17-09-1985', 'dd-mm-yyyy'), '22:47', 'Port Macquarie', 'Combo Intel P4 1.7Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.', 177);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1298, to_date('22-09-2018', 'dd-mm-yyyy'), '11:5', 'Oslo', '256Mb SDRam PC133 Kingston', 888);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1299, to_date('21-07-2013', 'dd-mm-yyyy'), '2:55', 'Oldham', 'AMD XP 2200+ & Gigabyte 7N400Pro w/ 313M case . W/ Free PS2 Mouse.', 756);
commit;
prompt 400 records committed...
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1300, to_date('08-06-1979', 'dd-mm-yyyy'), '3:44', 'Ponta grossa', 'White RF Wireless Keyboard Track Ball .(PS/2 Connector)', 820);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1301, to_date('11-06-2015', 'dd-mm-yyyy'), '6:51', 'Purley', 'US Robotics 56K V.90 PCI Modem with Voice', 303);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1302, to_date('04-05-2022', 'dd-mm-yyyy'), '2:1', 'Monument', 'Sony 48x24x48 and 16x CD-RW/DVD OEM.', 396);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1303, to_date('24-06-1985', 'dd-mm-yyyy'), '3:26', 'Lecanto', '256Mb DDR PC2100 (Micron)', 502);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1304, to_date('04-04-1974', 'dd-mm-yyyy'), '19:15', 'Copenhagen', 'Combo Intel Celeron 1.3ghz Biostar M6VLQ m/b + fan.', 555);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1305, to_date('21-08-2011', 'dd-mm-yyyy'), '17:59', 'Caracas', 'ADS External USB 2.0 Drive Kit', 892);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1306, to_date('13-07-1973', 'dd-mm-yyyy'), '8:52', 'Kongserbg', 'CNet External 56k V.92 Fax modem (Serial).', 798);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1307, to_date('10-10-2009', 'dd-mm-yyyy'), '5:6', 'San Jose', 'Flat Panel Speakers Boka-206', 381);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1308, to_date('02-06-1982', 'dd-mm-yyyy'), '12:2', 'Wageningen', 'AMD XP 1900+ & Gigabyte GA-7VKML MB w/ 313M case', 192);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1309, to_date('26-09-1998', 'dd-mm-yyyy'), '6:20', 'Turku', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) w/ Intel D845PESV P4 M/B Socket 478.', 102);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1310, to_date('25-12-1980', 'dd-mm-yyyy'), '3:7', 'Lahr', 'Intel P4 2.4ghz', 548);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1311, to_date('05-02-1998', 'dd-mm-yyyy'), '20:30', 'Freising', 'Seagate 120GB Serial ATA150 7200RPM.', 894);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1312, to_date('16-10-2010', 'dd-mm-yyyy'), '12:35', 'Santa Clarita', 'Biostar M7SXF P4 478pin M/B Intel P4 1;8ghz CPU + Fan(BOx)Support DDR DIMM', 307);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1313, to_date('07-08-1983', 'dd-mm-yyyy'), '0:28', 'Brentwood', 'CNet External 56k V.92 Fax modem (Serial).', 996);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1314, to_date('12-11-1992', 'dd-mm-yyyy'), '9:33', 'Immenstaad', 'Headphone & Mic', 530);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1315, to_date('08-11-1977', 'dd-mm-yyyy'), '8:34', 'Pordenone', 'Combo Intel P4 2.4Ghz retail CPU + Gigabyte GA-8IE800 M/B + Fan.', 577);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1316, to_date('14-08-2022', 'dd-mm-yyyy'), '6:46', 'Fremont', 'Intel P4 1;8Ghz (478)pin 512K 3 Year MFG warr.', 975);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1317, to_date('27-07-2008', 'dd-mm-yyyy'), '9:29', 'Conshohocken', 'AMD XP 2400+ Retail box.', 277);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1318, to_date('30-03-1977', 'dd-mm-yyyy'), '15:3', 'Fremont', 'Intel P4 3.0Ghz FSB 800MHZ (478)pin(HT) 3 Year MFG Warr.', 664);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1319, to_date('07-04-2020', 'dd-mm-yyyy'), '2:49', 'Altamonte Springs', '312B ATX Case with 300W P4/P3/AMD PS.', 973);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1320, to_date('03-06-1995', 'dd-mm-yyyy'), '20:47', 'Tooele', 'ATI Radeon 7000 32MB DDR PCI CRT+DVI+TV.', 840);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1321, to_date('23-03-2019', 'dd-mm-yyyy'), '2:7', 'Bloemfontein', 'ATI Radeon 7000 32MB DDR TV-Out&DVI', 446);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1322, to_date('16-10-2011', 'dd-mm-yyyy'), '0:52', 'Vista', 'Combo Intel P4 1.9Ghz (Box CPU)+ Biostar U8668 m/b (478pin)CPU & Fan Support SD.', 944);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1323, to_date('02-01-1979', 'dd-mm-yyyy'), '17:59', 'Annandale', 'Maxtor 40G 7200RPM ATA133', 356);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1324, to_date('02-04-2018', 'dd-mm-yyyy'), '0:34', 'Runcorn', 'Sony 48x24x48 and 16x CD-RW/DVD OEM.', 278);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1325, to_date('19-11-2004', 'dd-mm-yyyy'), '4:3', 'Reykjavik', 'Intel Pentium4 2.4ghz & Gigabyte 8IRX MB w/ 313M Case.', 655);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1326, to_date('10-01-2002', 'dd-mm-yyyy'), '9:45', 'Tampa', 'Cooler Master Copper HEAT PIPE Cooler. HHC-001', 685);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1327, to_date('09-08-2015', 'dd-mm-yyyy'), '6:52', 'Oak Park', 'AMDXP2000/128M/30G Black Complete System.', 276);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1328, to_date('30-04-2016', 'dd-mm-yyyy'), '9:15', 'Burwood East', 'Combo Intel P4 1.8ghz Gigabyte GA-8LD533 m/b + fan.', 235);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1329, to_date('05-05-2010', 'dd-mm-yyyy'), '23:41', 'Offenburg', 'Intel P4 1;7Ghz + Intel 845wn M/B;fan and ATX6053 Case w/350w power supply', 588);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1330, to_date('07-05-1996', 'dd-mm-yyyy'), '20:27', 'Redondo beach', '10/100 REALTEK NETWORK CARD 8139 chipset RETAIL BOX', 832);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1331, to_date('17-05-1982', 'dd-mm-yyyy'), '20:42', 'Mechanicsburg', 'YS Intel Celeron 1.1GHz Work Station Series', 604);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1332, to_date('24-07-1995', 'dd-mm-yyyy'), '17:1', 'Velizy Villacoublay', 'Biostar M6VCG skt 370 m/b (30 day D.O.A Warranty)', 551);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1333, to_date('16-07-1985', 'dd-mm-yyyy'), '20:15', 'Vaduz', 'Cooler Master Socket A CopperHeatSync Fan HSC-V62', 135);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1334, to_date('23-09-1994', 'dd-mm-yyyy'), '3:31', 'L�beck', 'Intel P4 1;8Ghz (478)pin 512K 3 Year MFG warr.', 565);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1335, to_date('04-05-1993', 'dd-mm-yyyy'), '6:24', 'Mclean', 'Combo Intel Celeron 1.7ghz (box)478pin +Gigabyte GA8IRX M/b +fan', 809);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1336, to_date('01-01-1994', 'dd-mm-yyyy'), '13:20', 'Cuenca', 'Black LG Electronics CD-RW 48x12x48x / DVD 16x Combo Drive.', 410);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1337, to_date('05-01-1984', 'dd-mm-yyyy'), '3:3', 'Santana do parna�ba', 'Double RJ45 Surface Mount', 696);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1338, to_date('21-11-2003', 'dd-mm-yyyy'), '18:34', 'El Dorado Hills', 'Intel P4 1;6Ghz Bare Bone', 334);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1339, to_date('08-11-1994', 'dd-mm-yyyy'), '2:45', 'Hunt Valley', 'KIT with Mistumi Internet Keyboard & Optical Mouse & 54X CDrom to match Black case .', 909);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1340, to_date('20-04-2016', 'dd-mm-yyyy'), '14:16', 'S�o paulo', 'CyberPower Surge Protector 850 with 8 Outlet.', 509);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1341, to_date('15-09-2016', 'dd-mm-yyyy'), '20:22', 'Sevilla', 'PCI 56K V.92 Fax Modem', 674);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1342, to_date('26-12-1979', 'dd-mm-yyyy'), '12:47', 'West Lafayette', 'Desk Top Microphone', 796);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1343, to_date('11-02-2013', 'dd-mm-yyyy'), '20:57', 'Zagreb', 'AMD XP 2400+ Retail box.', 645);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1344, to_date('30-10-1973', 'dd-mm-yyyy'), '4:36', 'Maarssen', 'ATI Radeon 7000 32MB DDR PCI CRT+DVI+TV.', 545);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1345, to_date('23-02-1986', 'dd-mm-yyyy'), '20:0', 'Leverkusen', 'Visioneer 5800 48bit USB Scanner XP compatable', 830);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1346, to_date('12-10-1982', 'dd-mm-yyyy'), '0:26', 'Waltham', 'Intel P4 3.06Ghz (478)pin(HT) 3 Year MFG Warr.', 384);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1347, to_date('08-09-2004', 'dd-mm-yyyy'), '14:16', 'League city', 'AMDXP2200/128M/30G Black Complete System.', 952);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1348, to_date('26-07-1982', 'dd-mm-yyyy'), '9:59', 'Ehningen', 'AMD XP 2700+ Retail box. (with 333Mhz Front Side Bus)', 274);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1349, to_date('07-07-1996', 'dd-mm-yyyy'), '18:3', 'Lengdorf', 'Microsoft Internet Keyboard AND MOUSE', 575);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1350, to_date('29-06-1987', 'dd-mm-yyyy'), '21:56', 'New Haven', 'Combo AMD XP 1900+ cpu Gigabyte GA-7DXE Motherboard + Fan', 250);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1351, to_date('20-09-2014', 'dd-mm-yyyy'), '9:9', 'Bekescsaba', 'Sony 48x24x40 and 16x CD-RW/DVD OEM.', 582);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1352, to_date('15-07-1983', 'dd-mm-yyyy'), '7:38', 'Newbury', 'Removeable ATA100 hard drive tray', 766);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1353, to_date('16-06-1983', 'dd-mm-yyyy'), '6:56', 'San Francisco', 'Intel Pentium4 2.4ghz & Gigabyte GA-8IE800 MB w/ 313N Case. W/ Free PS2 Mouse.', 663);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1354, to_date('08-04-2020', 'dd-mm-yyyy'), '0:45', 'Longueuil', 'AMDXP2200/128M/30G Black Complete System.', 195);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1355, to_date('22-11-1986', 'dd-mm-yyyy'), '10:57', 'Woodbridge', 'AMD Duron 1.1Ghz (1100 Mhz) OEM', 603);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1356, to_date('14-01-1978', 'dd-mm-yyyy'), '11:19', 'Leimen', 'Biostar M7SXF P4 478pin M/B Intel P4 1;8ghz CPU + Fan(BOx)Support DDR DIMM', 890);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1357, to_date('30-09-1979', 'dd-mm-yyyy'), '13:41', 'Lakeville', 'AMD Duron 1.1/128M/30G Black Complete System.', 210);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1358, to_date('12-08-2016', 'dd-mm-yyyy'), '7:11', 'Mount Laurel', 'Intel Pentium4 1.8ghz & Biostar U8668 MB w/ 313N Case. W/ Free CNR 56k & PS2 Mouse.', 866);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1359, to_date('11-05-1990', 'dd-mm-yyyy'), '6:23', 'Berlin', '17" Filter Screen', 848);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1360, to_date('29-11-2000', 'dd-mm-yyyy'), '17:40', 'Los Angeles', 'AMD XP 1900+ OEM', 920);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1361, to_date('11-05-1985', 'dd-mm-yyyy'), '23:48', 'El Dorado Hills', 'Black Complete Computer System w/ Mouse KeyBoard and Speakers(Free AMR Moden). (Duron 1.3)', 426);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1362, to_date('28-07-1993', 'dd-mm-yyyy'), '7:37', 'Northampton', '256Mb DDRam PC2100 Kingston', 865);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1363, to_date('30-10-1982', 'dd-mm-yyyy'), '15:8', 'Santa Fe', 'Cooler Master ATA133 Rounded IDE Cable . PTC-A18', 747);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1364, to_date('08-01-1995', 'dd-mm-yyyy'), '19:59', 'London', 'Intel Celeron 1.7ghz & Gigabyte GA-8LS533 MB w/ 313M Case. W/ Free PS2 Mouse.', 874);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1365, to_date('29-05-1984', 'dd-mm-yyyy'), '0:17', 'Hochwald', '312B ATX Case with 300W P4/P3/AMD PS.', 923);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1366, to_date('22-07-1991', 'dd-mm-yyyy'), '2:33', 'Friedrichshafe', 'Fast Ethernet 10/100 8 port switching hub', 154);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1367, to_date('26-06-2005', 'dd-mm-yyyy'), '23:51', 'Nantes', 'ATA 100 Controller Card PCI', 556);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1368, to_date('28-11-2017', 'dd-mm-yyyy'), '11:51', 'Alessandria', 'AMD XP 2500+ & Gigabyte 7N400Pro w/ 313M case . W/ Free PS2 Mouse.', 735);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1369, to_date('11-06-1977', 'dd-mm-yyyy'), '18:51', 'Marlboro', 'Wireless Access Point Router with 4-Port Switch - Version 3.2 (BEFW11S4)', 625);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1370, to_date('29-11-2011', 'dd-mm-yyyy'), '18:37', 'Durham', 'GigaByte G-Max Intel P4 Flex ATX Platform .', 609);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1371, to_date('12-01-2004', 'dd-mm-yyyy'), '6:31', 'St. Louis', '256Mb SDRam PC133 Kingston', 271);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1372, to_date('11-10-1994', 'dd-mm-yyyy'), '16:29', 'Edwardstown', 'Mitsumi 1.44 Floppy Drive (Black)', 492);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1373, to_date('17-07-2016', 'dd-mm-yyyy'), '15:21', 'Cheshire', '312D ATX color case(translucent blue) with 300Watt P4/P3/AMD Support PowerSupply.', 252);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1374, to_date('21-02-2016', 'dd-mm-yyyy'), '15:7', 'Tokushima', 'Cyber Power 725VA Battery Back Up', 558);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1375, to_date('16-04-2023', 'dd-mm-yyyy'), '20:37', 'Lisbon', 'Combo Intel Celeron 1.7Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.', 725);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1376, to_date('20-10-1978', 'dd-mm-yyyy'), '11:39', 'Rio Rancho', 'AMD XP 2000+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', 762);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1377, to_date('03-07-2021', 'dd-mm-yyyy'), '18:26', 'Juno Beach', 'Maxtor 40Gb ATA100 5400rpm H/D', 572);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1378, to_date('21-06-1987', 'dd-mm-yyyy'), '5:47', 'Drogenbos', 'Black RF Wireless Keyboard Track Ball (USB) w/ Antenna.', 507);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1379, to_date('02-04-2001', 'dd-mm-yyyy'), '13:11', 'Vilafranca Penedes', 'Intel P4 2.4G BareBone System W/ Free Mouse.', 537);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1380, to_date('09-02-1973', 'dd-mm-yyyy'), '11:34', 'Vilafranca Penedes', 'AMD MP 1900+ OEM cpu', 467);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1381, to_date('06-05-2014', 'dd-mm-yyyy'), '14:10', 'Ternitz', 'Combo Intel P4 1.6Ghz 478pin(box)CPU + Gigabyte GA-8IRX (DDR up to 2GB/4 USB)M/B + Fan.', 760);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1382, to_date('24-02-1987', 'dd-mm-yyyy'), '2:9', 'Americana', '313F-B ATX case 400W P4/AMD Free LED Fan.', 208);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1383, to_date('01-06-1971', 'dd-mm-yyyy'), '22:32', 'Milford', 'Maxtor 40G 7200RPM ATA133', 296);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1384, to_date('17-02-1991', 'dd-mm-yyyy'), '2:21', 'Vista', 'Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', 648);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1385, to_date('24-07-2001', 'dd-mm-yyyy'), '21:51', 'Shelton', 'WD Caviar 20.0G 7200rpm Hard Drive', 233);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1386, to_date('17-11-1997', 'dd-mm-yyyy'), '18:52', 'Ribeirao preto', 'Combo AMD XP 1800+ CPU; Gigabyte GA-7VA M/B.', 217);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1387, to_date('25-09-2022', 'dd-mm-yyyy'), '11:14', 'Petach-Tikva', '128Mb DDRam PC2100 Kingston', 814);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1388, to_date('28-10-2022', 'dd-mm-yyyy'), '3:56', 'Enschede', 'Combo Intel Celeron 1.7ghz (box)478pin +Gigabyte GA8IRX M/b +fan', 901);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1389, to_date('18-05-1997', 'dd-mm-yyyy'), '3:36', 'Kingston', 'Intel P4 1;6Ghz Bare Bone CPU & Fan;', 141);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1390, to_date('04-02-1994', 'dd-mm-yyyy'), '5:11', 'Frederiksberg', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 819);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1391, to_date('21-03-1993', 'dd-mm-yyyy'), '11:23', 'Takamatsu', 'Combo Intel P4 3.06ghz CPU + Fan(BOx)with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard.', 125);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1392, to_date('21-02-1986', 'dd-mm-yyyy'), '0:19', 'Kuraby', 'AMR 56K V.90 Modem Riser Card', 657);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1393, to_date('04-09-2001', 'dd-mm-yyyy'), '3:36', 'Lummen', 'Intel D875PBZ M/B onboard S-ATA 150.', 580);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1394, to_date('02-10-2002', 'dd-mm-yyyy'), '17:46', 'Copenhagen', 'YS Intel P4 2.0Ghz Server Solution', 736);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1395, to_date('15-07-1986', 'dd-mm-yyyy'), '13:22', 'Herndon', 'M7SXF P4 478pin Motherboard (Suppout DDR Max 3GB)(30 day D.O.A Warranty)', 364);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1396, to_date('23-02-1978', 'dd-mm-yyyy'), '1:10', 'Bolton', 'Combo AMD XP 1700+ cpu Gigabyte GA-7ZXE Motherboard + Fan', 477);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1397, to_date('04-01-2017', 'dd-mm-yyyy'), '4:55', 'Winterthur', 'Wireless Access Point Router with 4-Port Switch - Version 3.2 (BEFW11S4)', 765);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1398, to_date('07-09-2008', 'dd-mm-yyyy'), '15:17', 'Milton Keynes', 'Combo AMD XP 2700+ CPU ASUS A7N8X Deluxe NVIDIA Force2', 759);
insert into EEVENTS (event_id, event_date, event_time, loocation, deescription, shift_id)
values (1399, to_date('12-12-1992', 'dd-mm-yyyy'), '14:50', 'Charleston', 'AMD XP 1800+ Box CPU and Fan', 914);
commit;
prompt 500 records loaded
prompt Loading REPORTS...
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (1, to_date('27-11-2020', 'dd-mm-yyyy'), 'in process', 'Combo Intel Celeron 1.7G Gigabyte MB GA-8LS533', 100);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (2, to_date('14-12-2013', 'dd-mm-yyyy'), 'in process', 'Boka 406 Sub Woofer 4 Channel Speaker system', 101);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (3, to_date('29-10-2003', 'dd-mm-yyyy'), 'in process', 'LABTEC Cordless Desktop Keyboard & Mouse (Spanish Edition).', 102);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (4, to_date('11-01-1999', 'dd-mm-yyyy'), 'cenceled', 'Intel P3 1.13 GMhz FC-PGA 256KB PC133 OEM', 103);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (5, to_date('06-05-1992', 'dd-mm-yyyy'), 'cenceled', 'AMD XP 2500+ & GigaByte GA-7VT600L MB w/ 313M case. Free PS2 Mouse.', 104);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (6, to_date('17-08-1976', 'dd-mm-yyyy'), 'cenceled', 'AMD XP 1800+ & Gigabyte GA-7VKML MB w/ 313M case W/ Free PS2 Mouse.', 105);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (7, to_date('08-10-2004', 'dd-mm-yyyy'), 'in process', 'Intel Pentium4 3.0ghz & Asus P4C800 MB w/ Antec Performance Plus II 1040B Case.', 106);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (8, to_date('28-02-2000', 'dd-mm-yyyy'), 'cenceled', 'AOC 19" Monitor .26 9GLR', 107);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (9, to_date('20-05-1987', 'dd-mm-yyyy'), 'final', 'Sound Blaster PC128 Sound card', 108);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (10, to_date('20-12-1994', 'dd-mm-yyyy'), 'final', 'ATI RADEON 9200� SE 128M DDR DVI+TV-Out 8X AGP (R92LE-C3S).', 109);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (11, to_date('22-08-1977', 'dd-mm-yyyy'), 'final', 'Intel Celeron 1.8ghz & Biostar U8668D. W/ Free CNR 56k & PS2 Mouse.', 110);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (12, to_date('11-06-2013', 'dd-mm-yyyy'), 'final', '256Mb DDR PC2100 (Micron)', 111);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (13, to_date('05-01-2003', 'dd-mm-yyyy'), 'final', '313D Black Case 300W P4/AMD', 112);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (14, to_date('03-06-1998', 'dd-mm-yyyy'), 'final', 'Combo AMD XP 1700+ cpu Gigabyte GA-7ZXE Motherboard + Fan', 113);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (15, to_date('11-01-1979', 'dd-mm-yyyy'), 'final', 'Gigabyte GA-7VAXP AMD Motherboard. VIA KT400 RAID ATA133 with DDR support', 114);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (16, to_date('09-04-1975', 'dd-mm-yyyy'), 'final', 'Gigabyte GA-7VA Motherboard w/ AGP 8x.', 115);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (17, to_date('07-01-1971', 'dd-mm-yyyy'), 'in process', 'Sony 16X DVD-CDRom (OEM)', 116);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (18, to_date('10-09-1992', 'dd-mm-yyyy'), 'in process', 'Combo AMD XP 1800+ Gigabyte GA-7VKML M/B + Fan', 117);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (19, to_date('27-03-2024', 'dd-mm-yyyy'), 'cenceled', '512Mb DDR PC2100 Kingston', 118);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (20, to_date('10-03-1978', 'dd-mm-yyyy'), 'final', 'Biostar M7VKD-Pro AMD Skt A M/B VIA KT133 / 686B 266/200 Mhz FSB SD Ram ATA100(30 day D.O.A Warranty)', 119);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (21, to_date('17-07-1970', 'dd-mm-yyyy'), 'cenceled', 'Combo AMD XP 2500+ Biostar M7VIK Skt A MotherBoard; KT400.', 100);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (22, to_date('18-02-1985', 'dd-mm-yyyy'), 'in process', 'Intel Pentium4 1.8ghz & Gigabyte GA-8LD533 MB w/ 313N Case. W/ Free PS2 Mouse.', 101);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (23, to_date('06-03-1978', 'dd-mm-yyyy'), 'cenceled', 'Testing of CPU/Fan and Motherboard.', 102);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (24, to_date('10-07-1972', 'dd-mm-yyyy'), 'cenceled', 'Microsoft Office 2000 Small Biz edition', 103);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (25, to_date('21-07-2002', 'dd-mm-yyyy'), 'final', 'Intel Celeron 2.0Ghz 478 pin Box cpu + fan', 104);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (26, to_date('20-05-1992', 'dd-mm-yyyy'), 'in process', 'ADS USB 4 Port Hub', 105);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (27, to_date('26-12-2020', 'dd-mm-yyyy'), 'in process', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7VA M/B.', 106);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (28, to_date('07-08-2009', 'dd-mm-yyyy'), 'final', 'Combo Intel P4 1.8ghz Gigabyte GA-8LD533 m/b + fan.', 107);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (29, to_date('19-04-2014', 'dd-mm-yyyy'), 'final', 'AMD XP 1800+ Biostar M7VIG Pro m/b + Cooler Master fan', 108);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (30, to_date('18-10-2022', 'dd-mm-yyyy'), 'in process', 'AMD XP 2100+ CPU (oem)(AXDA2100DUT3C; RevisionB).', 109);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (31, to_date('19-02-1979', 'dd-mm-yyyy'), 'final', '256MB DDR PC2700 Kingston', 110);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (32, to_date('06-10-2001', 'dd-mm-yyyy'), 'final', 'hp deskjet 3820 printer - specifications and warranty.', 111);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (33, to_date('08-01-2016', 'dd-mm-yyyy'), 'final', 'Combo AMD XP 1700+ Gigabyte GA-7VKML M/B + Fan', 112);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (34, to_date('14-04-2020', 'dd-mm-yyyy'), 'final', 'AMD XP 2700+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', 113);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (35, to_date('22-12-1985', 'dd-mm-yyyy'), 'final', 'AOC 15" Monitor .27mm Pitch', 114);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (36, to_date('15-08-2022', 'dd-mm-yyyy'), 'final', 'Combo Intel P4 3.06ghz CPU + Fan(BOx)with Hyper Threading w/ Intel D845PESV P4 M/B DDR-333 support.', 115);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (37, to_date('04-11-1981', 'dd-mm-yyyy'), 'in process', 'ANTEC Performance PLUS Model PLUS1080 w/ Antec Original TRUE 430W P4 Power Supply.', 116);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (39, to_date('05-12-1974', 'dd-mm-yyyy'), 'cenceled', 'Intel Pentium4 1.8ghz & Gigabyte GA-8IE800 MB w/ 313M Case. W/ Free PS2 Mouse.', 118);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (40, to_date('18-11-1975', 'dd-mm-yyyy'), 'cenceled', '313D Black 400W P4/AMD 2xUSB', 119);
insert into REPORTS (report_id, creation_date, report_type, coontent, event_id)
values (41, to_date('10-09-1971', 'dd-mm-yyyy'), 'cenceled', 'Combo Intel P4 1.7ghz CPU + Fan(Box);Biostar M7SXF P4 478pin M/B Support DDR DIMM', 120);
commit;
prompt 40 records loaded
prompt Loading ROOLES...
insert into ROOLES (role_id, role_name, deescription, required_training, max_volunteers)
values (1, '''paramedic''', ' ''field work with the ambulance''', ' ''yes''', 70);
insert into ROOLES (role_id, role_name, deescription, required_training, max_volunteers)
values (2, '''ambulance_driver''', ' ''driver''', ' ''yes''', 70);
insert into ROOLES (role_id, role_name, deescription, required_training, max_volunteers)
values (3, '''taking_blood''', ' ''taking blood for donation''', ' ''yes''', 70);
insert into ROOLES (role_id, role_name, deescription, required_training, max_volunteers)
values (4, '''customer_service''', ' ''work in the center''', ' ''yes''', 70);
insert into ROOLES (role_id, role_name, deescription, required_training, max_volunteers)
values (5, '''center_manager''', ' ''management of employees in the center''', ' ''yes''', 70);
insert into ROOLES (role_id, role_name, deescription, required_training, max_volunteers)
values (6, '''trainee''', ' ''youth volunteers''', ' ''yes''', 70);
commit;
prompt 6 records loaded
prompt Loading SHIFTS...
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100000, to_date('22-05-2009', 'dd-mm-yyyy'), '1:33', 'Monmouth', 'TerenceMacht', 1184);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100001, to_date('20-07-1995', 'dd-mm-yyyy'), '18:17', 'Gaza', 'QueenShue', 1397);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100002, to_date('30-11-1982', 'dd-mm-yyyy'), '7:51', 'Oslo', 'HerbieMartinez', 1199);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100003, to_date('31-05-1991', 'dd-mm-yyyy'), '7:55', 'Bartlesville', 'MarkJordan', 1163);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100004, to_date('19-09-2006', 'dd-mm-yyyy'), '14:4', 'Enschede', 'RaulGrant', 1174);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100005, to_date('25-11-2020', 'dd-mm-yyyy'), '20:23', 'Alleroed', 'VondieElizabeth', 1112);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100006, to_date('27-07-1990', 'dd-mm-yyyy'), '7:8', 'Mendoza', 'RoseKotto', 634);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100007, to_date('08-01-1981', 'dd-mm-yyyy'), '14:7', 'Lyon', 'SylvesterMiller', 1271);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100008, to_date('11-01-1986', 'dd-mm-yyyy'), '6:55', 'Rtp', 'KyraMakeba', 1168);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100009, to_date('04-09-1974', 'dd-mm-yyyy'), '15:50', 'Amarillo', 'TeaRollins', 1034);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100010, to_date('12-12-1984', 'dd-mm-yyyy'), '8:32', 'Towson', 'CaseyDorff', 1381);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100011, to_date('22-11-1979', 'dd-mm-yyyy'), '11:27', 'Austin', 'BoLeachman', 1335);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100012, to_date('29-10-1997', 'dd-mm-yyyy'), '23:54', 'Heubach', 'WallyCassidy', 1022);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100013, to_date('11-01-2000', 'dd-mm-yyyy'), '1:54', 'Niles', 'MillieBruce', 1073);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100014, to_date('26-11-2005', 'dd-mm-yyyy'), '21:23', 'Brisbane', 'KarenParm', 866);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100015, to_date('30-11-2000', 'dd-mm-yyyy'), '12:39', 'Hohenfels', 'DavidGarr', 1397);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100016, to_date('07-05-2005', 'dd-mm-yyyy'), '14:22', 'Lengdorf', 'ColmGilley', 565);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100017, to_date('09-05-1984', 'dd-mm-yyyy'), '15:54', 'Lehi', 'MiaSingletary', 1029);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100018, to_date('26-08-2020', 'dd-mm-yyyy'), '19:34', 'Ft. Leavenworth', 'RoscoeStiller', 1129);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100019, to_date('23-07-2022', 'dd-mm-yyyy'), '8:40', 'Vienna', 'SonnyMazzello', 1004);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100020, to_date('13-05-1996', 'dd-mm-yyyy'), '0:34', 'Hilton', 'SimonPhillips', 1290);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100021, to_date('20-01-2022', 'dd-mm-yyyy'), '13:42', 'Ciudad del Este', 'CeCeCohn', 1367);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100022, to_date('30-01-1983', 'dd-mm-yyyy'), '8:32', 'Eden prairie', 'StephanieArmatrading', 420);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100023, to_date('06-10-2000', 'dd-mm-yyyy'), '16:58', 'Middletown', 'TonyTucci', 1398);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100024, to_date('01-10-2007', 'dd-mm-yyyy'), '19:31', 'Rimini', 'BradleyRawls', 689);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100025, to_date('25-05-2005', 'dd-mm-yyyy'), '23:58', 'Staten Island', 'VondaDillon', 1030);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100026, to_date('14-02-2015', 'dd-mm-yyyy'), '22:33', 'Irving', 'MindyBrothers', 1204);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100027, to_date('15-05-2023', 'dd-mm-yyyy'), '17:48', 'Bologna', 'ElizaVai', 1158);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100028, to_date('11-01-1982', 'dd-mm-yyyy'), '4:17', 'Ljubljana', 'RedProwse', 626);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100029, to_date('17-02-2005', 'dd-mm-yyyy'), '1:16', 'Orange', 'ShawnWhite', 888);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100030, to_date('13-07-1998', 'dd-mm-yyyy'), '12:51', 'Arlington', 'ConnieNewman', 1282);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100031, to_date('12-11-1976', 'dd-mm-yyyy'), '15:52', 'Copenhagen', 'DomTrevino', 1029);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100032, to_date('28-03-1994', 'dd-mm-yyyy'), '23:33', 'Plymouth Meeting', 'NightDiffie', 879);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100033, to_date('22-09-1974', 'dd-mm-yyyy'), '20:12', 'Athens', 'LynetteColin Young', 249);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100034, to_date('01-04-2006', 'dd-mm-yyyy'), '7:34', 'Exeter', 'MaggieCarrington', 32);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100035, to_date('12-06-2011', 'dd-mm-yyyy'), '12:16', 'Sao caetano do sul', 'NatalieWalken', 1341);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100036, to_date('19-08-1999', 'dd-mm-yyyy'), '6:34', 'Rozenburg', 'NightRizzo', 1288);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100037, to_date('30-10-2003', 'dd-mm-yyyy'), '1:28', 'Annandale', 'NikkiSpector', 33);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100038, to_date('25-01-1992', 'dd-mm-yyyy'), '3:8', 'Chapel hill', 'LariCummings', 1271);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100039, to_date('02-07-2024', 'dd-mm-yyyy'), '0:0', 'Porto alegre', 'RoddyFreeman', 214);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100040, to_date('06-12-1988', 'dd-mm-yyyy'), '13:45', 'Sale', 'GarlandButler', 1348);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100041, to_date('04-03-2009', 'dd-mm-yyyy'), '9:22', 'Encinitas', 'PragaReubens', 1353);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100042, to_date('18-07-1985', 'dd-mm-yyyy'), '6:52', 'Dartmouth', 'DermotTankard', 686);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100043, to_date('13-12-2003', 'dd-mm-yyyy'), '11:33', 'Lancaster', 'PatCondition', 1123);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100044, to_date('23-11-2014', 'dd-mm-yyyy'), '2:59', 'Mendoza', 'FreddySteiger', 1169);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100045, to_date('08-10-2002', 'dd-mm-yyyy'), '1:52', 'Arlington', 'GeorgeCaviezel', 1178);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100046, to_date('19-05-2001', 'dd-mm-yyyy'), '15:46', 'Athens', 'BenicioField', 291);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100047, to_date('11-11-2001', 'dd-mm-yyyy'), '16:26', 'Bern', 'RussellOlyphant', 1110);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100048, to_date('02-09-1974', 'dd-mm-yyyy'), '2:37', 'Fort Saskatchewan', 'HookahNeill', 1333);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100049, to_date('05-06-1994', 'dd-mm-yyyy'), '13:18', 'New Hyde Park', 'ArtRhys-Davies', 1074);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100050, to_date('13-12-2006', 'dd-mm-yyyy'), '3:5', 'St. Louis', 'ArnoldLee', 1007);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100051, to_date('22-10-1998', 'dd-mm-yyyy'), '10:4', 'San Dimas', 'JuanHaslam', 1394);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100052, to_date('06-01-1987', 'dd-mm-yyyy'), '12:22', 'Carlin', 'ViennaRibisi', 686);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100053, to_date('14-02-1975', 'dd-mm-yyyy'), '23:54', 'Narrows', 'ToriSpeaks', 1255);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100054, to_date('06-03-2009', 'dd-mm-yyyy'), '11:10', 'Maebashi', 'ChuckLovitz', 1126);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100055, to_date('04-07-2004', 'dd-mm-yyyy'), '23:24', 'Annandale', 'ShirleyShue', 1342);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100056, to_date('16-03-1991', 'dd-mm-yyyy'), '20:1', 'Mapo-gu', 'DerrickBugnon', 1213);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100057, to_date('21-10-1973', 'dd-mm-yyyy'), '12:17', 'Kaohsiung', 'DomingoHopkins', 1126);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100058, to_date('05-08-2022', 'dd-mm-yyyy'), '1:40', 'San Antonio', 'DebraWarwick', 1342);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100059, to_date('30-11-2010', 'dd-mm-yyyy'), '15:0', 'Overland park', 'AustinHerrmann', 914);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100060, to_date('29-01-1999', 'dd-mm-yyyy'), '9:54', 'Kagoshima', 'OlgaSanders', 1289);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100061, to_date('15-10-1978', 'dd-mm-yyyy'), '14:45', 'Fornacette', 'MichelleStuermer', 1192);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100062, to_date('28-12-1979', 'dd-mm-yyyy'), '18:24', 'Nara', 'SineadHewitt', 200);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100063, to_date('09-05-1995', 'dd-mm-yyyy'), '5:54', 'Venice', 'LivKudrow', 1364);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100064, to_date('20-12-2020', 'dd-mm-yyyy'), '5:5', 'Toyama', 'FredSpringfield', 1333);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100065, to_date('03-09-2021', 'dd-mm-yyyy'), '20:15', 'Lahr', 'MelbaMortensen', 1106);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100066, to_date('07-05-1982', 'dd-mm-yyyy'), '4:51', 'Milford', 'TalvinBryson', 1345);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100067, to_date('30-03-1974', 'dd-mm-yyyy'), '5:30', 'P�tion-ville', 'AshtonTillis', 420);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100068, to_date('03-03-1984', 'dd-mm-yyyy'), '10:49', 'Cromwell', 'CaroleMcNeice', 1106);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100069, to_date('04-09-1972', 'dd-mm-yyyy'), '20:46', 'Madison', 'TiaGuilfoyle', 1391);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100070, to_date('05-01-1985', 'dd-mm-yyyy'), '5:30', 'Hannover', 'DevonIngram', 1037);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100071, to_date('29-08-1990', 'dd-mm-yyyy'), '11:3', 'Charleston', 'BetteBriscoe', 689);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100072, to_date('25-07-1970', 'dd-mm-yyyy'), '5:37', 'Mexico City', 'KeanuDe Niro', 947);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100073, to_date('28-06-1995', 'dd-mm-yyyy'), '17:23', 'Sidney', 'NickelMarley', 1363);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100074, to_date('20-01-1970', 'dd-mm-yyyy'), '6:52', 'Gdansk', 'JesseBoorem', 1160);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100075, to_date('18-02-2024', 'dd-mm-yyyy'), '6:39', 'Hong Kong', 'ReneLange', 1232);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100076, to_date('25-08-1977', 'dd-mm-yyyy'), '2:9', 'Dearborn', 'TaraSchwarzenegger', 1119);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100077, to_date('10-07-1995', 'dd-mm-yyyy'), '2:31', 'Schenectady', 'NileRobards', 1281);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100078, to_date('31-01-1993', 'dd-mm-yyyy'), '21:17', 'San Diego', 'Mary BethPigott-Smith', 1136);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100079, to_date('26-04-1972', 'dd-mm-yyyy'), '23:18', 'Hamburg', 'ElizaLewis', 1010);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100080, to_date('05-08-2011', 'dd-mm-yyyy'), '3:35', 'Singapore', 'BillDeejay', 1228);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100081, to_date('09-06-2018', 'dd-mm-yyyy'), '14:25', 'Bingham Farms', 'HugoSampson', 1217);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100082, to_date('12-11-2018', 'dd-mm-yyyy'), '4:50', 'Torino', 'ChristianFariq', 1067);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100083, to_date('18-02-1987', 'dd-mm-yyyy'), '18:24', 'Santa Clarat', 'Carriede Lancie', 1050);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100084, to_date('25-10-1991', 'dd-mm-yyyy'), '14:58', 'Grand Rapids', 'ConnieClinton', 1157);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100085, to_date('02-06-1983', 'dd-mm-yyyy'), '4:57', 'Richmond Hill', 'JuddDeGraw', 1376);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100086, to_date('14-03-1973', 'dd-mm-yyyy'), '3:51', 'Tlalpan', 'CeCeLang', 1399);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100087, to_date('09-01-1998', 'dd-mm-yyyy'), '17:51', 'Yucca', 'HarrietFeliciano', 22);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100088, to_date('19-07-2019', 'dd-mm-yyyy'), '1:6', 'Fairfax', 'MintIdol', 1030);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100089, to_date('10-04-2007', 'dd-mm-yyyy'), '3:6', 'Dorval', 'SheenaElwes', 1374);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100090, to_date('29-12-1989', 'dd-mm-yyyy'), '1:42', 'Mito', 'BrendaSwayze', 1114);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100091, to_date('23-05-2000', 'dd-mm-yyyy'), '8:27', 'Kaysville', 'HalleCotton', 977);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100092, to_date('26-11-1994', 'dd-mm-yyyy'), '3:39', 'Richmond', 'CyndiLiu', 1105);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100093, to_date('21-06-1993', 'dd-mm-yyyy'), '13:43', 'W�rth', 'CevinMitchell', 1191);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100094, to_date('19-02-2008', 'dd-mm-yyyy'), '9:51', 'Lehi', 'GarlandConnelly', 1161);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100095, to_date('14-10-1993', 'dd-mm-yyyy'), '2:11', 'Itu', 'CameronManning', 1231);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100096, to_date('09-05-2015', 'dd-mm-yyyy'), '12:56', 'Dietikon', 'TriniPantoliano', 1174);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100097, to_date('01-11-2014', 'dd-mm-yyyy'), '12:5', 'Brampton', 'GeenaPhillippe', 1260);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100098, to_date('07-12-2017', 'dd-mm-yyyy'), '8:7', 'Toulouse', 'JosephBelles', 1144);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100099, to_date('13-12-2024', 'dd-mm-yyyy'), '5:19', 'Yomgok-dong', 'ElvisMargolyes', 1308);
commit;
prompt 100 records committed...
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100100, to_date('28-11-1971', 'dd-mm-yyyy'), '2:36', 'Derwood', 'AidaWhitman', 2);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100101, to_date('09-05-1971', 'dd-mm-yyyy'), '12:34', 'Cobham', 'DemiDawson', 1281);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100102, to_date('12-04-2001', 'dd-mm-yyyy'), '14:16', 'Alleroed', 'JoaquimLucas', 420);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100103, to_date('01-12-2008', 'dd-mm-yyyy'), '1:25', 'Glendale', 'YolandaHurt', 1125);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100104, to_date('13-02-1970', 'dd-mm-yyyy'), '9:17', 'San Ramon', 'KarenWithers', 1046);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100105, to_date('13-06-2008', 'dd-mm-yyyy'), '8:30', 'Beaverton', 'JuliannaNunn', 1066);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100106, to_date('24-08-2013', 'dd-mm-yyyy'), '22:9', 'Maidstone', 'RosanneCosta', 1374);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100107, to_date('08-12-1972', 'dd-mm-yyyy'), '0:9', 'Ben-Gurion', 'LouiseAllen', 9);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100108, to_date('13-03-1983', 'dd-mm-yyyy'), '19:57', 'Dublin', 'BradSellers', 1244);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100109, to_date('16-01-1994', 'dd-mm-yyyy'), '21:46', 'Billerica', 'JodieSchwimmer', 1166);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100110, to_date('19-11-2024', 'dd-mm-yyyy'), '3:59', 'Laguna Bbeach', 'KidRispoli', 1088);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100111, to_date('25-07-1991', 'dd-mm-yyyy'), '19:34', 'Bingham Farms', 'SteveHead', 92);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100112, to_date('07-02-2000', 'dd-mm-yyyy'), '2:16', 'El Masnou', 'MaeConnelly', 1333);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100113, to_date('09-10-1970', 'dd-mm-yyyy'), '1:4', 'Mainz-kastel', 'LaraNewton', 1354);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100114, to_date('11-10-2014', 'dd-mm-yyyy'), '6:38', 'Banbury', 'RuebenFurtado', 42);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100115, to_date('14-09-1991', 'dd-mm-yyyy'), '19:49', 'Murray', 'ThelmaHannah', 866);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100116, to_date('12-02-2005', 'dd-mm-yyyy'), '0:23', 'Winnipeg', 'ChadSingletary', 1133);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100117, to_date('15-07-1984', 'dd-mm-yyyy'), '1:21', 'Treviso', 'KennyHidalgo', 1292);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100118, to_date('05-12-2018', 'dd-mm-yyyy'), '2:43', 'Saitama', 'LiliDafoe', 1245);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100119, to_date('09-12-1992', 'dd-mm-yyyy'), '4:26', 'Highton', 'ShelbyRain', 1154);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100120, to_date('02-12-2024', 'dd-mm-yyyy'), '19:9', 'Goslar', 'DeborahDean', 1341);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100121, to_date('03-11-1975', 'dd-mm-yyyy'), '0:53', 'Kanata', 'AngelinaCostner', 1124);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100122, to_date('13-02-2007', 'dd-mm-yyyy'), '7:39', 'Belmont', 'TonyNelligan', 24);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100123, to_date('19-02-2016', 'dd-mm-yyyy'), '18:4', 'Milton Keynes', 'ChazzSedgwick', 1184);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100124, to_date('29-10-2016', 'dd-mm-yyyy'), '16:27', 'Szazhalombatta', 'DonaldIsaacs', 1386);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100125, to_date('23-10-1987', 'dd-mm-yyyy'), '19:46', 'N. ft. Myers', 'FisherBedelia', 1334);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100126, to_date('05-09-1971', 'dd-mm-yyyy'), '14:55', 'Reno', 'GarryLoggia', 1364);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100127, to_date('23-02-2016', 'dd-mm-yyyy'), '18:31', 'Nara', 'FrancesMalkovich', 1336);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100128, to_date('14-09-2000', 'dd-mm-yyyy'), '23:25', 'Sundsvall', 'SamAlbright', 1157);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100129, to_date('17-04-1993', 'dd-mm-yyyy'), '11:0', 'Bellevue', 'CherryHawke', 420);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100130, to_date('02-07-2004', 'dd-mm-yyyy'), '21:47', 'Sugar Hill', 'FirstNakai', 1247);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100131, to_date('10-08-2020', 'dd-mm-yyyy'), '22:6', 'Ringwood', 'JimmieChilton', 1356);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100132, to_date('15-10-1982', 'dd-mm-yyyy'), '20:23', 'Arlington', 'KazemBerkeley', 1304);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100133, to_date('14-11-1982', 'dd-mm-yyyy'), '8:40', 'Stavanger', 'LucyCassel', 1070);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100134, to_date('14-01-1982', 'dd-mm-yyyy'), '4:35', 'Arlington', 'DanielBates', 1096);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100135, to_date('04-05-2019', 'dd-mm-yyyy'), '16:25', 'Naestved', 'WallaceTrevino', 1005);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100136, to_date('09-11-2008', 'dd-mm-yyyy'), '12:48', 'Allen', 'AngelaReubens', 1033);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100137, to_date('19-06-2022', 'dd-mm-yyyy'), '20:49', 'Bellevue', 'NikRebhorn', 1006);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100138, to_date('08-01-2012', 'dd-mm-yyyy'), '9:39', 'Mexico City', 'DebiPenders', 20);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100139, to_date('28-03-1977', 'dd-mm-yyyy'), '16:5', 'Guelph', 'BettyRourke', 1018);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100140, to_date('17-09-2016', 'dd-mm-yyyy'), '17:21', 'Utsunomiya', 'PeaboBergen', 1224);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100141, to_date('05-05-2009', 'dd-mm-yyyy'), '22:39', 'Palo Alto', 'GavinLucien', 1079);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100142, to_date('19-04-1993', 'dd-mm-yyyy'), '18:17', 'Hilversum', 'DenisDunaway', 1286);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100143, to_date('01-10-1990', 'dd-mm-yyyy'), '9:18', 'Sant Cugat Del Valle', 'VincentStevens', 1082);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100144, to_date('20-01-2020', 'dd-mm-yyyy'), '9:22', 'Hampton', 'ClorisSarandon', 1107);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100145, to_date('11-06-1992', 'dd-mm-yyyy'), '14:5', 'Santa Fe', 'TomSavage', 1384);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100146, to_date('01-12-1991', 'dd-mm-yyyy'), '9:47', 'Stanford', 'BurtonSayer', 1159);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100147, to_date('29-06-2019', 'dd-mm-yyyy'), '14:16', 'Englewood', 'MirandaKravitz', 577);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100148, to_date('17-06-2016', 'dd-mm-yyyy'), '14:42', 'Amherst', 'VerucaRobards', 1260);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100149, to_date('07-04-1975', 'dd-mm-yyyy'), '15:51', 'Manaus', 'LeeleeSingh', 1015);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100150, to_date('14-02-2011', 'dd-mm-yyyy'), '17:5', 'Newton-le-willows', 'MirandaFolds', 888);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100151, to_date('15-12-2000', 'dd-mm-yyyy'), '19:23', 'Ankara', 'GavinLawrence', 366);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100152, to_date('15-04-2005', 'dd-mm-yyyy'), '2:8', 'South Hadley', 'CarolynSantana', 1009);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100153, to_date('17-01-2015', 'dd-mm-yyyy'), '7:33', 'Hounslow', 'CherylRapaport', 41);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100154, to_date('04-05-2012', 'dd-mm-yyyy'), '16:15', 'Woodbridge', 'MitchellBusey', 1376);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100155, to_date('26-04-2013', 'dd-mm-yyyy'), '1:38', 'Burwood East', 'HalleSimpson', 1150);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100156, to_date('03-01-1982', 'dd-mm-yyyy'), '13:37', 'Victoria', 'RhonaPaul', 35);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100157, to_date('13-12-1986', 'dd-mm-yyyy'), '17:5', 'Ashdod', 'ChakaTravolta', 1067);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100158, to_date('09-03-2011', 'dd-mm-yyyy'), '15:7', 'Hartford', 'ThomasMargulies', 1216);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100159, to_date('17-04-2022', 'dd-mm-yyyy'), '15:24', 'Coldmeece', 'RickieMazar', 757);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100160, to_date('12-09-1973', 'dd-mm-yyyy'), '3:38', 'Roanoke', 'NeveCarlton', 1279);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100161, to_date('29-06-1993', 'dd-mm-yyyy'), '20:21', 'Avon', 'GeenaWakeling', 32);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100162, to_date('07-01-1995', 'dd-mm-yyyy'), '16:51', 'Koblenz', 'GracePatton', 34);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100163, to_date('09-11-1996', 'dd-mm-yyyy'), '8:35', 'Stans', 'DabneyDef', 1391);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100164, to_date('07-04-2003', 'dd-mm-yyyy'), '20:21', 'Yokohama', 'RaulLarter', 1074);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100165, to_date('17-01-2016', 'dd-mm-yyyy'), '16:0', 'Pottendorf', 'GeneCozier', 1123);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100166, to_date('26-01-1983', 'dd-mm-yyyy'), '10:24', 'Salt Lake City', 'KeithAniston', 35);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100167, to_date('30-06-2023', 'dd-mm-yyyy'), '19:44', 'Rockford', 'LoisWilson', 1);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100168, to_date('11-03-2004', 'dd-mm-yyyy'), '21:28', 'Denver', 'JoeChoice', 1242);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100169, to_date('04-03-2012', 'dd-mm-yyyy'), '4:56', 'Farmington Hills', 'HiltonJay', 1110);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100170, to_date('25-12-1998', 'dd-mm-yyyy'), '21:11', 'Madrid', 'BrothersJohnson', 1074);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100171, to_date('14-04-2015', 'dd-mm-yyyy'), '6:21', 'Lima', 'AprilJordan', 1319);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100172, to_date('31-05-2024', 'dd-mm-yyyy'), '12:12', 'Sevilla', 'LarnelleSoul', 1312);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100173, to_date('13-03-2004', 'dd-mm-yyyy'), '7:44', 'Redding', 'JoaquimMarshall', 1085);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100174, to_date('19-02-2023', 'dd-mm-yyyy'), '22:16', 'Hilversum', 'IvanCharles', 1047);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100175, to_date('11-05-1975', 'dd-mm-yyyy'), '6:11', 'Cardiff', 'HenryMcGowan', 1129);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100176, to_date('12-05-1997', 'dd-mm-yyyy'), '22:52', 'Shelton', 'DianneGleeson', 1121);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100177, to_date('12-06-1985', 'dd-mm-yyyy'), '21:20', 'Tilburg', 'VondieSeagal', 1147);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100178, to_date('12-02-1987', 'dd-mm-yyyy'), '17:48', 'Kopavogur', 'ParkerKravitz', 1375);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100179, to_date('21-01-2017', 'dd-mm-yyyy'), '18:56', 'Biella', 'KidNegbaur', 1345);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100180, to_date('27-01-1996', 'dd-mm-yyyy'), '17:44', 'Lengdorf', 'WillOsborne', 1165);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100181, to_date('02-02-1988', 'dd-mm-yyyy'), '21:44', 'Ulsteinvik', 'ChristopherPlayboys', 1067);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100182, to_date('03-02-2019', 'dd-mm-yyyy'), '23:12', 'Ottawa', 'NeveLucien', 1127);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100183, to_date('27-09-2005', 'dd-mm-yyyy'), '9:14', 'Rockland', 'AvrilSnider', 1132);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100184, to_date('31-05-1972', 'dd-mm-yyyy'), '11:20', 'Bernex', 'BeverleyO''Keefe', 1133);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100185, to_date('05-08-2018', 'dd-mm-yyyy'), '12:7', 'Takapuna', 'DennyBroderick', 1236);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100186, to_date('22-11-1996', 'dd-mm-yyyy'), '13:34', 'New orleans', 'BrendanRoberts', 1356);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100187, to_date('06-03-1990', 'dd-mm-yyyy'), '15:17', 'Lucca', 'LouKelly', 1021);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100188, to_date('12-04-1990', 'dd-mm-yyyy'), '8:51', 'Uden', 'FreddieChaplin', 1264);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100189, to_date('15-10-2005', 'dd-mm-yyyy'), '16:13', 'Ricardson', 'ColeySarsgaard', 4);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100190, to_date('22-11-1987', 'dd-mm-yyyy'), '16:39', 'New Delhi', 'GenaRoth', 727);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100191, to_date('01-06-1994', 'dd-mm-yyyy'), '2:15', 'Waite Park', 'CrystalGill', 6);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100192, to_date('08-10-1987', 'dd-mm-yyyy'), '20:47', 'Webster Groves', 'Jean-ClaudeSirtis', 20);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100193, to_date('22-12-1982', 'dd-mm-yyyy'), '4:57', 'Nagoya', 'AnnVisnjic', 1049);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100194, to_date('22-10-1970', 'dd-mm-yyyy'), '21:33', 'Durham', 'ColeWesterberg', 1314);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100195, to_date('20-01-1978', 'dd-mm-yyyy'), '22:3', 'Pecs', 'JoannaHamilton', 1277);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100196, to_date('08-08-1986', 'dd-mm-yyyy'), '5:46', 'South Hadley', 'AllisonBranch', 1348);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100197, to_date('13-11-1971', 'dd-mm-yyyy'), '12:29', 'Peine', 'MorganConlee', 1386);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100198, to_date('18-10-1971', 'dd-mm-yyyy'), '10:47', 'Westfield', 'TreyJeter', 1310);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100199, to_date('17-02-2023', 'dd-mm-yyyy'), '2:52', 'Highlands Ranch', 'JamieSevigny', 1020);
commit;
prompt 200 records committed...
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100200, to_date('28-05-1974', 'dd-mm-yyyy'), '6:6', 'Derwood', 'RobShelton', 1193);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100201, to_date('07-09-2006', 'dd-mm-yyyy'), '6:24', 'Port Macquarie', 'JesseNelson', 919);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100202, to_date('21-02-1987', 'dd-mm-yyyy'), '14:35', 'Coburg', 'TreatMifune', 1148);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100203, to_date('25-01-1984', 'dd-mm-yyyy'), '23:1', 'Holliston', 'ChaleeCronin', 1333);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100204, to_date('08-12-2015', 'dd-mm-yyyy'), '19:37', 'Northbrook', 'SpikeZane', 1279);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100205, to_date('16-12-1973', 'dd-mm-yyyy'), '5:13', 'Lodi', 'JimmyLaBelle', 1175);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100206, to_date('21-12-2016', 'dd-mm-yyyy'), '6:29', 'Valencia', 'BruceHector', 1394);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100207, to_date('25-04-1974', 'dd-mm-yyyy'), '19:2', 'Wien', 'MurraySwayze', 1151);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100208, to_date('16-03-2019', 'dd-mm-yyyy'), '0:44', 'Rockville', 'CarlaBranch', 1341);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100209, to_date('05-07-1978', 'dd-mm-yyyy'), '20:12', 'Ciudad del Este', 'IvanOsment', 1387);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100210, to_date('18-08-1987', 'dd-mm-yyyy'), '3:59', 'Newbury', 'FredFoley', 565);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100211, to_date('15-10-2023', 'dd-mm-yyyy'), '17:27', 'Amarillo', 'RuebenMohr', 1015);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100212, to_date('07-09-1985', 'dd-mm-yyyy'), '17:10', 'Firenze', 'NeilBurns', 420);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100213, to_date('09-06-2004', 'dd-mm-yyyy'), '22:47', 'Bristol', 'WillieRussell', 1279);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100214, to_date('20-09-1978', 'dd-mm-yyyy'), '2:4', 'Neuquen', 'BrendaBrooke', 1125);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100215, to_date('02-03-1991', 'dd-mm-yyyy'), '10:21', 'Naha', 'MickySalt', 1328);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100216, to_date('30-09-1975', 'dd-mm-yyyy'), '6:33', 'Ashland', 'SallyMakeba', 9);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100217, to_date('24-01-1976', 'dd-mm-yyyy'), '17:55', 'Curitiba', 'TreyDooley', 39);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100218, to_date('10-01-1999', 'dd-mm-yyyy'), '0:55', 'San Jose', 'GuyHurt', 1287);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100219, to_date('21-09-2018', 'dd-mm-yyyy'), '8:0', 'Elkins Park', 'SeannBoothe', 1073);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100220, to_date('15-06-1991', 'dd-mm-yyyy'), '4:0', 'Yomgok-dong', 'BretGough', 1332);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100221, to_date('28-02-1991', 'dd-mm-yyyy'), '10:52', 'The Woodlands', 'AnitaWiedlin', 1122);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100222, to_date('22-05-2010', 'dd-mm-yyyy'), '22:51', 'Trento', 'BretMcCracken', 1075);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100223, to_date('27-11-2002', 'dd-mm-yyyy'), '16:32', 'Cle Elum', 'ManuFender', 862);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100224, to_date('11-04-1996', 'dd-mm-yyyy'), '21:49', 'Nuernberg', 'AngelinaSnow', 1276);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100225, to_date('04-01-1976', 'dd-mm-yyyy'), '0:27', 'Lengdorf', 'RachaelDe Almeida', 1243);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100226, to_date('03-11-1980', 'dd-mm-yyyy'), '15:4', 'Lodi', 'ScarlettSatriani', 1168);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100227, to_date('12-12-1981', 'dd-mm-yyyy'), '20:16', 'Petach-Tikva', 'MachineAykroyd', 1233);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100228, to_date('13-11-2016', 'dd-mm-yyyy'), '22:2', 'Ottawa', 'MarleyLipnicki', 1212);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100229, to_date('16-04-1991', 'dd-mm-yyyy'), '23:49', 'Mogliano Veneto', 'TaraUnger', 1011);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100230, to_date('28-12-2020', 'dd-mm-yyyy'), '12:13', 'Porto alegre', 'JulianneKudrow', 1240);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100231, to_date('05-07-1991', 'dd-mm-yyyy'), '20:14', 'Soest', 'AidanKotto', 1292);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100232, to_date('18-04-2012', 'dd-mm-yyyy'), '20:2', 'South Hadley', 'RhettSecada', 1330);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100233, to_date('18-08-2014', 'dd-mm-yyyy'), '2:12', 'University', 'RonnyDef', 888);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100234, to_date('28-01-1973', 'dd-mm-yyyy'), '10:15', 'Tlalpan', 'JoanWinter', 1189);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100235, to_date('20-08-1971', 'dd-mm-yyyy'), '5:21', 'Crete', 'WoodyDillon', 1273);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100236, to_date('29-06-1977', 'dd-mm-yyyy'), '9:50', 'Riverdale', 'LeeDiaz', 398);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100237, to_date('01-05-1972', 'dd-mm-yyyy'), '20:42', 'Barksdale afb', 'ArmandRusso', 291);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100238, to_date('16-10-1975', 'dd-mm-yyyy'), '3:10', 'Daejeon', 'SharonMars', 1257);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100239, to_date('24-03-1978', 'dd-mm-yyyy'), '16:55', 'Zipf', 'EttaAffleck', 1302);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100240, to_date('01-10-2021', 'dd-mm-yyyy'), '4:42', 'Belp', 'AmyReid', 1272);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100241, to_date('08-07-1986', 'dd-mm-yyyy'), '4:49', 'Uetikon am See', 'WillieKirshner', 590);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100242, to_date('26-09-2017', 'dd-mm-yyyy'), '2:45', 'Bedfordshire', 'PhilipTinsley', 1130);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100243, to_date('08-09-1980', 'dd-mm-yyyy'), '17:0', 'Fair Lawn', 'DeborahArnold', 1003);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100244, to_date('19-08-1978', 'dd-mm-yyyy'), '14:34', 'Saudarkrokur', 'JaimeConlee', 1229);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100245, to_date('04-02-1998', 'dd-mm-yyyy'), '3:15', 'Paramus', 'TreySossamon', 1228);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100246, to_date('11-11-2002', 'dd-mm-yyyy'), '18:42', 'M�nster', 'AmyRush', 935);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100247, to_date('01-06-2010', 'dd-mm-yyyy'), '0:33', 'Hartmannsdorf', 'GarlandBruce', 1113);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100248, to_date('20-01-1981', 'dd-mm-yyyy'), '8:10', 'Walnut Creek', 'KittyIrons', 1201);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100249, to_date('25-03-1985', 'dd-mm-yyyy'), '10:51', 'Flushing', 'CrispinHagar', 1132);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100250, to_date('01-03-2002', 'dd-mm-yyyy'), '23:23', 'Dresden', 'CarrieDench', 733);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100251, to_date('18-06-1987', 'dd-mm-yyyy'), '0:40', 'Manchester', 'KirkFeore', 1175);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100252, to_date('23-02-1977', 'dd-mm-yyyy'), '22:11', 'Ohtsu', 'JenniferClark', 1253);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100253, to_date('16-10-2016', 'dd-mm-yyyy'), '13:40', 'Albany', 'JeffreyBoyle', 1177);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100254, to_date('08-09-1993', 'dd-mm-yyyy'), '8:32', 'Carson City', 'RandallThorton', 1335);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100255, to_date('24-11-1992', 'dd-mm-yyyy'), '11:2', 'K�ln', 'CollectiveChao', 1282);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100256, to_date('29-07-1999', 'dd-mm-yyyy'), '16:3', 'Cincinnati', 'HeatherPiven', 1206);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100257, to_date('20-02-1997', 'dd-mm-yyyy'), '17:32', 'Goiania', 'ClaudeMcLachlan', 214);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100258, to_date('19-05-2012', 'dd-mm-yyyy'), '5:1', 'Coppell', 'LarnelleNightingale', 1370);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100259, to_date('16-11-2024', 'dd-mm-yyyy'), '13:34', 'Happy Valley', 'MorganFranks', 1359);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100260, to_date('02-12-1973', 'dd-mm-yyyy'), '21:33', 'Freiburg', 'OssieTucker', 1014);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100261, to_date('25-04-1973', 'dd-mm-yyyy'), '4:52', 'Z�rich', 'NatashaPosener', 1185);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100262, to_date('28-04-1985', 'dd-mm-yyyy'), '18:56', 'Amherst', 'SethSwayze', 1390);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100263, to_date('30-11-2017', 'dd-mm-yyyy'), '7:30', 'Sao paulo', 'RonnieDoucette', 1339);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100264, to_date('23-06-1991', 'dd-mm-yyyy'), '21:13', 'Athens', 'ViggoYoung', 1161);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100265, to_date('14-10-2001', 'dd-mm-yyyy'), '16:27', 'Pittsburgh', 'LukeSquier', 705);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100266, to_date('25-11-2023', 'dd-mm-yyyy'), '0:52', 'Lefkosa', 'JoeyKimball', 1187);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100267, to_date('14-03-2006', 'dd-mm-yyyy'), '22:49', 'Taoyuan', 'FirstUggams', 1046);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100268, to_date('18-10-2013', 'dd-mm-yyyy'), '3:16', 'Glen Cove', 'KateLovitz', 1274);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100269, to_date('07-04-1978', 'dd-mm-yyyy'), '3:1', 'Germantown', 'AlbertDiCaprio', 1387);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100270, to_date('07-11-1991', 'dd-mm-yyyy'), '11:51', 'Maebashi', 'WinonaEastwood', 1057);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100271, to_date('11-07-1996', 'dd-mm-yyyy'), '15:18', 'Longview', 'JonathanPalmer', 1267);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100272, to_date('14-04-2022', 'dd-mm-yyyy'), '16:4', 'Alcobendas', 'IcePleasure', 1102);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100273, to_date('07-03-2010', 'dd-mm-yyyy'), '1:39', 'Miyazaki', 'CharlieKramer', 1115);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100274, to_date('24-04-2010', 'dd-mm-yyyy'), '21:12', 'Silverdale', 'GailardHoskins', 1137);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100275, to_date('22-06-1999', 'dd-mm-yyyy'), '15:21', 'Maebashi', 'AliHall', 634);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100276, to_date('25-06-1996', 'dd-mm-yyyy'), '23:4', 'Port Macquarie', 'NenehBiel', 1312);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100277, to_date('15-11-1984', 'dd-mm-yyyy'), '14:22', 'Biel', 'SamuelYulin', 1041);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100278, to_date('11-07-1984', 'dd-mm-yyyy'), '2:55', 'Laurel', 'MitchellUnion', 1200);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100279, to_date('07-05-2003', 'dd-mm-yyyy'), '4:31', 'Granada Hills', 'LaurenceSisto', 1210);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100280, to_date('07-06-1988', 'dd-mm-yyyy'), '1:21', 'Springfield', 'EmilioMcGowan', 1227);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100281, to_date('22-08-1998', 'dd-mm-yyyy'), '15:1', 'Walnut Creek', 'MintHarry', 1274);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100282, to_date('27-02-1984', 'dd-mm-yyyy'), '22:32', 'Chiba', 'AustinBiel', 11);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100283, to_date('02-03-1998', 'dd-mm-yyyy'), '14:22', 'Lexington', 'RobbieNielsen', 1365);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100284, to_date('05-06-2000', 'dd-mm-yyyy'), '16:13', 'Kwun Tong', 'DarylWeber', 1345);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100285, to_date('24-12-1990', 'dd-mm-yyyy'), '8:38', 'Uetikon am See', 'TracyLoeb', 1386);
insert into SHIFTS (shift_id, daate, start_time, loocation, shift_leader, event_id)
values (100286, to_date('09-05-2007', 'dd-mm-yyyy'), '0:22', 'Antwerpen', 'PetulaPlace', 28);
commit;
prompt 287 records loaded
prompt Loading VOLUNTEERROLE...
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 4, 10000242);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 4, 10000017);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 2, 10000168);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 2, 10000211);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 6, 10000000);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 6, 10000276);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 6, 10000134);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 3, 10000197);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 3, 10000043);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 5, 10000090);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 5, 10000024);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 1, 10000126);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 5, 10000328);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 3, 10000310);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 4, 10000254);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('center_manager', 5, 10000252);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 5, 10000199);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 5, 10000191);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 4, 10000130);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 6, 10000346);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 2, 10000279);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('center_manager', 3, 10000001);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 2, 10000042);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 1, 10000330);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('center_manager', 4, 10000194);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 5, 10000142);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 1, 10000337);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 2, 10000067);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 6, 10000287);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 5, 10000396);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 1, 10000093);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 2, 10000365);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 2, 10000321);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 6, 10000203);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 2, 10000231);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 3, 10000155);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 3, 10000340);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 1, 10000176);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 1, 10000380);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 1, 10000092);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('center_manager', 6, 10000080);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 5, 10000356);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 5, 10000167);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 6, 10000142);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('center_manager', 3, 10000297);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 3, 10000015);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 4, 10000098);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 1, 10000007);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 3, 10000213);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 4, 10000319);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 6, 10000136);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 6, 10000145);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 3, 10000232);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 4, 10000048);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 5, 10000138);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 2, 10000044);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 3, 10000351);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 2, 10000286);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('center_manager', 5, 10000042);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 4, 10000106);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 5, 10000394);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 4, 10000080);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 4, 10000182);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 1, 10000388);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 4, 10000300);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 2, 10000387);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 6, 10000215);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 5, 10000371);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 1, 10000006);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 4, 10000103);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 6, 10000032);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 1, 10000002);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 1, 10000141);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 3, 10000081);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 3, 10000150);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 2, 10000373);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 1, 10000077);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 1, 10000354);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 5, 10000351);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 6, 10000086);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 3, 10000358);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 6, 10000264);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 1, 10000261);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('center_manager', 3, 10000263);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 4, 10000244);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 1, 10000089);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 2, 10000040);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 6, 10000061);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 4, 10000396);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 2, 10000111);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('center_manager', 5, 10000271);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 3, 10000244);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 5, 10000039);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 2, 10000281);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 5, 10000232);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 5, 10000071);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 2, 10000033);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 4, 10000238);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 5, 10000218);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('center_manager', 4, 10000050);
commit;
prompt 100 records committed...
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 5, 10000179);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 4, 10000248);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 3, 10000117);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 6, 10000022);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 1, 10000394);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 4, 10000192);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 2, 10000095);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 1, 10000132);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 6, 10000286);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 2, 10000203);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 3, 10000193);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 3, 10000332);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 6, 10000169);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 5, 10000259);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('center_manager', 2, 10000106);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 4, 10000184);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('center_manager', 4, 10000224);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 3, 10000132);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 5, 10000129);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 2, 10000017);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 3, 10000274);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 2, 10000010);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('customer_service', 6, 10000352);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 6, 10000184);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 6, 10000268);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 2, 10000192);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('center_manager', 3, 10000074);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 6, 10000097);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 1, 10000130);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 2, 10000358);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 4, 10000343);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 3, 10000366);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 6, 10000095);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 2, 10000236);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('ambulance_driver', 4, 10000171);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('center_manager', 6, 10000330);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('center_manager', 1, 10000362);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('paramedic', 5, 10000348);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('trainee', 6, 10000332);
insert into VOLUNTEERROLE (rolename, role_id, volunteer_id)
values ('taking_blood', 1, 10000112);
commit;
prompt 140 records loaded
prompt Loading VOLUNTEERS...
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000000, 'Julianna', 'Perry', '7 Meg Road', 17462411, 'jperry@trusecure.com', 4, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000001, 'Gran', 'Valentin', '27 Houston Street', 39069259, 'gran@target.com', 3, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000002, 'Casey', 'Singletary', '92 Ani Ave', 51696936, 'casey.singletary@aristotle.uk', 2, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000003, 'Jamie', 'Sanders', '325 Augst Road', 56906103, 'jamie.sanders@avr.il', 6, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000004, 'Keanu', 'Diffie', '81st Street', 43372043, 'keanu.d@trekequipment.uk', 6, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000005, 'Wes', 'McCormack', '839 Finney Road', 73661059, 'wes.mccormack@monarchcasino.com', 4, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000006, 'Fiona', 'Mortensen', '23 Belle Road', 54128173, 'fiona@idas.tw', 4, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000007, 'Clint', 'Pride', '98 Lari Street', 51170561, 'clint.pride@spenser.com', 6, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000008, 'Daniel', 'Ojeda', '66 Rick', 12018085, 'daniel.o@unitedasset.at', 6, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000009, 'Ernest', 'Dalton', '96 Carole', 24233289, 'ernestd@asa.uk', 2, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000010, 'Edwin', 'Quatro', '33 Trevino Drive', 64381578, 'edwin@mls.nl', 2, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000011, 'Murray', 'Khan', '24 Van Der Beek Road', 84843999, 'murray.k@kramontrealty.de', 2, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000012, 'Brent', 'Berkley', '937 West Monroe Street', 55892994, 'brent.berkley@americanvanguard.com', 5, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000013, 'Kenny', 'Brooke', '50 Connick', 74924388, 'kenny@hatworld.com', 2, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000014, 'Wally', 'Whitley', '8 Springfield Ave', 80330366, 'wally.whitley@capitolbancorp.com', 6, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000015, 'Daniel', 'Latifah', '72 Elisabeth Drive', 53402222, 'daniel.latifah@callhenry.jp', 6, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000016, 'Curt', 'Roy Parnell', '29 Heatherly Street', 44171443, 'c.royparnell@softworld.it', 2, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000017, 'Lili', 'Green', '99 Cottbus Road', 13934536, 'l.green@hardwoodwholesalers.com', 1, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000018, 'Julia', 'Folds', '97 Rosco Road', 44157539, 'julia.folds@sfmai.it', 4, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000019, 'Paul', 'Curtis', '81 Forster Road', 20207511, 'pcurtis@viacom.jp', 2, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000020, 'Rosario', 'Dillane', '452 Mason Road', 73605432, 'rosario.d@americanexpress.mx', 3, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000021, 'Tal', 'Fehr', '53rd Street', 89567629, 'tal.fehr@prahs.com', 2, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000022, 'Danni', 'Thompson', '43rd Street', 16742505, 'danni.thompson@intraspheretechnologies.se', 6, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000023, 'Mia', 'Morrison', '85 Mahoney Road', 76022415, 'mmorrison@idas.com', 4, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000024, 'Ice', 'Craddock', '28 Douglas Road', 15050059, 'ice.craddock@harrison.com', 1, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000025, 'Glen', 'McCabe', '85 Osaka', 56019926, 'glen.mccabe@cardinalcartridge.com', 5, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000026, 'Hank', 'Azaria', '12 Monroe Street', 66930582, 'hank.azaria@kingston.com', 3, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000027, 'Jonathan', 'Jovovich', '82nd Street', 18895373, 'jonathan@marsinc.com', 2, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000028, 'Minnie', 'Thorton', '64 M�nchen Street', 27137296, 'minnie.t@clubone.it', 5, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000029, 'Jeroen', 'Lee', '20 Essex Street', 52054294, 'jeroen.lee@zaiqtechnologies.com', 2, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000030, 'Jeffery', 'Feuerstein', '59 Spacek Ave', 99193129, 'jfeuerstein@sears.jp', 3, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000031, 'Nicole', 'Sweet', '301 Perlman Blvd', 16574981, 'nicole.s@magnet.com', 5, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000032, 'Cheech', 'Nakai', '38 Ewan', 41871766, 'cheech.nakai@curagroup.com', 1, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000033, 'Norm', 'Allen', '4 Lakewood Drive', 84989788, 'norm.allen@wrgservices.com', 5, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000034, 'Lonnie', 'Gooding', '45 Malone Blvd', 84514281, 'lonnie.g@veritekinternational.de', 4, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000035, 'Karen', 'Pitt', '81 Chaka Blvd', 50476049, 'karen.pitt@cooktek.com', 1, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000036, 'Petula', 'Thewlis', '53 Maggie Ave', 11764695, 'p.thewlis@insurmark.com', 3, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000037, 'Heath', 'Blaine', '60 Gettysburg Drive', 38387264, 'heath.blaine@at.de', 3, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000038, 'Moe', 'Gill', '61 Adkins', 69124888, 'moeg@gagwear.dk', 4, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000039, 'Katie', 'Benson', '4 Idol Blvd', 88587385, 'katie.benson@sony.pt', 5, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000040, 'Brooke', 'Hawkins', '24 England Road', 35359643, 'brooke.hawkins@shirtfactory.com', 2, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000041, 'Kyra', 'Polito', '93 Madsen Street', 92451544, 'kyra.polito@studiobproductions.com', 1, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000042, 'Jean-Claude', 'Davies', '541 Ben Road', 99389818, 'jeanclaude.d@swp.com', 1, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000043, 'Desmond', 'Gold', '5 Lemmon', 21970488, 'desmond.gold@bayer.com', 2, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000044, 'Colm', 'Keith', '71 Downie Drive', 46323410, 'c.keith@mitsubishimotors.au', 6, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000045, 'Sonny', 'Neil', '43 Craig Street', 67588054, 'sonny.neil@logisticare.com', 5, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000046, 'Trace', 'Hewett', '85 Giancarlo Road', 99121803, 'trace.hewett@invisioncom.com', 6, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000047, 'Kenneth', 'Gayle', '25 Paris Drive', 44633056, 'kenneth.gayle@iss.cz', 6, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000048, 'Nathan', 'Stuart', '16 Cedar Rapids Street', 23922847, 'nathan.stuart@keymark.de', 3, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000049, 'Marley', 'Farrell', '14 Anita Road', 28050232, 'marley.farrell@mds.com', 4, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000050, 'Franco', 'Wine', '56 Dourif Road', 75629932, 'franco.wine@boldtechsystems.ch', 4, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000051, 'Carla', 'Ball', '58 Klein', 62007518, 'carla.ball@democracydata.de', 4, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000052, 'Nelly', 'Fishburne', '203 Astin Street', 37137116, 'n.fishburne@fra.at', 2, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000053, 'Jeff', 'Sawa', '679 Branagh Street', 43104909, 'jeff.sawa@sm.br', 5, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000054, 'Lydia', 'Plimpton', '70 Christie Street', 60925578, 'lydia.plimpton@amerisourcefunding.hu', 4, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000055, 'Humberto', 'Oakenfold', '29 Lathrop Street', 27973036, 'humberto.o@oneidafinancial.ch', 4, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000056, 'Garland', 'Duncan', '74 Diehl Street', 77729766, 'garlandd@drinkmorewater.be', 3, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000057, 'Domingo', 'Myers', '32 Austin Street', 97571160, 'domingo.myers@creditorsinterchange.com', 3, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000058, 'Cloris', 'Blair', '16 Haysbert Street', 81585884, 'cloris.blair@lindin.nl', 3, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000059, 'Sean', 'Byrne', '60 Stiles Street', 51208413, 'sean.byrne@progressivedesigns.ca', 5, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000060, 'Giancarlo', 'Llewelyn', '4 Silverman Ave', 18198572, 'gllewelyn@amerisourcefunding.nl', 2, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000061, 'Tara', 'Sylvian', '92 Winger Blvd', 26921739, 'tara@advertisingventures.com', 1, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000062, 'Jesse', 'Collette', '91 Borgnine Ave', 70675014, 'jesse.collette@mavericktechnologies.com', 2, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000063, 'Peabo', 'Chao', '100 Robby', 52745696, 'peabo.chao@wellsfinancial.ch', 1, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000064, 'LeVar', 'McGregor', '52nd Street', 74813327, 'levar.m@heritagemicrofilm.com', 6, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000065, 'Marisa', 'Craig', '2 Jay Street', 43145863, 'marisa.craig@ams.com', 1, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000066, 'Carolyn', 'Creek', '97 Eastwood', 55048540, 'carolyn@teamstudio.br', 3, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000067, 'Merillee', 'Morrison', '73rd Street', 10253480, 'merillee.m@kis.com', 4, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000068, 'Juan', 'Blades', '53rd Street', 32585302, 'juanb@montpelierplastics.za', 2, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000069, 'Harry', 'Payne', '326 Dabney Drive', 59727858, 'harryp@cendant.ch', 5, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000070, 'Delroy', 'Broza', '12 Tara Street', 89388653, 'delroy.broza@evinco.com', 3, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000071, 'Seth', 'Mellencamp', '36 New Haven Street', 16669038, 's.mellencamp@bluffcitysteel.de', 2, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000072, 'Mira', 'Sandoval', '405 Ojeda Street', 17346590, 'miras@kimberlyclark.it', 5, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000073, 'Henry', 'Redford', '52 Moore', 64268624, 'henry.redford@pib.br', 1, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000074, 'Burt', 'Woods', '79 Marianne', 63120284, 'burt.woods@fflcbancorp.com', 3, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000075, 'Allan', 'Schiff', '32 Hershey Road', 34492590, 'allan.schiff@cima.at', 6, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000076, 'Gin', 'Ojeda', '24 Balk', 27684872, 'gin.o@kellogg.com', 2, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000077, 'Meryl', 'Roy Parnell', '673 Garcia Street', 77236708, 'meryl.royparnell@stiknowledge.be', 5, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000078, 'Ray', 'Christie', '6 Hoskins Road', 61549716, 'ray@clubone.de', 4, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000079, 'Kris', 'Singletary', '43 Chapman Ave', 54270524, 'kris@nha.com', 1, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000080, 'Ming-Na', 'Nightingale', '34 Holden Drive', 51334236, 'mingnan@progressivemedical.com', 6, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000081, 'Corey', 'O''Connor', '16 Wincott Drive', 61794676, 'corey.oconnor@tropicaloasis.ch', 6, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000082, 'Rita', 'Navarro', '14 Mobile Road', 84601273, 'rita.navarro@sht.com', 6, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000083, 'Denny', 'Pacino', '191 Gettysburg Road', 66538321, 'dpacino@virbac.com', 4, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000084, 'Kieran', 'Evett', '23 Jovovich Blvd', 23179119, 'k.evett@spinnakerexploration.jp', 1, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000085, 'Mark', 'Hutch', '26 Wariner Road', 94001465, 'mark.hutch@myricom.de', 6, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000086, 'April', 'Coyote', '51st Street', 41402153, 'acoyote@walmartstores.au', 2, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000087, 'Arturo', 'Carrack', '5 Bentley Road', 21845340, 'arturo.c@daimlerchrysler.be', 4, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000088, 'Chet', 'Fisher', '71 Changwon-si Ave', 54894457, 'chet.fisher@lms.pt', 3, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000089, 'Rueben', 'Osborne', '64 Kane Road', 41798638, 'ruebeno@appriss.com', 6, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000090, 'John', 'Azaria', '42 Carolyn', 98662827, 'johna@millersystems.jp', 4, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000091, 'Fats', 'Bugnon', '22nd Street', 82019988, 'fats@comglobalsystems.com', 1, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000092, 'Nikki', 'Linney', '29 Haysbert Road', 52742511, 'n.linney@otbd.ar', 3, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000093, 'Joshua', 'Broadbent', '11 Or-yehuda Road', 76816857, 'joshua.broadbent@y2marketing.uk', 2, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000094, 'Joaquin', 'Ojeda', '51 West Chester', 29504907, 'joaquin.o@proclarity.nz', 3, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000095, 'Suzanne', 'Boothe', '81 Heron Street', 18039376, 'suzanne.boothe@dataprise.ch', 4, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000096, 'Kurtwood', 'Bailey', '64 Christie Ave', 74491933, 'k.bailey@nike.br', 5, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000097, 'Miko', 'Leguizamo', '411 Remy', 17838727, 'miko.leguizamo@chhc.com', 2, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000098, 'Danny', 'Farris', '28 Walter Street', 53659385, 'danny.farris@aquascapedesigns.com', 4, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000099, 'Cheech', 'Rhodes', '42nd Street', 35904609, 'cheech.rhodes@ppr.tr', 5, 'center manager', 'done');
commit;
prompt 100 records committed...
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000100, 'Sander', 'Tambor', '11 Rea Street', 60151204, 'sander.tambor@qssgroup.ca', 6, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000101, 'Rip', 'Cole', '3 Eat World Road', 90744247, 'rip@microtek.com', 1, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000102, 'Connie', 'Berenger', '74 Richards Ave', 28623523, 'c.berenger@capital.com', 2, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000103, 'Rich', 'Holly', '39 Fiona Road', 92580663, 'rich@ris.com', 3, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000104, 'Madeleine', 'Myers', '7 South Weber Street', 51130426, 'madeleine.myers@vesta.com', 1, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000105, 'Christopher', 'Balk', '212 Sant Cugat Del Valle Road', 12713753, 'christopher.balk@epiqsystems.com', 4, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000106, 'Juice', 'Costello', '85 Koufu Ave', 64667528, 'juice.costello@loreal.de', 4, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000107, 'Sharon', 'Weston', '28 Bobby Blvd', 77649762, 'sharon.w@ceom.at', 6, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000108, 'Andrea', 'Briscoe', '37 Bill Street', 53712921, 'andrea.briscoe@jma.be', 2, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000109, 'Salma', 'Studi', '8 Armand Road', 21399995, 'salmas@meridiangold.jp', 6, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000110, 'Warren', 'Union', '87 Anna Road', 57117448, 'warren.union@generalmills.jp', 1, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000111, 'Murray', 'Dorn', '867 Chad Street', 87233261, 'murray.dorn@neogen.nl', 2, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000112, 'Saffron', 'Glenn', '61 Ifans Blvd', 33230950, 'saffron.glenn@sds.com', 6, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000113, 'Lloyd', 'Sawa', '92 Mewes Street', 31918016, 'lloyd.sawa@questarcapital.za', 4, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000114, 'Ray', 'Evans', '24 Jeremy Ave', 41966842, 'raye@diageo.de', 6, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000115, 'Whoopi', 'Parm', '57 Morioka Blvd', 49749530, 'whoopi.parm@monitronicsinternational.com', 4, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000116, 'Boyd', 'Lennix', '65 Kyunnam', 76057514, 'b.lennix@clorox.ch', 4, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000117, 'Phil', 'Costa', '31 Polley Road', 73872222, 'phil.costa@mosaic.com', 3, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000118, 'Maceo', 'Caine', '73rd Street', 26194509, 'maceo.caine@catamount.com', 3, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000119, 'Gaby', 'Chao', '43 Janssen Ave', 12300214, 'gabyc@sensortechnologies.de', 3, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000120, 'Barry', 'Squier', '37 San Dimas Street', 81472305, 'barry.squier@serentec.jp', 4, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000121, 'Clive', 'Stamp', '62 Schwimmer Street', 63913135, 'clive.stamp@prosum.br', 1, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000122, 'Omar', 'Diffie', '51 Benoit Road', 50384490, 'omar@trainersoft.com', 1, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000123, 'Trace', 'Colin Young', '77 Ciudad del Este Ave', 23512078, 'trace.colinyoung@ctg.com', 5, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000124, 'Donal', 'DeLuise', '65 Smith Road', 39329530, 'ddeluise@gdatechnologies.is', 6, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000125, 'Howard', 'Spader', '88 Percy Ave', 94314421, 'hspader@smi.com', 5, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000126, 'Cornell', 'Kotto', '844 Campinas', 24115727, 'c.kotto@creditorsinterchange.com', 1, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000127, 'Gates', 'Coleman', '55 Solikamsk Street', 24733700, 'gates.coleman@tilsonlandscape.ch', 1, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000128, 'Rick', 'Klein', '89 Richard Street', 32251054, 'rick@capitalbank.in', 1, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000129, 'Ani', 'Watley', '32nd Street', 29425686, 'ani@ultimus.jp', 4, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000130, 'Hikaru', 'Crystal', '47 Roth Road', 24439303, 'hikaru.crystal@coadvantageresources.com', 5, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000131, 'Lou', 'Marin', '40 Hayek Blvd', 56228845, 'lou.marin@americanland.com', 3, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000132, 'Chaka', 'Aglukark', '92nd Street', 90995481, 'chaka@commworks.br', 4, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000133, 'Forest', 'Rosas', '11 Hugh Drive', 59491426, 'forest@aquickdelivery.com', 5, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000134, 'Frank', 'Branagh', '101 Regensburg Drive', 95150763, 'frank.b@career.com', 1, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000135, 'Seth', 'Bello', '12 Larnelle Blvd', 91253058, 'seth.bello@greenmountain.com', 4, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000136, 'Jimmie', 'Belles', '28 Newnan Ave', 40875274, 'jimmie.belles@cowlitzbancorp.uk', 5, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000137, 'Jamie', 'McDowall', '47 Sampson Blvd', 79423967, 'jamie.m@scooterstore.au', 2, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000138, 'Richard', 'Rickman', '82 McBride Road', 76866826, 'rrickman@at.com', 1, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000139, 'Javon', 'Li', '11 Freeman Blvd', 36560797, 'javon.li@cws.ch', 3, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000140, 'Miko', 'Lloyd', '87 O''Keefe Road', 44479692, 'miko.lloyd@woronocobancorp.com', 1, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000141, 'Dylan', 'Mortensen', '21st Street', 37069363, 'dylan.mortensen@johnkeeler.mx', 4, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000142, 'Maggie', 'Thomson', '90 Chris Blvd', 37977770, 'maggie.thomson@kingland.com', 1, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000143, 'Parker', 'Prinze', '517 Elias Drive', 21361830, 'parker.prinze@labradanutrition.br', 4, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000144, 'Russell', 'Spiner', '58 Nancy Ave', 88505477, 'russell@tlsservicebureau.fr', 1, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000145, 'Charlie', 'Richardson', '76 Whitwam', 35596993, 'charlier@knightsbridge.ca', 4, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000146, 'Larnelle', 'Rains', '45 Head Road', 72442153, 'larnelle.r@stonetechprofessional.jp', 1, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000147, 'Lois', 'McFadden', '6 Bonham Road', 99962437, 'lois.mcfadden@loreal.com', 6, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000148, 'Loreena', 'Knight', '43rd Street', 77565419, 'loreena.knight@smartdrawcom.com', 6, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000149, 'Faye', 'Mohr', '72nd Street', 27376892, 'faye@kellogg.de', 6, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000150, 'Fionnula', 'Remar', '78 Cromwell Street', 86410825, 'fionnular@ghrsystems.jp', 3, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000151, 'Jason', 'Paltrow', '76 Sobieski Road', 89437706, 'jason@verizon.uk', 4, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000152, 'Alex', 'Connelly', '48 Saint-vincent-de-dur', 33035395, 'alex.connelly@owm.br', 1, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000153, 'Edward', 'Leigh', '27 Cobbs Street', 20736381, 'eleigh@bradleypharmaceuticals.au', 3, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000154, 'Collin', 'McCabe', '11st Street', 98808882, 'cmccabe@timberlanewoodcrafters.com', 5, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000155, 'Elisabeth', 'Caviezel', '79 Wright Ave', 44720495, 'e.caviezel@accucode.it', 1, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000156, 'Alfie', 'Tyson', '16 Evans Road', 61514897, 'alfiet@palmbeachtan.cn', 5, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000157, 'Terence', 'Abraham', '688 Mattea Drive', 58379462, 'terence.abraham@telesynthesis.jp', 2, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000158, 'Woody', 'Harris', '61 Rickman Ave', 86077587, 'woody.harris@atlanticcredit.com', 1, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000159, 'Molly', 'Everett', '78 Waltham Street', 99344329, 'molly.everett@spas.com', 1, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000160, 'Lea', 'Hirsch', '34 Peterson Street', 40581955, 'lea.h@vfs.com', 6, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000161, 'James', 'Porter', '22 Kadison Street', 87784119, 'james.porter@gillani.de', 1, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000162, 'Morris', 'Street', '98 Sara', 79410472, 'morris.street@glacierbancorp.com', 3, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000163, 'Mia', 'Guest', '61 Sinise Street', 70033868, 'mia.g@pinnaclestaffing.uk', 3, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000164, 'Rod', 'Farris', '70 Westerberg Ave', 10174441, 'rodf@yashtechnologies.uk', 1, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000165, 'Bridgette', 'Cohn', '45 Downey Ave', 50616066, 'bridgette.cohn@fsffinancial.ch', 4, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000166, 'Carl', 'Rains', '929 Brody', 13345809, 'carl.rains@jewettcameron.ca', 5, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000167, 'Ruth', 'Rowlands', '538 Krabbe Blvd', 63785337, 'ruth.rowlands@data.com', 6, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000168, 'Ryan', 'Cheadle', '56 Cage Blvd', 72609612, 'ryan.c@inzone.ca', 5, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000169, 'Ronny', 'Berkley', '40 Avalon Road', 13477670, 'ronny.berkley@grs.com', 4, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000170, 'Toni', 'DeLuise', '83 Teena Street', 12867000, 'toni@randomwalk.lt', 3, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000171, 'Leonardo', 'Tippe', '23 Ingelheim Street', 28959984, 'ltippe@mss.com', 5, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000172, 'Kenny', 'Hewett', '96 Skarsgard Street', 80197490, 'kennyh@sci.com', 4, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000173, 'Ryan', 'Love', '421 Walker Ave', 42722162, 'ryan.love@healthscribe.ch', 5, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000174, 'Tara', 'McAnally', '25 Caguas Street', 99834137, 'tara.mcanally@canterburypark.com', 1, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000175, 'Philip', 'Reed', '57 Eric Street', 67858329, 'philip.reed@progressivedesigns.se', 2, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000176, 'Marina', 'Salt', '55 Whitwam', 42711723, 'marinas@viacell.com', 3, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000177, 'Viggo', 'Burmester', '51 Moe Drive', 79169462, 'viggo.burmester@nat.uk', 2, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000178, 'Giovanni', 'Miles', '55 Coltrane', 55185814, 'giovanni.miles@smartronix.com', 5, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000179, 'Joely', 'McGregor', '56 Earl Road', 61285623, 'joelym@mosaic.ch', 1, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000180, 'Irene', 'Vega', '32 Burlington Blvd', 16465242, 'irene.vega@lms.ca', 5, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000181, 'Tyrone', 'Jackman', '60 Kurtz Street', 69422347, 'tyrone.jackman@veritekinternational.com', 6, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000182, 'Tia', 'Wayans', '44 Tambor Street', 26746980, 'tia.wayans@northhighland.com', 6, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000183, 'Jon', 'Sample', '85 Winger Street', 55322559, 'jon.s@elmco.de', 3, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000184, 'Cate', 'Diffie', '219 McCabe Road', 45399723, 'cate.diffie@calence.it', 1, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000185, 'Frederic', 'Price', '2 Tobolowsky Ave', 50580460, 'fprice@ufs.ca', 3, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000186, 'Caroline', 'Child', '22nd Street', 24437878, 'caroline@oneidafinancial.com', 5, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000187, 'Kevn', 'Scheider', '91st Street', 49793768, 'kevn.scheider@mre.de', 2, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000188, 'Famke', 'Braugher', '758 Columbia Ave', 88169994, 'famkeb@educationaldevelopment.com', 6, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000189, 'Horace', 'Burrows', '924 Myers Street', 50616656, 'horace.burrows@colgatepalmolive.com', 4, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000190, 'Garth', 'Belushi', '8 Quaid Drive', 45715998, 'g.belushi@ositissoftware.com', 3, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000191, 'Rosanna', 'Tilly', '10 Waite Park Street', 14719924, 'rosanna.t@oriservices.com', 5, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000192, 'Fairuza', 'Lennix', '81st Street', 97216004, 'fairuzal@scooterstore.com', 4, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000193, 'Humberto', 'Ribisi', '7 Bruce Drive', 96177484, 'h.ribisi@max.jp', 1, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000194, 'Gina', 'Travers', '66 Winwood Road', 91621098, 'gina.travers@kis.com', 3, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000195, 'Martha', 'Loeb', '11 Bellevue Road', 46083593, 'martha.loeb@aldensystems.com', 1, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000196, 'Kevin', 'Witherspoon', '75 Rodgers Street', 39186027, 'kwitherspoon@aquickdelivery.nc', 3, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000197, 'Laurie', 'Gunton', '61 High Wycombe Ave', 76873968, 'laurie.gunton@limitedbrands.fr', 3, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000198, 'Lisa', 'Tah', '49 Rodriguez Blvd', 14713377, 'lisa.t@fmt.es', 4, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000199, 'Lauren', 'Boothe', '800 Ranger', 53534704, 'lboothe@conagra.com', 2, 'taking blood', 'in process');
commit;
prompt 200 records committed...
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000200, 'Marina', 'Stormare', '54 Osment Blvd', 29162883, 'marina.stormare@topicsentertainment.se', 4, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000201, 'Emmylou', 'Marley', '79 Edmunds Street', 84653298, 'emmylou.marley@servicelink.za', 2, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000202, 'Warren', 'Mills', '67 Guinness Road', 43430432, 'warren.mills@newmedia.br', 3, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000203, 'Solomon', 'LaPaglia', '83 San Diego Road', 45402016, 'solomon.l@blueoceansoftware.com', 6, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000204, 'Ethan', 'Bassett', '51 Harnes Road', 90806449, 'ethan.bassett@astute.com', 6, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000205, 'Jared', 'Gambon', '71st Street', 94766499, 'jared.gambon@portageenvironmental.com', 6, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000206, 'LeVar', 'Askew', '81 Zappacosta Street', 21499513, 'levar.askew@pds.com', 2, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000207, 'Joseph', 'Fiennes', '71st Street', 17061231, 'joseph.fiennes@granitesystems.de', 6, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000208, 'Dennis', 'Suvari', '36 Toni Road', 27882429, 'dennis.suvari@egroup.id', 6, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000209, 'Albert', 'Skerritt', '15 Frakes Drive', 94172254, 'alberts@sunstream.com', 4, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000210, 'Kevin', 'Cochran', '93 Swinton Blvd', 53500008, 'kevin.cochran@team.com', 3, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000211, 'Tara', 'Porter', '68 Baker Road', 19377085, 'tporter@meridiangold.com', 6, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000212, 'Judge', 'Soda', '92nd Street', 72582006, 'judge.s@noodles.au', 5, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000213, 'Rawlins', 'Lithgow', '43 Garber Street', 55241228, 'rawlinsl@stm.uk', 4, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000214, 'Hilary', 'Gosdin', '59 Rains Road', 67433293, 'hilary.gosdin@newhorizons.com', 1, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000215, 'Ving', 'Penders', '76 Bacharach Drive', 15894862, 'ving.p@smartronix.de', 5, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000216, 'Anne', 'Weaving', '15 Slater Road', 43392130, 'anne.weaving@aoe.com', 1, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000217, 'Jesus', 'Taha', '72 Kinnear Street', 71641633, 'jesus.taha@mattel.jp', 5, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000218, 'Maceo', 'Dillon', '43 Juazeiro Street', 86984374, 'maceo.dillon@freedommedical.com', 5, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000219, 'Gary', 'Driver', '5 Terrasa Road', 58152806, 'gary.driver@nobrainerblindscom.de', 3, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000220, 'Armin', 'Ellis', '24 Morrison', 45662971, 'aellis@allegiantbancorp.com', 2, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000221, 'Lupe', 'Williamson', '52 Myers Road', 82340584, 'lupe.williamson@outsourcegroup.ca', 6, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000222, 'Mitchell', 'Goldberg', '52 Rockwell Road', 22854797, 'mitchell@prosum.com', 2, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000223, 'Mandy', 'Myers', '100 Crowe Road', 25257731, 'mandy.myers@accuship.de', 4, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000224, 'Rachid', 'Aaron', '42 O''Connor Drive', 76343243, 'rachid.a@daimlerchrysler.com', 3, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000225, 'Adam', 'Basinger', '69 Checker Road', 39358720, 'adamb@wrgservices.de', 6, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000226, 'Olympia', 'Bonneville', '46 Doncaster Drive', 15020366, 'olympiab@pacificdatadesigns.com', 4, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000227, 'Meredith', 'Morton', '4 Eat World Drive', 77884390, 'meredith.morton@fiberlink.jp', 2, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000228, 'Daryle', 'Lloyd', '621 Stephanie Street', 50498147, 'daryle.lloyd@harrison.com', 6, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000229, 'Delroy', 'Cummings', '71 McFadden Street', 70705567, 'dcummings@trafficmanagement.de', 5, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000230, 'Rosario', 'Applegate', '588 Griffith Road', 37675726, 'rosario.applegate@parker.de', 5, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000231, 'Madeleine', 'Gilley', '95 Lin Ave', 58156840, 'mgilley@lms.ca', 5, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000232, 'Carlos', 'El-Saher', '354 Newcastle upon Tyne Drive', 59693022, 'carlose@perfectorder.com', 3, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000233, 'Emerson', 'Loggia', '848 Amarillo Street', 93142091, 'emerson.loggia@atlanticcredit.ca', 5, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000234, 'Tia', 'Feuerstein', '83rd Street', 31474466, 'tia@mse.fr', 5, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000235, 'Trick', 'Detmer', '6 Rollins Road', 13261544, 'trick.d@pepsico.nl', 2, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000236, 'Rachid', 'Frakes', '73 Tooele Street', 60424772, 'rachid.frakes@jlphor.com', 2, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000237, 'Dylan', 'Diaz', '34 Conley Street', 92809900, 'dylan.diaz@yashtechnologies.ar', 3, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000238, 'Antonio', 'O''Connor', '85 Myles Road', 93436928, 'antonio.oconnor@benecongroup.com', 6, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000239, 'Lennie', 'McBride', '45 Belmont Street', 40010162, 'lennie.mcbride@aristotle.gr', 4, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000240, 'Red', 'Snider', '26 Johnnie Drive', 66228535, 'rsnider@atlanticnet.fr', 3, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000241, 'Tzi', 'Faithfull', '74 Santana Ave', 22698372, 'tzi.faithfull@keymark.se', 5, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000242, 'Cole', 'Sellers', '90 Biggs Street', 38022544, 'cole.sellers@microtek.com', 5, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000243, 'Chad', 'Matthau', '46 Neil Street', 74821331, 'chad.matthau@acsis.com', 3, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000244, 'Eric', 'Ellis', '26 Chung Road', 34588097, 'eric.e@ceo.com', 4, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000245, 'Warren', 'Willis', '92 de Lancie Drive', 40601876, 'w.willis@tilia.com', 4, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000246, 'Jon', 'Stills', '85 Vienna Ave', 10980347, 'jstills@blueoceansoftware.com', 1, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000247, 'Hilary', 'Duke', '73 Amos Drive', 96672250, 'hilary@newtoninteractive.au', 1, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000248, 'Allison', 'Rauhofer', '11 Crosby', 67526627, 'a.rauhofer@staffone.com', 6, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000249, 'Adina', 'Wilson', '88 Harriet Street', 85943927, 'adina.w@navigatorsystems.com', 4, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000250, 'Ronnie', 'Pressly', '75 Dench Street', 90246768, 'ronnie.pressly@waltdisney.br', 5, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000251, 'Rutger', 'Posener', '31 Langella Street', 27958406, 'rutger@keith.de', 2, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000252, 'Molly', 'Del Toro', '82nd Street', 38324450, 'molly@lfg.br', 6, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000253, 'Kirk', 'Deschanel', '94 Victoria Road', 79925699, 'kirk.deschanel@biosite.com', 4, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000254, 'Gabrielle', 'Strathairn', '62 Quaid Street', 60351691, 'gabrielle.strathairn@trc.py', 2, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000255, 'Cliff', 'Taylor', '52nd Street', 24328957, 'clifft@newmedia.gr', 3, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000256, 'Jodie', 'Keener', '16 James Drive', 63354499, 'jodie.keener@privatebancorp.uk', 3, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000257, 'Robbie', 'Imperioli', '19 Ralph Road', 76744155, 'robbie.imperioli@at.com', 5, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000258, 'Angelina', 'Costner', '511 Sampson Street', 90779958, 'a.costner@nha.de', 5, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000259, 'Liv', 'Crowell', '41 Richie Street', 56897377, 'l.crowell@capitolbancorp.com', 3, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000260, 'Adina', 'Soda', '11st Street', 30410079, 'adina.soda@irissoftware.ca', 3, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000261, 'Sylvester', 'Linney', '6 Berry Street', 26665612, 'sylvester@pis.uk', 4, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000262, 'Ice', 'Lennix', '25 Hoffman Street', 98080420, 'ice@astute.br', 2, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000263, 'Rik', 'Leguizamo', '56 Mira Ave', 57532737, 'rik.leguizamo@teamstudio.com', 5, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000264, 'Donna', 'Hampton', '474 Playboys Road', 67976220, 'donna.h@cardtronics.com', 1, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000265, 'Harry', 'Cook', '1 Burke Drive', 74405807, 'harry.cook@americanvanguard.com', 3, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000266, 'Curt', 'Ratzenberger', '607 Noseworthy Road', 26846377, 'curt.ratzenberger@novartis.de', 4, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000267, 'Judy', 'Coverdale', '91 Cale Road', 69892096, 'judyc@exinomtechnologies.com', 4, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000268, 'Sissy', 'Spine', '86 Tankard Road', 92873740, 's.spine@kramontrealty.za', 5, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000269, 'Tom', 'Cohn', '45 Mahood', 91724349, 'tom.cohn@heritagemicrofilm.com', 2, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000270, 'Susan', 'Cromwell', '2 Winstone', 64907950, 'susan.c@teamstudio.com', 6, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000271, 'Murray', 'Soda', '17 Buckingham Street', 17129707, 'murrays@lemproducts.de', 5, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000272, 'Franco', 'Wainwright', '56 Caine Road', 33132103, 'f.wainwright@ceb.uk', 4, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000273, 'Talvin', 'Peebles', '37 Ribeirao preto Drive', 17321151, 'talvin.peebles@angieslist.uk', 5, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000274, 'Jonny', 'Douglas', '171 Ricci Road', 29473859, 'jonny.d@dbprofessionals.se', 4, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000275, 'Albertina', 'Silverman', '51 Bergen Drive', 54830824, 'albertina.silverman@prahs.com', 3, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000276, 'Ali', 'LaMond', '93rd Street', 43249031, 'ali.lamond@grs.dk', 6, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000277, 'Vendetta', 'Braugher', '29 Karon Road', 21881084, 'v.braugher@avr.fr', 2, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000278, 'Steven', 'Easton', '71 Kotto Street', 14384759, 'steven@chhc.com', 4, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000279, 'Mary-Louise', 'Northam', '32nd Street', 12583365, 'marylouise.northam@gci.za', 1, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000280, 'Lee', 'Bello', '43 Torn Road', 45120972, 'lee.bello@sfgo.de', 5, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000281, 'Johnny', 'Mathis', '63rd Street', 56623581, 'johnny.mathis@saksinc.il', 2, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000282, 'Marina', 'Plimpton', '52nd Street', 34000648, 'marina.plimpton@vspan.com', 2, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000283, 'Bo', 'Gayle', '81 Cuenca Drive', 93451294, 'bo53@procurementcentre.ca', 3, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000284, 'Heather', 'de Lancie', '21 Mulroney Street', 24419533, 'heather.d@gillette.de', 3, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000285, 'Lennie', 'Willard', '43 Kaunas Street', 65798998, 'lenniew@nbs.fr', 1, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000286, 'Jean', 'Cale', '349 Peachtree City', 32808843, 'jcale@elite.com', 4, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000287, 'Ahmad', 'Winter', '4 Harsum Drive', 60142670, 'ahmad.winter@visionarysystems.com', 5, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000288, 'Thomas', 'Hampton', '32 Treat Drive', 56611887, 'thomas.hampton@qssgroup.com', 6, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000289, 'Clarence', 'Sobieski', '61 Snow Road', 43354441, 'c.sobieski@capellaeducation.com', 3, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000290, 'Sam', 'Arquette', '97 Mac Ave', 34452809, 'sam.arquette@universalsolutions.com', 2, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000291, 'Denise', 'Coleman', '93 Kyoto Street', 91957814, 'denise@hatworld.com', 5, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000292, 'April', 'Fender', '66 Dupree Road', 99474101, 'a.fender@at.de', 4, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000293, 'Parker', 'Brock', '82 Cypress Road', 88691583, 'parker.brock@profitline.lt', 3, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000294, 'Charlie', 'Gleeson', '9 Deschanel Street', 32991799, 'charlie.gleeson@bioreference.com', 5, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000295, 'Selma', 'Patrick', '93 Goldie Drive', 84583142, 'selma.patrick@drinkmorewater.com', 5, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000296, 'Barry', 'Loring', '48 Canberra Blvd', 22992417, 'bloring@iss.com', 3, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000297, 'Terry', 'Voight', '447 Jun-nam Street', 41819999, 'terry.voight@biosite.com', 6, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000298, 'Clarence', 'Brock', '62 Marsden Street', 27407548, 'clarence@smartronix.cn', 3, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000299, 'Ben', 'MacLachlan', '24 Heald Drive', 13290919, 'b.maclachlan@escalade.uk', 5, 'center manager', 'in process');
commit;
prompt 300 records committed...
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000300, 'Neil', 'Trevino', '51 Robinson', 59756189, 'n.trevino@sweetproductions.com', 5, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000301, 'Forest', 'Channing', '272 Leto', 68432902, 'forest.channing@data.com', 4, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000302, 'Tramaine', 'Bening', '43 Tim Drive', 49563101, 'tramaine.bening@ungertechnologies.nz', 2, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000303, 'Andre', 'Bogguss', '93 Wuerzburg Street', 52160373, 'a.bogguss@aldensystems.ec', 1, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000304, 'Greg', 'Kenoly', '69 Sheen Blvd', 25287633, 'greg@monarchcasino.com', 3, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000305, 'Elizabeth', 'Union', '8 Colombes Drive', 47448643, 'elizabeth.union@prosum.gr', 1, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000306, 'Scott', 'Armstrong', '49 Scarlett Drive', 96322048, 'scott.armstrong@thinktanksystems.com', 2, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000307, 'Sigourney', 'Church', '81 Steven', 83768512, 'sigourneyc@labradanutrition.com', 4, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000308, 'Eddie', 'Biehn', '12 Cole Blvd', 13200646, 'eddie.biehn@codykramerimports.com', 4, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000309, 'Elle', 'Pearce', '38 Irving Blvd', 18704178, 'elle.pearce@bigdoughcom.jp', 6, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000310, 'Ceili', 'Gertner', '63 Nik Road', 19209296, 'ceili@abatix.uk', 3, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000311, 'Xander', 'Yulin', '89 Donelly Blvd', 15730117, 'xander.yulin@mqsoftware.com', 6, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000312, 'Jay', 'McBride', '81 Monk Road', 79351907, 'jmcbride@ipsadvisory.com', 6, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000313, 'Latin', 'Sandler', '444 Sedaka Ave', 66406248, 'latin.sandler@extremepizza.il', 6, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000314, 'Rachid', 'Emmerich', '85 Chalee Street', 53192870, 'rachide@clorox.id', 6, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000315, 'Todd', 'Vinton', '94 Avril Ave', 83795967, 'todd.vinton@aquascapedesigns.au', 2, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000316, 'Luis', 'Davison', '83 Hatosy Drive', 32666890, 'luis@ibfh.com', 2, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000317, 'Dan', 'Davies', '29 Hank Street', 64142386, 'dan@kroger.com', 4, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000318, 'Ming-Na', 'Boorem', '15 Dreieich Road', 17494604, 'mingna@msdw.uk', 4, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000319, 'Aida', 'Lerner', '67 Mekhi Street', 54289489, 'aida.lerner@solutionbuilders.com', 1, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000320, 'Salma', 'Ruffalo', '2 CeCe Road', 57108101, 'salma.r@albertsons.ch', 3, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000321, 'King', 'Gore', '27 Gryner Road', 38778915, 'king.gore@newviewgifts.com', 1, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000322, 'Temuera', 'Kristofferson', '73rd Street', 92659492, 'temuera.kristofferson@qssgroup.fr', 4, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000323, 'Will', 'Conlee', '28 Sihung-si Drive', 91159304, 'will.conlee@sourcegear.za', 2, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000324, 'Giancarlo', 'Gilley', '82 Pollak Street', 60145369, 'giancarlo.gilley@lms.com', 4, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000325, 'Wally', 'Connelly', '14 Andie Road', 34642701, 'wconnelly@telecheminternational.com', 5, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000326, 'Zooey', 'Langella', '1 Wakayama', 62493256, 'zooey.langella@terrafirma.com', 4, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000327, 'Tom', 'Coolidge', '70 Hex Street', 29224906, 'tom.coolidge@innovativelighting.ca', 2, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000328, 'Harriet', 'Francis', '14 Bachman Drive', 98569863, 'h.francis@inspirationsoftware.com', 6, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000329, 'Mili', 'Brando', '25 Englund', 49432598, 'm.brando@gci.com', 3, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000330, 'Javon', 'Lerner', '50 Depp Street', 73165096, 'javon.lerner@gapinc.pl', 3, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000331, 'Drew', 'Nicks', '9 Kaunas Drive', 37441915, 'drew.n@authoria.com', 3, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000332, 'Daniel', 'Shawn', '713 Hawn Drive', 88514444, 'daniel.shawn@bowman.de', 4, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000333, 'Nick', 'Hobson', '10 Cook Road', 89983704, 'n.hobson@egroup.au', 1, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000334, 'Pete', 'Swank', '36 Wright Drive', 99723096, 'pete@bioreliance.ca', 6, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000335, 'Art', 'Dzundza', '90 Carmichael', 41836603, 'art.dzundza@nexxtworks.com', 5, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000336, 'Campbell', 'Hauser', '24 Billy Road', 54642094, 'campbell.hauser@cyberthink.au', 5, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000337, 'Celia', 'Scheider', '94 Shawn Ave', 77201230, 'celias@kingston.com', 4, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000338, 'Cyndi', 'Milsap', '767 Berkshire Street', 24441699, 'cyndi.m@meritagetechnologies.uk', 1, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000339, 'Gino', 'Balin', '35 Emm Street', 15825540, 'gbalin@firstsouthbancorp.it', 3, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000340, 'Gino', 'De Almeida', '39 DeVito', 54811018, 'gino.dealmeida@drinkmorewater.br', 5, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000341, 'Lee', 'Stallone', '92nd Street', 98354435, 'lee@colgatepalmolive.com', 3, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000342, 'Garry', 'Nash', '49 Bergen Road', 93585276, 'garryn@ciwservices.com', 2, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000343, 'Geoffrey', 'Davidson', '92nd Street', 70166515, 'g.davidson@electricalsolutions.br', 5, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000344, 'Nikki', 'Washington', '99 West Windsor Drive', 27722415, 'nikki@outsourcegroup.no', 2, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000345, 'Anna', 'Banderas', '5 Bratislava Road', 85992652, 'anna.banderas@ataservices.com', 1, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000346, 'Allan', 'Folds', '80 Gena Road', 62691440, 'allan.folds@questarcapital.com', 1, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000347, 'Crystal', 'Wilkinson', '22 Ted Drive', 37502505, 'crystal.wilkinson@tmaresources.com', 4, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000348, 'Emm', 'Rooker', '715 Changwon-si Drive', 40619255, 'emm.rooker@tilia.com', 4, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000349, 'Teena', 'Franks', '92nd Street', 75532371, 'teenaf@scooterstore.ca', 5, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000350, 'Neneh', 'Crewson', '83 Annandale Drive', 77629284, 'neneh.crewson@vivendiuniversal.com', 4, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000351, 'Sheena', 'Hubbard', '13rd Street', 73662386, 'shubbard@generalelectric.uk', 6, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000352, 'LeVar', 'Travolta', '53 Katt Drive', 45444480, 'levar.travolta@pis.com', 1, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000353, 'Chely', 'Taylor', '60 Bridget Road', 44722180, 'chelyt@boldtechsystems.tr', 2, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000354, 'Lynn', 'Camp', '999 Chrissie Road', 24952781, 'lcamp@socketinternet.uk', 2, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000355, 'Alannah', 'Stone', '3 Trevino Street', 64066176, 'alannah.stone@seafoxboat.za', 3, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000356, 'Lennie', 'Schiff', '9 Singletary Road', 46058872, 'lennie@abatix.ar', 1, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000357, 'Earl', 'Lynch', '48 Levine', 17511960, 'earl.lynch@infinity.ch', 6, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000358, 'Loretta', 'Webb', '72nd Street', 36978770, 'loretta.webb@mindworks.hk', 6, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000359, 'Josh', 'Dawson', '99 Carnes Drive', 23080904, 'j.dawson@unicru.uk', 3, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000360, 'Neneh', 'Hong', '71 Caguas Ave', 91919505, 'neneh.h@dsp.de', 1, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000361, 'Saffron', 'Koteas', '96 Thomas Road', 63418427, 'saffronk@bestbuy.nl', 5, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000362, 'Judge', 'Postlethwaite', '11 Kenoly Ave', 86745648, 'judge.p@progressivedesigns.com', 1, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000363, 'Renee', 'Ribisi', '7 Colorado Springs Road', 78256750, 'renee@nat.nl', 5, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000364, 'Al', 'Dern', '96 Checker Drive', 44513181, 'a.dern@elmco.dk', 2, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000365, 'Larnelle', 'Winwood', '22 Portman Road', 44876594, 'larnelle.w@staffone.com', 6, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000366, 'Bill', 'Frost', '22nd Street', 45105567, 'billf@operationaltechnologies.be', 3, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000367, 'Raymond', 'Kapanka', '496 Statham Drive', 67306766, 'r.kapanka@esoftsolutions.pl', 6, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000368, 'Toshiro', 'Colon', '538 Milton Keynes Ave', 66839225, 'toshiro.colon@travizon.com', 6, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000369, 'Jeff', 'Gellar', '26 Nagano Ave', 69372184, 'jeff.g@adolph.be', 6, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000370, 'Bette', 'Bening', '22 Stanley Ave', 30698288, 'bette.bening@myricom.nz', 6, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000371, 'Aimee', 'Shocked', '82nd Street', 69415391, 'a.shocked@air.com', 1, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000372, 'Ricky', 'Addy', '22 Tia', 22200856, 'ricky.addy@ads.com', 1, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000373, 'Jonny', 'Vaughan', '13rd Street', 62953863, 'jonny.vaughan@ntas.br', 4, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000374, 'Kevin', 'Playboys', '100 Ossie Drive', 95212838, 'kevinp@smartronix.jp', 3, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000375, 'Laurence', 'Manning', '59 Nastassja Street', 46915558, 'l.manning@baesch.au', 1, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000376, 'Gloria', 'Heald', '371 Garth Drive', 75925342, 'gloria@aop.hu', 5, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000377, 'Geraldine', 'Griffith', '697 Daryle Road', 66292991, 'geraldine@scheringplough.au', 3, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000378, 'Nile', 'Snider', '9 Farrow Drive', 19567808, 'nile.snider@morganresearch.com', 1, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000379, 'Rita', 'Lewis', '93 Miguel Road', 77283214, 'rita.lewis@nsd.com', 3, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000380, 'Colm', 'Lipnicki', '656 Choice Street', 33720426, 'colm.lipnicki@cns.com', 4, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000381, 'Miko', 'Dench', '81 Silverman Street', 27306622, 'mikod@caliber.fi', 2, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000382, 'Doug', 'Neill', '48 Tankard Road', 92336363, 'doug@manhattanassociates.com', 3, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000383, 'Matt', 'Curry', '11 Waco Drive', 64352208, 'matt.curry@aop.de', 3, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000384, 'Luis', 'Hawn', '23rd Street', 73693973, 'luis@safeway.it', 2, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000385, 'Joey', 'Irving', '42 Sandler Ave', 52388209, 'joey.irving@mwp.it', 4, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000386, 'Kathy', 'Macy', '91st Street', 63362532, 'kathym@businessplus.jp', 4, 'center manager', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000387, 'Brittany', 'Rydell', '2 Ft. Lauderdale Street', 64844563, 'brittany@team.de', 6, 'ambulance driver', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000388, 'Harvey', 'DiCaprio', '77 Ben Street', 93696548, 'harvey.dicaprio@hotmail.de', 4, 'trainee''', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000389, 'Joely', 'Diggs', '58 Hackman Street', 41802824, 'joely.diggs@vspan.uk', 6, 'paramedic', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000390, 'Carlene', 'Hauer', '100 Flanery Ave', 83706961, 'carlene.hauer@colgatepalmolive.com', 1, 'paramedic', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000391, 'Sean', 'Conners', '204 Starr Drive', 81650853, 'sean.conners@gci.uk', 6, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000392, 'Edward', 'Cook', '32nd Street', 85918612, 'edward.cook@digitalmotorworks.de', 3, 'taking blood', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000393, 'Tzi', 'Schwimmer', '42 Maury Road', 34231650, 'tschwimmer@codykramerimports.com', 2, 'ambulance driver', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000394, 'Nicholas', 'Parish', '53 Vienna Ave', 16176473, 'nicholas.parish@typhoon.au', 3, 'trainee''', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000395, 'Halle', 'Daniels', '951 Baltimore Street', 48483779, 'halled@generalelectric.de', 6, 'taking blood', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000396, 'Luke', 'Piven', '52nd Street', 95135762, 'luke@dcgroup.ch', 5, 'customer service', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000397, 'Rene', 'Winans', '76 Sharon Street', 63530311, 'rene@processplus.com', 3, 'customer service', 'in process');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000398, 'Loretta', 'Belle', '2 Herndon Road', 25009770, 'loretta.belle@inzone.uk', 2, 'center manager', 'done');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, address, phone_number, email, role_id, volunteerrole, status)
values (10000399, 'Roberta', 'Apple', '25 Parsons Road', 23251788, 'roberta.apple@younginnovations.uk', 1, 'center manager', 'in process');
commit;
prompt 400 records loaded
prompt Loading VOLUNTEERSHIFTALLOCATION...
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-11-3031', 'dd-mm-yyyy'), 10000248, 100201);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-11-2023', 'dd-mm-yyyy'), 10000287, 100174);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('27-08-1985', 'dd-mm-yyyy'), 10000357, 100283);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('31-12-3044', 'dd-mm-yyyy'), 10000279, 100020);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-05-2005', 'dd-mm-yyyy'), 10000261, 100016);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('13-01-1947', 'dd-mm-yyyy'), 10000353, 100197);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('06-05-2011', 'dd-mm-yyyy'), 10000153, 100270);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('19-09-1983', 'dd-mm-yyyy'), 10000348, 100143);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-01-3059', 'dd-mm-yyyy'), 10000064, 100055);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('02-06-3063', 'dd-mm-yyyy'), 10000131, 100212);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('20-02-3027', 'dd-mm-yyyy'), 10000180, 100157);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-09-3034', 'dd-mm-yyyy'), 10000154, 100279);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('17-02-3039', 'dd-mm-yyyy'), 10000224, 100019);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-01-1950', 'dd-mm-yyyy'), 10000341, 100209);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-03-1909', 'dd-mm-yyyy'), 10000303, 100283);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('01-02-2978', 'dd-mm-yyyy'), 10000222, 100160);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('16-04-1952', 'dd-mm-yyyy'), 10000334, 100003);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-04-1908', 'dd-mm-yyyy'), 10000284, 100261);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-02-3025', 'dd-mm-yyyy'), 10000245, 100261);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('20-04-3053', 'dd-mm-yyyy'), 10000369, 100017);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('29-04-3044', 'dd-mm-yyyy'), 10000261, 100145);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-10-3019', 'dd-mm-yyyy'), 10000198, 100179);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('07-10-3045', 'dd-mm-yyyy'), 10000146, 100171);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('18-08-3074', 'dd-mm-yyyy'), 10000288, 100037);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('19-02-3013', 'dd-mm-yyyy'), 10000372, 100156);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('29-12-2976', 'dd-mm-yyyy'), 10000290, 100162);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-02-1995', 'dd-mm-yyyy'), 10000348, 100076);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-06-3041', 'dd-mm-yyyy'), 10000330, 100258);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('23-03-1983', 'dd-mm-yyyy'), 10000385, 100235);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('06-08-1991', 'dd-mm-yyyy'), 10000143, 100161);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-09-1938', 'dd-mm-yyyy'), 10000146, 100145);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('30-07-3034', 'dd-mm-yyyy'), 10000037, 100108);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('28-08-3039', 'dd-mm-yyyy'), 10000255, 100118);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('05-12-1906', 'dd-mm-yyyy'), 10000242, 100027);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('13-11-3024', 'dd-mm-yyyy'), 10000163, 100025);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('17-04-3039', 'dd-mm-yyyy'), 10000029, 100270);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-01-1982', 'dd-mm-yyyy'), 10000208, 100212);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('26-10-3010', 'dd-mm-yyyy'), 10000342, 100036);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('07-10-1989', 'dd-mm-yyyy'), 10000311, 100145);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('18-05-2988', 'dd-mm-yyyy'), 10000205, 100171);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-10-2015', 'dd-mm-yyyy'), 10000321, 100246);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('28-03-2021', 'dd-mm-yyyy'), 10000230, 100267);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('06-07-2010', 'dd-mm-yyyy'), 10000194, 100023);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-04-1967', 'dd-mm-yyyy'), 10000070, 100249);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-08-3044', 'dd-mm-yyyy'), 10000155, 100133);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('02-05-1933', 'dd-mm-yyyy'), 10000168, 100010);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('04-11-1900', 'dd-mm-yyyy'), 10000104, 100127);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('30-01-1967', 'dd-mm-yyyy'), 10000318, 100142);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('02-08-2013', 'dd-mm-yyyy'), 10000252, 100049);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-01-1910', 'dd-mm-yyyy'), 10000015, 100127);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('14-09-1935', 'dd-mm-yyyy'), 10000065, 100205);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('26-03-2013', 'dd-mm-yyyy'), 10000126, 100079);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('14-06-1961', 'dd-mm-yyyy'), 10000199, 100248);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-11-1918', 'dd-mm-yyyy'), 10000083, 100207);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-08-1974', 'dd-mm-yyyy'), 10000095, 100221);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('07-02-3039', 'dd-mm-yyyy'), 10000254, 100220);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-02-1983', 'dd-mm-yyyy'), 10000067, 100066);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('12-06-3074', 'dd-mm-yyyy'), 10000129, 100195);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('30-12-1922', 'dd-mm-yyyy'), 10000121, 100088);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-10-1908', 'dd-mm-yyyy'), 10000217, 100187);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-11-1953', 'dd-mm-yyyy'), 10000127, 100228);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('08-08-1986', 'dd-mm-yyyy'), 10000153, 100198);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('27-02-1988', 'dd-mm-yyyy'), 10000126, 100194);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-02-3074', 'dd-mm-yyyy'), 10000237, 100285);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('08-06-3046', 'dd-mm-yyyy'), 10000255, 100013);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-06-1915', 'dd-mm-yyyy'), 10000392, 100252);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-09-3057', 'dd-mm-yyyy'), 10000362, 100193);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('23-07-1922', 'dd-mm-yyyy'), 10000014, 100197);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('05-04-1952', 'dd-mm-yyyy'), 10000128, 100125);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('16-03-1917', 'dd-mm-yyyy'), 10000380, 100208);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('04-08-3049', 'dd-mm-yyyy'), 10000006, 100217);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('23-01-2980', 'dd-mm-yyyy'), 10000054, 100240);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('01-09-1909', 'dd-mm-yyyy'), 10000219, 100117);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('17-02-1995', 'dd-mm-yyyy'), 10000265, 100239);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('20-05-1962', 'dd-mm-yyyy'), 10000300, 100101);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-01-2006', 'dd-mm-yyyy'), 10000167, 100248);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-04-2972', 'dd-mm-yyyy'), 10000102, 100203);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-04-2019', 'dd-mm-yyyy'), 10000061, 100252);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('14-07-1951', 'dd-mm-yyyy'), 10000335, 100076);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('23-02-3029', 'dd-mm-yyyy'), 10000293, 100162);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-03-3010', 'dd-mm-yyyy'), 10000258, 100170);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('06-09-1927', 'dd-mm-yyyy'), 10000217, 100009);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('16-01-2991', 'dd-mm-yyyy'), 10000142, 100102);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('08-04-1996', 'dd-mm-yyyy'), 10000058, 100120);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('02-09-3070', 'dd-mm-yyyy'), 10000107, 100220);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('14-06-3010', 'dd-mm-yyyy'), 10000179, 100086);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('13-05-2023', 'dd-mm-yyyy'), 10000240, 100263);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('14-10-1941', 'dd-mm-yyyy'), 10000014, 100254);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('17-04-3012', 'dd-mm-yyyy'), 10000263, 100029);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('05-08-1905', 'dd-mm-yyyy'), 10000131, 100186);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-12-1941', 'dd-mm-yyyy'), 10000096, 100152);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-12-2005', 'dd-mm-yyyy'), 10000383, 100151);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('13-05-3057', 'dd-mm-yyyy'), 10000314, 100148);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('27-09-1916', 'dd-mm-yyyy'), 10000004, 100242);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-11-3040', 'dd-mm-yyyy'), 10000054, 100074);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('07-07-2016', 'dd-mm-yyyy'), 10000038, 100022);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('15-12-2982', 'dd-mm-yyyy'), 10000344, 100144);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('19-06-3032', 'dd-mm-yyyy'), 10000317, 100089);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('05-08-3005', 'dd-mm-yyyy'), 10000201, 100130);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-07-3022', 'dd-mm-yyyy'), 10000154, 100258);
commit;
prompt 100 records committed...
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('13-04-1942', 'dd-mm-yyyy'), 10000098, 100069);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-10-1988', 'dd-mm-yyyy'), 10000339, 100150);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('13-09-1964', 'dd-mm-yyyy'), 10000103, 100171);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-07-1995', 'dd-mm-yyyy'), 10000262, 100129);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('27-12-3037', 'dd-mm-yyyy'), 10000185, 100084);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('18-02-2003', 'dd-mm-yyyy'), 10000366, 100199);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-05-2023', 'dd-mm-yyyy'), 10000289, 100253);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('30-10-2024', 'dd-mm-yyyy'), 10000128, 100177);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-01-1962', 'dd-mm-yyyy'), 10000253, 100072);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('04-05-1942', 'dd-mm-yyyy'), 10000170, 100217);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('26-11-1966', 'dd-mm-yyyy'), 10000029, 100142);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-01-3053', 'dd-mm-yyyy'), 10000203, 100033);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('04-07-3018', 'dd-mm-yyyy'), 10000311, 100252);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('26-03-3054', 'dd-mm-yyyy'), 10000222, 100271);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-06-3002', 'dd-mm-yyyy'), 10000062, 100228);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('29-02-1924', 'dd-mm-yyyy'), 10000261, 100089);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-03-1956', 'dd-mm-yyyy'), 10000329, 100180);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('18-05-1986', 'dd-mm-yyyy'), 10000359, 100126);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-01-1901', 'dd-mm-yyyy'), 10000236, 100240);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('31-12-2980', 'dd-mm-yyyy'), 10000364, 100020);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('07-04-3045', 'dd-mm-yyyy'), 10000099, 100158);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('06-02-1953', 'dd-mm-yyyy'), 10000278, 100256);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-02-3041', 'dd-mm-yyyy'), 10000104, 100278);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-07-3045', 'dd-mm-yyyy'), 10000387, 100185);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('14-05-1939', 'dd-mm-yyyy'), 10000295, 100285);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('15-12-1943', 'dd-mm-yyyy'), 10000348, 100231);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('06-07-2984', 'dd-mm-yyyy'), 10000255, 100123);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('04-10-3035', 'dd-mm-yyyy'), 10000024, 100165);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('07-04-3048', 'dd-mm-yyyy'), 10000096, 100167);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('05-08-3048', 'dd-mm-yyyy'), 10000099, 100021);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('17-12-2992', 'dd-mm-yyyy'), 10000207, 100040);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('06-07-1915', 'dd-mm-yyyy'), 10000121, 100038);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-04-1924', 'dd-mm-yyyy'), 10000127, 100112);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('15-10-2006', 'dd-mm-yyyy'), 10000299, 100038);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('28-05-3022', 'dd-mm-yyyy'), 10000043, 100057);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('27-05-2982', 'dd-mm-yyyy'), 10000255, 100251);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-01-1943', 'dd-mm-yyyy'), 10000273, 100099);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-06-1997', 'dd-mm-yyyy'), 10000170, 100170);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('06-08-3025', 'dd-mm-yyyy'), 10000233, 100202);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('02-03-1976', 'dd-mm-yyyy'), 10000391, 100063);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('31-03-2995', 'dd-mm-yyyy'), 10000122, 100050);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('18-07-1945', 'dd-mm-yyyy'), 10000251, 100069);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-10-1942', 'dd-mm-yyyy'), 10000201, 100267);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('07-11-1953', 'dd-mm-yyyy'), 10000163, 100057);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('27-10-3068', 'dd-mm-yyyy'), 10000201, 100150);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-07-2014', 'dd-mm-yyyy'), 10000268, 100224);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-01-1995', 'dd-mm-yyyy'), 10000294, 100001);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('15-08-1912', 'dd-mm-yyyy'), 10000187, 100209);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-09-1917', 'dd-mm-yyyy'), 10000338, 100002);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('08-09-2008', 'dd-mm-yyyy'), 10000307, 100227);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('02-02-1929', 'dd-mm-yyyy'), 10000315, 100165);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('31-01-3068', 'dd-mm-yyyy'), 10000358, 100032);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-02-3041', 'dd-mm-yyyy'), 10000350, 100102);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('17-02-1930', 'dd-mm-yyyy'), 10000061, 100185);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('01-04-2000', 'dd-mm-yyyy'), 10000260, 100046);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('19-05-2983', 'dd-mm-yyyy'), 10000145, 100170);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('06-06-1900', 'dd-mm-yyyy'), 10000353, 100255);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-03-2991', 'dd-mm-yyyy'), 10000243, 100125);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-09-1917', 'dd-mm-yyyy'), 10000233, 100033);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-05-1958', 'dd-mm-yyyy'), 10000038, 100041);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('15-09-1922', 'dd-mm-yyyy'), 10000116, 100280);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('18-02-1980', 'dd-mm-yyyy'), 10000331, 100051);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('20-03-3061', 'dd-mm-yyyy'), 10000189, 100134);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('31-03-1965', 'dd-mm-yyyy'), 10000147, 100256);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-04-2992', 'dd-mm-yyyy'), 10000155, 100077);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('17-10-3035', 'dd-mm-yyyy'), 10000144, 100215);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('26-01-2001', 'dd-mm-yyyy'), 10000253, 100000);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-01-3063', 'dd-mm-yyyy'), 10000113, 100214);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-05-1995', 'dd-mm-yyyy'), 10000174, 100226);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('16-07-1919', 'dd-mm-yyyy'), 10000018, 100125);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-09-2998', 'dd-mm-yyyy'), 10000087, 100106);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-12-1945', 'dd-mm-yyyy'), 10000150, 100066);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('31-07-2982', 'dd-mm-yyyy'), 10000160, 100059);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('14-01-3033', 'dd-mm-yyyy'), 10000064, 100279);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('29-04-1965', 'dd-mm-yyyy'), 10000245, 100040);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('31-08-1958', 'dd-mm-yyyy'), 10000343, 100161);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('15-10-1958', 'dd-mm-yyyy'), 10000348, 100260);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-10-2000', 'dd-mm-yyyy'), 10000298, 100132);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('02-01-2977', 'dd-mm-yyyy'), 10000187, 100281);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('28-05-3040', 'dd-mm-yyyy'), 10000246, 100117);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('28-11-1958', 'dd-mm-yyyy'), 10000342, 100174);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('30-12-1928', 'dd-mm-yyyy'), 10000311, 100168);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-12-1941', 'dd-mm-yyyy'), 10000095, 100132);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('16-02-2970', 'dd-mm-yyyy'), 10000103, 100286);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-09-3017', 'dd-mm-yyyy'), 10000217, 100196);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('07-11-1945', 'dd-mm-yyyy'), 10000075, 100281);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-05-1994', 'dd-mm-yyyy'), 10000158, 100046);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('15-01-2975', 'dd-mm-yyyy'), 10000331, 100112);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('26-08-3005', 'dd-mm-yyyy'), 10000102, 100142);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-04-2017', 'dd-mm-yyyy'), 10000355, 100194);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('01-05-1919', 'dd-mm-yyyy'), 10000275, 100007);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-10-3054', 'dd-mm-yyyy'), 10000378, 100038);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('15-06-1933', 'dd-mm-yyyy'), 10000040, 100076);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-11-3013', 'dd-mm-yyyy'), 10000109, 100277);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('06-11-1992', 'dd-mm-yyyy'), 10000037, 100053);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-11-3025', 'dd-mm-yyyy'), 10000217, 100181);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-04-1944', 'dd-mm-yyyy'), 10000055, 100112);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-11-3005', 'dd-mm-yyyy'), 10000368, 100041);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('30-07-1961', 'dd-mm-yyyy'), 10000139, 100203);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('31-08-2984', 'dd-mm-yyyy'), 10000175, 100261);
commit;
prompt 200 records committed...
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('23-04-3041', 'dd-mm-yyyy'), 10000004, 100067);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('29-10-1930', 'dd-mm-yyyy'), 10000160, 100275);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('20-10-3070', 'dd-mm-yyyy'), 10000085, 100271);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('18-10-1922', 'dd-mm-yyyy'), 10000157, 100189);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('06-02-1962', 'dd-mm-yyyy'), 10000144, 100205);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('28-12-2013', 'dd-mm-yyyy'), 10000179, 100198);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-10-1979', 'dd-mm-yyyy'), 10000338, 100131);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-02-1958', 'dd-mm-yyyy'), 10000170, 100189);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('01-12-1901', 'dd-mm-yyyy'), 10000203, 100088);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('12-01-3013', 'dd-mm-yyyy'), 10000362, 100068);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-06-2972', 'dd-mm-yyyy'), 10000370, 100208);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('19-07-1931', 'dd-mm-yyyy'), 10000201, 100008);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-06-1974', 'dd-mm-yyyy'), 10000076, 100075);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('19-03-1937', 'dd-mm-yyyy'), 10000065, 100182);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-08-1979', 'dd-mm-yyyy'), 10000171, 100022);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-11-3046', 'dd-mm-yyyy'), 10000367, 100264);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('17-03-2996', 'dd-mm-yyyy'), 10000137, 100027);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('14-08-3043', 'dd-mm-yyyy'), 10000021, 100228);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('26-12-1988', 'dd-mm-yyyy'), 10000074, 100156);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('29-07-1957', 'dd-mm-yyyy'), 10000372, 100153);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-08-3029', 'dd-mm-yyyy'), 10000087, 100215);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('05-02-1929', 'dd-mm-yyyy'), 10000154, 100155);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('05-08-3037', 'dd-mm-yyyy'), 10000248, 100176);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('06-04-3017', 'dd-mm-yyyy'), 10000199, 100172);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('28-12-1998', 'dd-mm-yyyy'), 10000136, 100263);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-09-1902', 'dd-mm-yyyy'), 10000237, 100028);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('20-02-2015', 'dd-mm-yyyy'), 10000122, 100016);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-09-1903', 'dd-mm-yyyy'), 10000074, 100218);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('15-11-3062', 'dd-mm-yyyy'), 10000029, 100120);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('08-05-3075', 'dd-mm-yyyy'), 10000066, 100190);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('15-08-1928', 'dd-mm-yyyy'), 10000088, 100083);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('17-04-1911', 'dd-mm-yyyy'), 10000234, 100118);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-10-3040', 'dd-mm-yyyy'), 10000316, 100198);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('30-01-1951', 'dd-mm-yyyy'), 10000350, 100205);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('16-06-2995', 'dd-mm-yyyy'), 10000345, 100001);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('23-08-2973', 'dd-mm-yyyy'), 10000317, 100277);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-03-1923', 'dd-mm-yyyy'), 10000386, 100202);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('04-04-3052', 'dd-mm-yyyy'), 10000371, 100055);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('19-09-2021', 'dd-mm-yyyy'), 10000239, 100280);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-02-1979', 'dd-mm-yyyy'), 10000325, 100187);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('16-12-1933', 'dd-mm-yyyy'), 10000251, 100256);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-01-3035', 'dd-mm-yyyy'), 10000218, 100200);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('13-08-1988', 'dd-mm-yyyy'), 10000357, 100075);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-09-2997', 'dd-mm-yyyy'), 10000373, 100066);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('07-09-2980', 'dd-mm-yyyy'), 10000010, 100274);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-10-1923', 'dd-mm-yyyy'), 10000272, 100092);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('23-12-3001', 'dd-mm-yyyy'), 10000122, 100079);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('26-12-3040', 'dd-mm-yyyy'), 10000171, 100080);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('01-09-3001', 'dd-mm-yyyy'), 10000174, 100155);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('08-02-2014', 'dd-mm-yyyy'), 10000308, 100233);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('16-04-1927', 'dd-mm-yyyy'), 10000164, 100115);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('26-06-3012', 'dd-mm-yyyy'), 10000055, 100273);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-02-1929', 'dd-mm-yyyy'), 10000183, 100065);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-03-1900', 'dd-mm-yyyy'), 10000320, 100035);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-01-3059', 'dd-mm-yyyy'), 10000399, 100035);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-12-2970', 'dd-mm-yyyy'), 10000311, 100087);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('13-11-3046', 'dd-mm-yyyy'), 10000102, 100083);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('16-07-2987', 'dd-mm-yyyy'), 10000024, 100166);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('15-07-1975', 'dd-mm-yyyy'), 10000096, 100247);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('13-08-2016', 'dd-mm-yyyy'), 10000018, 100186);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-10-3037', 'dd-mm-yyyy'), 10000210, 100043);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-03-1982', 'dd-mm-yyyy'), 10000145, 100067);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-07-3022', 'dd-mm-yyyy'), 10000269, 100281);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-08-1917', 'dd-mm-yyyy'), 10000339, 100143);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-04-3023', 'dd-mm-yyyy'), 10000091, 100160);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('23-02-3065', 'dd-mm-yyyy'), 10000250, 100030);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-09-3020', 'dd-mm-yyyy'), 10000063, 100187);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('20-03-3002', 'dd-mm-yyyy'), 10000095, 100018);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('28-06-3026', 'dd-mm-yyyy'), 10000127, 100236);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-10-3050', 'dd-mm-yyyy'), 10000019, 100105);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-12-1985', 'dd-mm-yyyy'), 10000087, 100162);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('02-11-2008', 'dd-mm-yyyy'), 10000348, 100115);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-10-1923', 'dd-mm-yyyy'), 10000006, 100205);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-02-2990', 'dd-mm-yyyy'), 10000128, 100214);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('25-06-3015', 'dd-mm-yyyy'), 10000140, 100180);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('19-01-1954', 'dd-mm-yyyy'), 10000040, 100172);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('04-01-1929', 'dd-mm-yyyy'), 10000143, 100231);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('17-06-1941', 'dd-mm-yyyy'), 10000237, 100177);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('31-07-1932', 'dd-mm-yyyy'), 10000108, 100050);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('08-12-3001', 'dd-mm-yyyy'), 10000392, 100193);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-08-3062', 'dd-mm-yyyy'), 10000027, 100104);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('13-12-1999', 'dd-mm-yyyy'), 10000050, 100170);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-09-2015', 'dd-mm-yyyy'), 10000068, 100096);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-01-2992', 'dd-mm-yyyy'), 10000319, 100011);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('19-04-3019', 'dd-mm-yyyy'), 10000000, 100044);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-02-3041', 'dd-mm-yyyy'), 10000334, 100171);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('13-04-1981', 'dd-mm-yyyy'), 10000160, 100156);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-04-3056', 'dd-mm-yyyy'), 10000382, 100204);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('14-10-3057', 'dd-mm-yyyy'), 10000270, 100184);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('19-08-1999', 'dd-mm-yyyy'), 10000086, 100208);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-05-2990', 'dd-mm-yyyy'), 10000093, 100114);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('28-12-3041', 'dd-mm-yyyy'), 10000104, 100174);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('01-06-2977', 'dd-mm-yyyy'), 10000265, 100152);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('27-08-1923', 'dd-mm-yyyy'), 10000114, 100103);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('30-08-3041', 'dd-mm-yyyy'), 10000232, 100079);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-03-3033', 'dd-mm-yyyy'), 10000398, 100177);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('20-12-1900', 'dd-mm-yyyy'), 10000342, 100176);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('17-03-3050', 'dd-mm-yyyy'), 10000227, 100096);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('23-01-2020', 'dd-mm-yyyy'), 10000320, 100142);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-09-1935', 'dd-mm-yyyy'), 10000108, 100092);
commit;
prompt 300 records committed...
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('04-05-1966', 'dd-mm-yyyy'), 10000341, 100103);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-06-2970', 'dd-mm-yyyy'), 10000110, 100050);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('01-07-3033', 'dd-mm-yyyy'), 10000000, 100244);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('20-09-1994', 'dd-mm-yyyy'), 10000235, 100136);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('07-05-3035', 'dd-mm-yyyy'), 10000014, 100208);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('23-05-2016', 'dd-mm-yyyy'), 10000061, 100179);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-03-3059', 'dd-mm-yyyy'), 10000192, 100252);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('14-05-3017', 'dd-mm-yyyy'), 10000236, 100196);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('29-05-3024', 'dd-mm-yyyy'), 10000006, 100021);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('12-07-1974', 'dd-mm-yyyy'), 10000276, 100019);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('29-07-2977', 'dd-mm-yyyy'), 10000069, 100045);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('20-11-3054', 'dd-mm-yyyy'), 10000165, 100259);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-04-2980', 'dd-mm-yyyy'), 10000223, 100085);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('07-01-3067', 'dd-mm-yyyy'), 10000268, 100146);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('26-05-2976', 'dd-mm-yyyy'), 10000104, 100132);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-11-1947', 'dd-mm-yyyy'), 10000063, 100183);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-10-1906', 'dd-mm-yyyy'), 10000075, 100109);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-08-2981', 'dd-mm-yyyy'), 10000089, 100061);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-02-2013', 'dd-mm-yyyy'), 10000140, 100183);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-06-1967', 'dd-mm-yyyy'), 10000134, 100282);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('06-07-2021', 'dd-mm-yyyy'), 10000399, 100032);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-06-3027', 'dd-mm-yyyy'), 10000346, 100055);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-12-3026', 'dd-mm-yyyy'), 10000328, 100135);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('06-02-3016', 'dd-mm-yyyy'), 10000144, 100259);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('04-02-2991', 'dd-mm-yyyy'), 10000189, 100182);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-05-1962', 'dd-mm-yyyy'), 10000089, 100036);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-10-3055', 'dd-mm-yyyy'), 10000108, 100273);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('14-07-3011', 'dd-mm-yyyy'), 10000171, 100123);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('27-05-3062', 'dd-mm-yyyy'), 10000112, 100012);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('12-06-2024', 'dd-mm-yyyy'), 10000154, 100133);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('14-08-1965', 'dd-mm-yyyy'), 10000074, 100189);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-09-1955', 'dd-mm-yyyy'), 10000134, 100160);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('07-01-3037', 'dd-mm-yyyy'), 10000132, 100071);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('22-12-1928', 'dd-mm-yyyy'), 10000039, 100187);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('08-09-1942', 'dd-mm-yyyy'), 10000083, 100066);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-07-3020', 'dd-mm-yyyy'), 10000035, 100038);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('08-10-3023', 'dd-mm-yyyy'), 10000251, 100217);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('05-07-1960', 'dd-mm-yyyy'), 10000091, 100256);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('08-12-3053', 'dd-mm-yyyy'), 10000271, 100022);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('12-11-1938', 'dd-mm-yyyy'), 10000149, 100279);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('28-01-1934', 'dd-mm-yyyy'), 10000261, 100047);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('30-08-1938', 'dd-mm-yyyy'), 10000106, 100226);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('27-01-3010', 'dd-mm-yyyy'), 10000127, 100251);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('15-12-1993', 'dd-mm-yyyy'), 10000081, 100280);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('17-05-3021', 'dd-mm-yyyy'), 10000124, 100131);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-07-1973', 'dd-mm-yyyy'), 10000288, 100224);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('01-11-2014', 'dd-mm-yyyy'), 10000074, 100120);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('28-02-1955', 'dd-mm-yyyy'), 10000141, 100014);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('17-05-2974', 'dd-mm-yyyy'), 10000278, 100118);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('18-01-1981', 'dd-mm-yyyy'), 10000279, 100087);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('09-11-1925', 'dd-mm-yyyy'), 10000132, 100268);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-03-3062', 'dd-mm-yyyy'), 10000148, 100284);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('18-11-1936', 'dd-mm-yyyy'), 10000083, 100210);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('14-06-2011', 'dd-mm-yyyy'), 10000031, 100274);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('04-09-3035', 'dd-mm-yyyy'), 10000297, 100262);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('12-03-3059', 'dd-mm-yyyy'), 10000105, 100220);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('18-01-1958', 'dd-mm-yyyy'), 10000311, 100198);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('29-05-2982', 'dd-mm-yyyy'), 10000394, 100056);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-07-1988', 'dd-mm-yyyy'), 10000211, 100009);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('02-10-2978', 'dd-mm-yyyy'), 10000078, 100226);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-02-3075', 'dd-mm-yyyy'), 10000078, 100118);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('31-03-1985', 'dd-mm-yyyy'), 10000213, 100102);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('27-10-2971', 'dd-mm-yyyy'), 10000168, 100227);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('24-06-3025', 'dd-mm-yyyy'), 10000304, 100014);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('28-06-3055', 'dd-mm-yyyy'), 10000335, 100015);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-12-1925', 'dd-mm-yyyy'), 10000003, 100265);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('23-11-1944', 'dd-mm-yyyy'), 10000016, 100247);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('16-04-3064', 'dd-mm-yyyy'), 10000259, 100100);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-03-3060', 'dd-mm-yyyy'), 10000126, 100154);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-11-1938', 'dd-mm-yyyy'), 10000002, 100128);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('23-09-1960', 'dd-mm-yyyy'), 10000212, 100091);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('19-06-2971', 'dd-mm-yyyy'), 10000326, 100264);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('07-09-2985', 'dd-mm-yyyy'), 10000302, 100178);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('02-12-1911', 'dd-mm-yyyy'), 10000056, 100138);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('03-11-1943', 'dd-mm-yyyy'), 10000185, 100068);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('14-11-1985', 'dd-mm-yyyy'), 10000186, 100030);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('07-05-2994', 'dd-mm-yyyy'), 10000319, 100104);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('13-07-3005', 'dd-mm-yyyy'), 10000143, 100126);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('31-12-2983', 'dd-mm-yyyy'), 10000060, 100103);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('05-10-1925', 'dd-mm-yyyy'), 10000162, 100005);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('11-06-1951', 'dd-mm-yyyy'), 10000210, 100111);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('20-09-2004', 'dd-mm-yyyy'), 10000007, 100078);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('01-09-1987', 'dd-mm-yyyy'), 10000310, 100209);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('05-05-3065', 'dd-mm-yyyy'), 10000259, 100088);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('20-10-3031', 'dd-mm-yyyy'), 10000346, 100122);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('14-06-3018', 'dd-mm-yyyy'), 10000076, 100093);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('16-11-1993', 'dd-mm-yyyy'), 10000377, 100162);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('18-09-1957', 'dd-mm-yyyy'), 10000111, 100106);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('29-03-2000', 'dd-mm-yyyy'), 10000090, 100017);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('18-06-2019', 'dd-mm-yyyy'), 10000358, 100231);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('08-04-2980', 'dd-mm-yyyy'), 10000233, 100235);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('23-10-2015', 'dd-mm-yyyy'), 10000394, 100216);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('06-01-2983', 'dd-mm-yyyy'), 10000145, 100194);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('21-02-3029', 'dd-mm-yyyy'), 10000087, 100205);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('10-09-3064', 'dd-mm-yyyy'), 10000124, 100015);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('27-12-1944', 'dd-mm-yyyy'), 10000305, 100148);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('15-12-1965', 'dd-mm-yyyy'), 10000317, 100283);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('07-12-1941', 'dd-mm-yyyy'), 10000210, 100052);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('05-11-3064', 'dd-mm-yyyy'), 10000264, 100193);
insert into VOLUNTEERSHIFTALLOCATION (daate, volunteer_id, shift_id)
values (to_date('02-07-1954', 'dd-mm-yyyy'), 10000268, 100230);
commit;
prompt 400 records loaded
prompt Enabling foreign key constraints for SHIFTS...
alter table SHIFTS enable constraint SYS_C007375;
prompt Enabling foreign key constraints for VOLUNTEERROLE...
alter table VOLUNTEERROLE enable constraint SYS_C007302;
prompt Enabling triggers for ACTIVITIES...
alter table ACTIVITIES enable all triggers;
prompt Enabling triggers for EEVENTS...
alter table EEVENTS enable all triggers;
prompt Enabling triggers for REPORTS...
alter table REPORTS enable all triggers;
prompt Enabling triggers for ROOLES...
alter table ROOLES enable all triggers;
prompt Enabling triggers for SHIFTS...
alter table SHIFTS enable all triggers;
prompt Enabling triggers for VOLUNTEERROLE...
alter table VOLUNTEERROLE enable all triggers;
prompt Enabling triggers for VOLUNTEERS...
alter table VOLUNTEERS enable all triggers;
prompt Enabling triggers for VOLUNTEERSHIFTALLOCATION...
alter table VOLUNTEERSHIFTALLOCATION enable all triggers;
set feedback on
set define on
prompt Done.
