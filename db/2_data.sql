USE littil;

insert into location (location_id, country_code, address, postal_code, latitude, longitude) VALUES (1, 'nl', 'Schoolstraat 1 Heeze', '5591 HK', 5137962, 557547);
insert into location (location_id, country_code, address, postal_code, latitude, longitude) VALUES (2, 'nl', 'Hogeweg 24 Venlo', '5911 EB', 5137435, 617394);

insert into contact_person (contact_person_id, first_name, prefix, surname) values (1, 'Jules', 'de', 'Korte');
insert into contact_person (contact_person_id, first_name, prefix, surname) values (2, 'Jolanda', 'de', 'Lange');

insert into user (user_id, provider, provider_id, email_address) values (1, 'AUTH0', 42, 'jules@littil.org');
insert into user (user_id, provider, provider_id, email_address) values (2, 'AUTH0', 42, 'jolanda@littil.org');

insert into school (school_id, school_name, location, user, contact_person) values (1, 'Dirk Hezius', 1, 1, 1);
insert into school (school_id, school_name, location, user, contact_person) values (2, 'Valuascollege', 2, 2, 2);
