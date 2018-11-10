
/* Drop Tables */

DROP TABLE favorites CASCADE CONSTRAINTS;
DROP TABLE coupon CASCADE CONSTRAINTS;
DROP TABLE rereply CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE sale CASCADE CONSTRAINTS;
DROP TABLE shipping CASCADE CONSTRAINTS;
DROP TABLE viewer CASCADE CONSTRAINTS;
DROP TABLE project CASCADE CONSTRAINTS;
DROP TABLE company CASCADE CONSTRAINTS;
DROP TABLE webadmin CASCADE CONSTRAINTS;
DROP TABLE webmember CASCADE CONSTRAINTS;

/* Create Tables */


CREATE TABLE webadmin
(
	-- 관리자 아이디
	admin_id varchar2(30) NOT NULL,
	-- 관리자 비밀번호
	admin_pwd varchar2(30) NOT NULL,
	-- 관리자 전화번호
	admin_phone varchar2(30) NOT NULL,
	-- 관리자 이메일
	admin_email varchar2(100),
	-- 관리자 이름
	admin_name varchar2(30) NOT NULL,
	PRIMARY KEY (admin_id)
);


CREATE TABLE webmember
(
	-- member 테이블의 pk 값, 회원아이디
	-- 
	userid varchar2(30) NOT NULL,
	-- firstname
	firstname varchar2(50) NOT NULL,
    	-- lastname
	lastname varchar2(50) NOT NULL,
	-- 회원 비밀번호
	userpwd varchar2(30) NOT NULL,
	-- 회원 성별
	-- 'male' or 'female'
	gender varchar2(20) NOT NULL,
	-- 회원 생년월일
	birthday date NOT NULL,
	-- 회원 주소
	phone varchar2(30) NOT NULL,
	-- 회원 이메일
	email varchar2(100) NOT NULL,
	-- 회원 관심분야
	hobby varchar2(1000),
	image varchar2(2000),
	-- country
	country varchar2(100) not null,
	-- zipcode
	zipcode varchar2(100),
	province varchar2(100),
	-- city
	city varchar2(100) not null,
	-- address1
	address1 varchar2(1000),
	-- address2
	address2 varchar2(1000),
	PRIMARY KEY (userid)
);

CREATE TABLE company
(
	-- 회사아이디
	co_id varchar2(30) NOT NULL,
	-- 회사명
	co_name varchar2(50) NOT NULL,
	-- 회사비밀번호
	co_pwd varchar2(30) NOT NULL,
	-- 회사 전화번호
	co_phone varchar2(30) NOT NULL,
	-- 회사 대표이메일
	co_email varchar2(100) NOT NULL,
	-- 회사 홈페이지
	co_website varchar2(200) NOT NULL,
	co_image varchar2(2000),
    	-- 회사 대표자명
	co_ceo_firstname varchar2(50) NOT NULL,
	co_ceo_lastname varchar2(50) NOT NULL,
	-- co_zipcode
	co_country varchar2(100) NOT NULL,
	co_zipcode varchar2(100) NOT NULL,
	co_province varchar2(100),
	-- co_city
	co_city varchar2(100) NOT NULL,
	co_address1 varchar2(1000),
	co_address2 varchar2(1000),
	PRIMARY KEY (co_id)
);

CREATE TABLE project
(
	project_num number NOT NULL,
	project_title varchar2(100) NOT NULL,
	project_coverImage varchar2(2000) NOT NULL,
	project_content varchar2(3000) NOT NULL,
	project_nowfundprice number NOT NULL,
	project_goalfundprice number NOT NULL,
	project_startdate date NOT NULL,
	project_goaldate date NOT NULL,
	project_hitcount number DEFAULT 0,
	project_location varchar2(100) NOT NULL,
	project_category varchar2(100) NOT NULL,
	project_video varchar2(2000) NOT NULL,
    reward_title varchar2(100) NOT NULL,
	reward_price number not null,
    reward_description varchar2(2000),
    reward_deliverydate date,
	project_checked varchar2(10) DEFAULT 'no' NOT NULL,
   	co_id varchar2(30) NOT NULL,
	PRIMARY KEY (project_num),
    foreign key(co_id) references company(co_id)
);



