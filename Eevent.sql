insert into eevents (event_id, event_date, event_time, shift_id)
values (1, to_date('2024-06-01', 'YYYY-MM-DD'), '09:00:00', 1);

insert into eevents (event_id, event_date, event_time, shift_id)
values (2, to_date('2024-07-01', 'YYYY-MM-DD'), '10:00:00', 2);

insert into eevents (event_id, event_date, event_time, shift_id)
values (3, to_date('2024-08-01', 'YYYY-MM-DD'), '11:00:00', 3);

commit;

