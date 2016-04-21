
drop database webchat;

CREATE DATABASE webchat
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
use webchat;

drop table if exists following;
drop table if exists medialink;
drop table if exists message;
drop table if exists user;
create table user(
	id int not null auto_increment,
	name varchar(24),
	uniqueName varchar(24) not null,
	role varchar(16) not null,
	email varchar(32) not null,
	password varchar(64) not null,
	description varchar(128),
	address varchar(24),
	site varchar(32),
	logoURL varchar(32),
	headerURL varchar(32),
	mediaFilesAmount int not null default 0,
	followingAmount int not null default 0,
	followersAmount int not null default 0,
	likesAmount int not null default 0,
	messagesAmount int not null default 0,
	primary key(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into user(name, uniqueName, role, email, password, description, address, site, logoURL, headerURL, mediaFilesAmount, followingAmount, followersAmount, likesAmount, messagesAmount) values
('Aleksei Silivonchik', 'SAleksei', 'USER', '$2a$10$pmq6yXcuUrH2kN4Eltzvw.VTJGWvx5a69LUGE9CJpL26KRJ.SuDMe', 'aa@gmail.by',
	'Java Software Developer. Main technologies are Java, Spring, Javascript, CSS, Bootstrap, Mysql, JEE.', 'Kuprevicha 1/1', 'http://saleksei.blog.com', 
	'/images/image.jpg', '/images/wide.jpg', 3, 1, 0, 4, 4),
('Artem Adamyan', 'Johnny', 'USER', 'qwerty', 'aa@gmail.by',
	'Testing engineer. Main technologies are JUnit, Selenium, Java, Javascript, CSS, Bootstrap.', 'Meleja 19/400', 'http://johhny.cosmonavtom.com', 
	'/images/it1.jpg', '/images/blankImageLarge.png',  0, 0, 1, 0, 0),
('Vladimir Silivonchik', 'Vladimir', 'USER', 'qwerty', 'aa@gmail.by',
	'Java Software Developer. Main technologies are Java, Spring, Javascript, CSS, Bootstrap, Mysql, JEE.', 'Kuprevicha 1/1', 'http://saleksei.blog.com', 
	'/images/it2.jpg', '/images/blankImageLarge.png', 3, 1, 0, 4, 4),
('Larisa Silivonchik', 'Larisa', 'USER', 'qwerty', 'aa@gmail.by', 
	'Java Software Developer. Main technologies are Java, Spring, Javascript, CSS, Bootstrap, Mysql, JEE.', 'Kuprevicha 1/1', 'http://saleksei.blog.com', 
	'/images/it3.jpg', '/images/blankImageLarge.png', 3, 1, 0, 4, 4),
('Kostya Silivonchik', 'Kostya', 'USER', 'qwerty', 'aa@gmail.by', 
	'Java Software Developer. Main technologies are Java, Spring, Javascript, CSS, Bootstrap, Mysql, JEE.', 'Kuprevicha 1/1', 'http://saleksei.blog.com', 
	'/images/logo.png', '/images/blankImageLarge.png', 3, 1, 0, 4, 4),
('Sergei Silivonchik', 'Sergei', 'USER', 'qwerty', 'aa@gmail.by', 
	'Java Software Developer. Main technologies are Java, Spring, Javascript, CSS, Bootstrap, Mysql, JEE.', 'Kuprevicha 1/1', 'http://saleksei.blog.com', 
	'/images/it4.jpg', '/images/blankImageLarge.png', 3, 1, 0, 4, 4),
('Petya Silivonchik', 'Petya', 'USER', 'qwerty', 'aa@gmail.by', 
	'Java Software Developer. Main technologies are Java, Spring, Javascript, CSS, Bootstrap, Mysql, JEE.', 'Kuprevicha 1/1', 'http://saleksei.blog.com', 
	'/images/it1.jpg', '/images/blankImageLarge.png', 3, 1, 0, 4, 4);
		

create table message(
	id int not null auto_increment,
	text varchar(144) not null,
	likes int not null,
	retweets int not null,
	createDate timestamp,
	fk_user int not null,
	primary key(id),
	foreign key (fk_user) references user(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into message(text, fk_user, likes, retweets) values 
('Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore, veritatis, tempora, necessitatibus inventore nisi quam quia repellat ut tempore laborum possimus eum dicta id animi corrupti debitis ipsum officiis rerum.', 1, 0, 0),
('First like "Hello world" message via my new WebChat application! Used technologies: Java, JSP, Servlets, JDBC, MySQL, CSS, Bootstrap.', 1, 0, 2),
('Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 1, 4, 5),
('Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 1, 3, 2),
('Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 1, 3, 2);
('Привет че как дела.', 1, 3, 2);


create table medialink(
	id int not null auto_increment,
	link varchar(128) not null,
	fk_user int not null,
	fk_message int not null,
	primary key(id),
	foreign key (fk_user) references user(id),
	foreign key (fk_message) references message(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into medialink(link, fk_user, fk_message) values
('SAleksei/it3.jpg', 1, 1),
('SAleksei/it1.jpg', 1, 3),
('SAleksei/it4.jpg', 1, 3),
('SAleksei/it1.jpg', 1, 4),
('SAleksei/it3.jpg', 1, 4),
('SAleksei/it4.jpg', 1, 4),
('SAleksei/it4.jpg', 1, 5),
('SAleksei/it1.jpg', 1, 5),
('SAleksei/it3.jpg', 1, 5),
('SAleksei/it4.jpg', 1, 5);


create table following(
	id int not null auto_increment,
	fkUser int not null,
	fkFollowingUser int not null,
	primary key(id),
	foreign key (fkUser) references user(id),
	foreign key (fkFollowingUser) references user(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into following(fkUser, fkFollowingUser) values
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7);


create table reply(
	id int not null auto_increment,
	text varchar(144) not null,
	fkMessage int not null,
	primary key(id),
	foreign key (fkMessage) references message(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;




