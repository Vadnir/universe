drop database universe;

create database universe;

\c universe;

create table galaxy(
  galaxy_id serial,
  name varchar unique not null,
  description text not null,
  has_life boolean,
  has_dark_hole boolean,
  age_in_millions_of_years int,
  diamanter int,
  distance_from_earth numeric,
  primary key(galaxy_id)
);

create table star(
  star_id serial,
  name varchar unique not null,
  description text not null,
  has_life boolean,
  is_red boolean,
  age_in_millions_of_years int,
  diamanter int,
  distance_from_earth numeric,
  galaxy_id int,
  primary key(star_id),
  CONSTRAINT fk_galaxy 
    FOREIGN KEY(galaxy_id) 
      REFERENCES galaxy(galaxy_id)
);

create table planet(
  planet_id serial,
  name varchar unique not null,
  description text not null,
  has_life boolean,
  is_solid boolean,
  age_in_millions_of_years int,
  diamanter int,
  distance_from_earth numeric,
  star_id int,
  primary key(planet_id),
  CONSTRAINT fk_star FOREIGN KEY(star_id) 
    REFERENCES star(star_id)  
);

create table moon(
  moon_id serial,
  name varchar unique not null,
  description text not null,
  has_life boolean,
  is_ice boolean,
  age_in_millions_of_years int,
  diamanter int,
  distance_from_earth numeric,
  planet_id int references planet(planet_id),
  primary key(moon_id),
  CONSTRAINT fk_planet FOREIGN KEY(planet_id) 
    REFERENCES planet(planet_id)  
);

create table relleno(
  relleno_id serial,
  name varchar unique not null,
  b int not null,
  primary key(relleno_id)
);

INSERT INTO galaxy (name,description,has_life,has_dark_hole,age_in_millions_of_years,diamanter,distance_from_earth)
VALUES
  ('Justine Avery','ligula tortor, dictum','true','false',8,5,5),
  ('Sybill Jenkins','tempor, est ac mattis','true','false',4,1,0),
  ('Sandra Carney','nulla vulputate','false','true',10,2,6),
  ('Hedy Ochoa','in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris','true','true',3,10,5),
  ('Rhiannon Daniels','varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada','false','false',4,6,0),
  ('Harrison Fitzgerald','iaculis nec, eleifend','true','true',7,7,8),
  ('Cameran Robbins','ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia','false','false',6,5,10),
  ('Zahir Acosta','iaculis enim,','true','true',6,2,9),
  ('Stephen Buck','eu elit.','false','true',3,7,7),
  ('Patience Fry','enim. Etiam gravida','false','false',3,8,8);

INSERT INTO star (name,description,has_life,is_red,age_in_millions_of_years,diamanter,distance_from_earth,galaxy_id)
VALUES
  ('Genevieve David','venenatis a, magna. Lorem ipsum dolor','false','true',10,4,9,1),
  ('Garth Bowers','ut, molestie in, tempus eu, ligula. Aenean euismod mauris','false','false',3,0,4,2),
  ('Colt Benton','nonummy ultricies ornare, elit elit','false','false',6,10,5,3),
  ('Tasha Pruitt','nonummy. Fusce fermentum fermentum','true','false',10,9,8,4),
  ('Roth Davidson','sollicitudin adipiscing ligula. Aenean gravida nunc sed','true','false',7,8,3,5),
  ('Stone Bradley','risus. Quisque libero lacus, varius et, euismod et, commodo','false','true',6,8,7,6),
  ('Chaney Thompson','sed, sapien. Nunc pulvinar arcu et pede. Nunc sed','true','true',3,2,0,7),
  ('Griffin Nolan','Suspendisse non','false','true',9,8,7,8),
  ('Timothy Riley','sagittis. Nullam vitae diam. Proin','true','false',4,3,9,9),
  ('Jesse Marshall','nulla. In tincidunt congue','false','true',9,9,1,10);

