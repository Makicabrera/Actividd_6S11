create table tb_a (
id_tba number (12), 
nombre_p varchar (50), 
tipo varchar (35), 
costo number (10));

create table tb_b (
descripcion varchar (100));

create or replace trigger tr_actualizar_tiendita
after update on tb_a
for each row
begin
 insert into tb_b values ('Se actualizado el dato');
end tr_actualizar_tiendita;

create or replace trigger tr_inserta_tiendita
after insert on tb_a
for each row
begin
 insert into tb_b values ('Se inserto el dato');
end tr_inserta_tiendita;

create or replace trigger tr_eliminar_tiendita
after delete on tb_a
for each row
begin
 insert into tb_b values ('Se elimino el dato');
end tr_eliminar_tiendita;

create or replace trigger tr_inicial_tiendita
after insert on tb_a
for each row
Declare
 ini NVARCHAR2(50);
begin
 ini:='';
 ini:= ini|| SUBSTR(:NEW.nombre_p, 1, 1);
 if(ini='d') then begin
 insert into tb_b values ('se agregó un producto y su nombre empieza con d, el dia '|| SYSTIMESTAMP);
 end; end if;
end tr_inicial_tiendita;

create or replace trigger tr_eliminado_humilde_tiendita
before delete on tb_a
for each row
Declare
 coshu number(10);
begin
 coshu:='';
 coshu:=(:OLD.costo);
 if(coshu<=12) then begin
 insert into tb_b values ('se eliminó un producto humilde que quería comprar con lo que tenia de mi pasaje :,c ');
 end; end if;
end tr_eliminado_humilde_tiendita;

insert into tb_a values (001, 'donitas', 'pan', 20);
insert into tb_a values (002, 'rebanada', 'pan', 10);
insert into tb_a values (003, 'mantecadas', 'pan', 25);
insert into tb_a values (004, 'nito', 'pan', 15);
insert into tb_a values (005, 'buñuelos', 'pan', 20);
insert into tb_a values (021, 'doritos', 'botana', 15);
insert into tb_a values (022, 'paketaxo', 'botana', 56);
insert into tb_a values (023, 'Sabritas adobadas', 'botana', 35);
insert into tb_a values (024, 'crujitos', 'botana', 15);
insert into tb_a values (025, 'sabritones', 'botana', 50);
insert into tb_a values (051, 'pulparindo', 'dulce', 8);
insert into tb_a values (052, 'picafresa', 'dulce', 2);
insert into tb_a values (053, 'mazapan', 'dulce', 8);
insert into tb_a values (054, 'panditas', 'dulce', 18);
insert into tb_a values (055, 'dragoncito', 'dulce', 3);

delete from tb_a where id_tba=52;
 
update tb_a set nombre_p='donitas espol' where id_tba=001;

select * from tb_a;

select * from tb_b;

drop table tb_a;

drop table tb_b;