CREATE TABLE viewer
(
	-- 접속 번호
	viewer_num number NOT NULL,
	-- 접속 국가 정보
	viewer_countryinfo varchar2(100),
	-- 접속 도시 정보
	viewer_cityinfo varchar2(100),
	-- 접속자 ip
	viewer_ipinfo varchar2(200),
	-- member 테이블의 pk 값, 회원아이디
	-- 
	userid varchar2(30),
	-- 상품 번호
	project_num number NOT NULL,
	viewer_date date NOT NULL,
	PRIMARY KEY (viewer_num),
    foreign key(project_num) references project(project_num),
    foreign key(userid) references webmember(userid)
);




CREATE TABLE reply
(
	-- 리플 번호
	reply_num number NOT NULL,
	-- 리플 내용
	reply_content varchar2(1000) NOT NULL,
	userid varchar2(30) NOT NULL,
	-- 상품 번호
	project_num number NOT NULL,
    reply_date date default sysdate not null,
	PRIMARY KEY (reply_num),
    foreign key(project_num) references project(project_num),
    foreign key(userid) references webmember(userid)

);





CREATE TABLE rereply
(
	-- 리리플번호
	rereply_num number NOT NULL,
	-- 리리플내용
	rereply_content varchar2(1000) NOT NULL,
	-- 리플 번호
	reply_num number NOT NULL,
	-- 상품 번호
	project_num number NOT NULL,
	-- 회사아이디
	co_id varchar2(30) NOT NULL,
    rereply_date date default sysdate not null,
	PRIMARY KEY (rereply_num),
    foreign key(co_id) references company(co_id),
    foreign key(project_num) references project(project_num),
    foreign key(reply_num) references reply(reply_num)

);



CREATE TABLE favorites
(
	-- 상품 번호
	project_num number NOT NULL,
	-- member 테이블의 pk 값, 회원아이디
	-- 
	userid varchar2(30) NOT NULL,
	foreign key(project_num) references project(project_num),
    foreign key(userid) references webmember(userid)
);

CREATE TABLE shipping
(
	shipping_num number primary key,
    project_num number NOT NULL,
	-- member 테이블의 pk 값, 회원아이디
	shipping_country varchar2(100),
    shipping_price number,
    foreign key(project_num) references project(project_num)
);


CREATE TABLE coupon
(  
    coupon_num number primary key,
    coupon_discountrate number not null,
    coupon_used varchar2(10) default 'no',
    coupon_date date,
    coupon_code number not null,
    project_num number,
    userid varchar2(30),
    foreign key(project_num) references project(project_num),
    foreign key(userid) references webmember(userid)
);    


CREATE TABLE sale
(
	-- 판매 정보
	sale_num number NOT NULL,
	-- 판매 가격 정보
	sale_totalprice number NOT NULL,
	-- 판매 상품 개수
	sale_amount number NOT NULL,
	-- member 테이블의 pk 값, 회원아이디
    -- 
	userid varchar2(30) NOT NULL,
	sale_date date NOT NULL,
	-- pk
	project_num number NOT NULL,
    sale_phone varchar2(30) not null,
    sale_email varchar2(100) not null,
    sale_firstname varchar2(50) not null,
    sale_lastname varchar2(50) not null,
    sale_country varchar2(100) not null,
    sale_zipcode varchar2(100),
    sale_province varchar2(100),
    sale_city varchar2(100) not null,
    sale_address1 varchar2(1000),
    sale_address2 varchar2(1000),
    coupon_num number,
	PRIMARY KEY (sale_num),
    foreign key(project_num) references project(project_num),
    foreign key(userid) references webmember(userid),
    foreign key(coupon_num) references coupon(coupon_num)
);