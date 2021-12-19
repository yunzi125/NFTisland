use nftislanddb;

create table if not exists work(
	w_id VARCHAR(10) not null,
	w_name varchar(20),
	w_unitPrice integer,
	w_worker varchar(50),
	w_description text,
	w_category varchar(20),
	w_unisInStock long,
	w_releaseDate varchar(20),
	w_condition varchar(20),
	w_filename varchar(20),
	PRIMARY KEY (w_id)
)default CHARSET="utf8";


select * from work;

drop table work;
show tables;

insert into work values('2021110101', '마구마구 THE SWING', 1650000, '마구마구', '마구마구 오픈 16주년을 기념하는 원화 이미지.', '스포츠', 25, '2021/ 11', 'new', 'NFT_magumagu01.PNG');
insert into work values('2021110301', 'aespa - black mamba', 250000, 'SM ent', 'SM엔터테인먼트의 4인조 걸그룹 aespa의 데뷔 앨범 자켓사진.', 'K-Pop', 30, '2020/ 11', 'new', 'NFT_aespa01.PNG');
insert into work values('2021110501', 'Mona Lisa', 10000000, '레오나르도 다빈치', '레오나르도 다빈치의 대표작이자 현재 프랑스 파리 루브르 박물관에 전시되어있는 작품을 NFT로 만나보세요.', 'Art', 5, '1503/ ', 'new', 'NFT_monalisa01.PNG');
insert into work values('2021120101', '이윤지 얼굴', 999999999, '이윤지', '해운대에서 찍은 이윤지 사진입니다.', '인물', 3, '2021/ 12', 'new', 'NFT_leeyunji01.PNG');

