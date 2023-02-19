USE littil;

-- test data for school -----------------------------------------

insert into location (location_id, country_code, address, postal_code, latitude, longitude) VALUES (1, 'nl', 'Schoolstraat 1 Heeze', '5591 HK', 513783, 55726);
insert into location (location_id, country_code, address, postal_code, latitude, longitude) VALUES (2, 'nl', 'Hogeweg 24 Venlo', '5911 EB', 513746, 61735);

insert into contact_person (contact_person_id, first_name, prefix, surname) values (1, 'Jules', 'de', 'Korte');
insert into contact_person (contact_person_id, first_name, prefix, surname) values (2, 'Jolanda', 'de', 'Lange');

insert into user (user_id, provider, provider_id, email_address) values (1, 'AUTH0', 'auth0|63c847b6d58d9f733eb5c6cc', 'e2etestschool1@littil.org');
insert into user (user_id, provider, provider_id, email_address) values (2, 'AUTH0', 'auth0|63c84a521752991303e82230', 'e2etestschool2@littil.org');

insert into school (school_id, school_name, location, user, contact_person) values (1, 'Dirk Hezius', 1, 1, 1);
insert into school (school_id, school_name, location, user, contact_person) values (2, 'Valuascollege', 2, 2, 2);

-- test data for guest teacher ----------------------------------

insert into location (location_id, country_code, address, postal_code, latitude, longitude) VALUES (11, 'nl', 'Wilhelminaplein 6 Horst', '5961 ES', 514538, 60526);
insert into location (location_id, country_code, address, postal_code, latitude, longitude) VALUES (12, 'nl', 'Frans Joseph van Thielpark 1 Helmond', '5707 BX', 514776, 56493);

insert into contact_person (contact_person_id, first_name, prefix, surname) values (11, 'Jan', '', 'Janssen');
insert into contact_person (contact_person_id, first_name, prefix, surname) values (12, 'Peter', '', 'Pieters');

insert into user (user_id, provider, provider_id, email_address) values (11, 'AUTH0', 'auth0|63c84dd99fe228a778bb1590', 'e2etestdocent1@littil.org');
insert into user (user_id, provider, provider_id, email_address) values (12, 'AUTH0', 'auth0|63c8504869b0feeabf413d4f', 'e2etestdocent2@littil.org');

insert into guest_teacher (guest_teacher_id, first_name, surname, prefix, location, user) values (11, 'Jan', 'Janssen', '', 11, 11);
insert into guest_teacher (guest_teacher_id, first_name, surname, prefix, location, user) values (12, 'Peter', 'Pieters', '', 12, 12);