INSERT INTO planet (name,description,has_life,is_solid,age_in_millions_of_years,diamanter,distance_from_earth,star_id)
VALUES
  ('Hoyt Crawford','mattis semper, dui lectus rutrum urna,','true','false',5,8,2,4),
  ('Bree Shepherd','Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec','false','true',2,4,3,9),
  ('Linus Fulton','Cras pellentesque.','false','true',1,8,0,6),
  ('Debra Schwartz','aliquet libero. Integer in','false','true',2,7,8,8),
  ('Colette Parsons','mus. Proin vel nisl. Quisque fringilla','true','false',0,7,2,8),
  ('Gavin Glass','non, lobortis quis, pede.','false','false',6,9,6,5),
  ('Ayanna Trujillo','arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras','false','true',10,8,7,9),
  ('Latifah Herrera','elit, pretium et, rutrum non, hendrerit id,','false','true',5,9,8,5),
  ('Clayton Woodward','penatibus et','true','false',5,3,7,6),
  ('Aurelia Gilmore','a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu.','false','false',6,0,5,8),
  ('Laith Ashley','faucibus orci luctus et','true','false',2,9,1,6),
  ('Isaac Combs','ut eros non enim commodo hendrerit. Donec porttitor','false','false',6,5,2,10),
  ('Sonia Joseph','mi enim, condimentum eget, volutpat ornare, facilisis eget,','false','true',7,7,5,4),
  ('Candice Meyer','vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus,','true','false',10,3,2,3),
  ('Jack Logan','vitae purus gravida sagittis. Duis gravida.','true','true',11,3,8,3),
  ('September Garcia','blandit viverra. Donec tempus, lorem fringilla','false','true',4,6,7,7),
  ('Christopher Frost','Donec elementum,','false','true',1,4,5,3),
  ('Charity Dickson','orci, in consequat','false','true',3,7,7,5),
  ('Mark Beard','consectetuer adipiscing elit.','true','true',2,0,8,5),
  ('James Moses','euismod ac, fermentum vel, mauris. Integer','false','true',8,9,6,5);


INSERT INTO moon (name,description,has_life,is_ice,age_in_millions_of_years,diamanter,distance_from_earth,planet_id)
VALUES
  ('Clementine Lyons','eleifend, nunc risus varius orci,','true','false',11,0,3,5),
  ('Mariko Ratliff','blandit enim consequat','true','false',2,0,0,2),
  ('Ryan Shaffer','auctor ullamcorper,','true','true',4,9,1,9),
  ('Priscilla Clemons','id, blandit at,','true','true',6,6,7,6),
  ('Oren Stout','hendrerit consectetuer, cursus','true','false',4,7,6,9),
  ('Garth Blake','mi lorem, vehicula et, rutrum eu,','false','false',10,8,10,5),
  ('Galvin Garrison','sit amet ultricies sem magna nec quam. Curabitur vel lectus.','true','false',8,4,9,3),
  ('Gillian Greene','id, libero. Donec consectetuer mauris id','true','false',9,7,1,9),
  ('Eaton Brown','luctus lobortis.','false','true',10,0,5,7),
  ('Gail Mason','tellus non magna.','true','true',10,2,2,1),
  ('Riley Kramer','nulla. Cras eu tellus','false','false',1,10,5,8),
  ('Joy Grant','sagittis placerat. Cras dictum ultricies ligula. Nullam enim.','true','false',0,8,6,3),
  ('Stephanie Crawford','feugiat nec, diam.','false','false',4,4,9,7),
  ('Logan Erickson','blandit mattis.','true','false',2,9,8,7),
  ('Samson Armstrong','justo faucibus lectus, a sollicitudin orci sem','true','true',10,9,2,2),
  ('Maisie Frost','eu tellus eu augue porttitor interdum. Sed auctor','false','true',7,2,6,1),
  ('Henry Stein','ante bibendum ullamcorper. Duis cursus, diam at','true','false',5,8,3,8),
  ('Ulysses Chang','est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh','false','true',2,2,7,8),
  ('Lavinia Branch','vulputate mauris sagittis placerat. Cras','false','true',0,9,2,4),
  ('Fredericka Johnson','Proin nisl sem, consequat nec, mollis','false','true',7,7,1,2);  

insert into relleno (name, b) values ('algo',1), ('algo2',2), ('algo3',3);
