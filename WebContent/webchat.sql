create database webchat;

drop table if exists following;
drop table if exists medialink;
drop table if exists message;
drop table if exists user;
create table user(
	id int not null auto_increment,
	name varchar(24) not null,
	uniqueName varchar(24) not null,
	role varchar(16) not null,
	password varchar(24) not null,
	description varchar(128) not null,
	address varchar(24) not null,
	site varchar(32) not null,
	logoURL varchar(32) not null,
	headerURL varchar(32) not null,
	mediaFilesAmount int not null,
	followingAmount int not null,
	followersAmount int not null,
	likesAmount int not null,
	messagesAmount int not null,
	primary key(id)
);

insert into user(name, uniqueName, role, password, description, address, site, logoURL, headerURL, mediaFilesAmount, followingAmount, followersAmount, likesAmount, messagesAmount) values
('Aleksei Silivonchik', 'SAleksei', 'USER', 'qwerty', 
	'Java Software Developer. Main technologies are Java, Spring, Javascript, CSS, Bootstrap, Mysql, JEE.', 'Kuprevicha 1/1', 'http://saleksei.blog.com', 
	'/images/image.jpg', '/images/wide.jpg', 3, 1, 0, 4, 4),
('Artem Adamyan', 'Johnny', 'USER', 'qwerty', 
	'Testing engineer. Main technologies are JUnit, Selenium, Java, Javascript, CSS, Bootstrap.', 'Meleja 19/400', 'http://johhny.cosmonavtom.com', 
	'/images/it1.jpg', '/images/blankImageLarge.png',  0, 0, 1, 0, 0),
('Vladimir Silivonchik', 'Vladimir', 'USER', 'qwerty', 
	'Java Software Developer. Main technologies are Java, Spring, Javascript, CSS, Bootstrap, Mysql, JEE.', 'Kuprevicha 1/1', 'http://saleksei.blog.com', 
	'/images/it2.jpg', '/images/blankImageLarge.png', 3, 1, 0, 4, 4),
('Larisa Silivonchik', 'Larisa', 'USER', 'qwerty', 
	'Java Software Developer. Main technologies are Java, Spring, Javascript, CSS, Bootstrap, Mysql, JEE.', 'Kuprevicha 1/1', 'http://saleksei.blog.com', 
	'/images/it3.jpg', '/images/blankImageLarge.png', 3, 1, 0, 4, 4),
('Kostya Silivonchik', 'Kostya', 'USER', 'qwerty', 
	'Java Software Developer. Main technologies are Java, Spring, Javascript, CSS, Bootstrap, Mysql, JEE.', 'Kuprevicha 1/1', 'http://saleksei.blog.com', 
	'/images/logo.png', '/images/blankImageLarge.png', 3, 1, 0, 4, 4),
('Sergei Silivonchik', 'Sergei', 'USER', 'qwerty', 
	'Java Software Developer. Main technologies are Java, Spring, Javascript, CSS, Bootstrap, Mysql, JEE.', 'Kuprevicha 1/1', 'http://saleksei.blog.com', 
	'/images/it4.jpg', '/images/blankImageLarge.png', 3, 1, 0, 4, 4),
('Petya Silivonchik', 'Petya', 'USER', 'qwerty', 
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
);

insert into message(text, fk_user, likes, retweets) values 
('Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore, veritatis, tempora, necessitatibus inventore nisi quam quia repellat ut tempore laborum possimus eum dicta id animi corrupti debitis ipsum officiis rerum.', 1, 0, 0),
('First like "Hello world" message via my new WebChat application! Used technologies: Java, JSP, Servlets, JDBC, MySQL, CSS, Bootstrap.', 1, 0, 2),
('Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 1, 4, 5),
('Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 1, 3, 2),
('Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 1, 3, 2);


create table medialink(
	id int not null auto_increment,
	link varchar(32) not null,
	fk_user int not null,
	fk_message int not null,
	primary key(id),
	foreign key (fk_user) references user(id),
	foreign key (fk_message) references message(id)
);

insert into medialink(link, fk_user, fk_message) values
('/images/it3.jpg', 1, 1),
('/images/it1.jpg', 1, 3),
('/images/it4.jpg', 1, 3),
('/images/it1.jpg', 1, 4),
('/images/it3.jpg', 1, 4),
('/images/it4.jpg', 1, 4),
('/images/it4.jpg', 1, 5),
('/images/it1.jpg', 1, 5),
('/images/it3.jpg', 1, 5),
('/images/it4.jpg', 1, 5);


create table following(
	id int not null auto_increment,
	fkUser int not null,
	fkFollowingUser int not null,
	primary key(id),
	foreign key (fkUser) references user(id),
	foreign key (fkFollowingUser) references user(id)
);

insert into following(fkUser, fkFollowingUser) values
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7);





