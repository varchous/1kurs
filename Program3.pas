uses crt,graphabc;
const line='|    Марка    |  Модель   |Цена|Вес|   Цвет   |';
   type pk = record
        Marka:string;
        Model:string;
        Cena:integer;
        ves:integer;

        cvet:string;
        end;
var f: file of pk;   y:char;    x,v:integer;

procedure Vvod (var ff: file of pk);
var i,n: integer; d: pk;
begin
  clrscr;
  x:=loadpicture('44824.jpg');
  drawpicture(x,1,1,800,600);
  reset(f);
  write('Количество записей: '); readln(n);
  writeln('Внесите данные:');
  for i:=1 to n do
    with d do
         begin
         write('Марка: ');readln(Marka);
         write('Модель: ');readln(Model);
         write('Цена: ');readln(Cena);
         write('Вес ');readln(ves);
         write('Цвет: ');readln(cvet);
         write(ff,d);
         end;

  writeln('Данные выведены. Enter для продолжения...');
  readln;
end;

procedure Vyvod (ff: file of pk);
var d: pk;
begin
clrscr;
  x:=loadpicture('44824.jpg');
  drawpicture(x,1,1,800,600);
  reset(ff);
  writeln(line);
  while not eof(ff) do
      begin
      read(ff,d);
      with d do
           begin
           writeln('|',marka:13,'|',model:11,'|',cena:4,'|',ves:3,'|',cvet:10,'|');
           end;
      end;
      close (ff);
  writeln('Данные выведены. Enter для продолжения...');
  readln;
end;

procedure poisk(ff: file of pk);
var i: integer;
  d:pk;
  a:string;
begin
  clrscr;
  x:=loadpicture('44824.jpg');
  drawpicture(x,1,1,800,600);
  reset(f);
  writeln('Введите марку');
  readln(a);
  writeln(line);
  while not eof(ff) do
  begin
    read(f,d);
    if d.marka = a then
    begin
      writeln('|',d.marka:13,'|',d.model:11,'|',d.cena:4,'|',d.ves:3,'|',d.cvet:10,'|');
    end;
  end;
  close(f);
  writeln('Данные выведены. Enter для продолжения...');
  readln;
end;
procedure redaktirovanie(ff:file of pk);
var d:pk;
n:integer;
begin
     clrscr;
     x:=loadpicture('44824.jpg');
     drawpicture(x,1,1,800,600);
     reset(f);
     writeln('Введите номер записи');
     readln(n);
     seek (f, n-1);
     write('Марка: ');readln(d.Marka);
     write('Модель: ');readln(d.Model);
     write('Цена: ');readln(d.Cena);
     write('Вес ');readln(d.ves);
     write('Цвет: ');readln(d.cvet);
     write(ff,d);
     close(f);
       writeln('Данные выведены. Enter для продолжения...');
  readln;
end;
procedure Udalenie(var ff:file of pk);
var n,i:integer;
    d:pk;
begin
     clrscr;
     x:=loadpicture('44824.jpg');
     drawpicture(x,1,1,800,600);
     write('Введите номер записи  ');
     readln(n);
     Reset(f);
     if (filesize(f)<n)or(n<0) then
     begin
          writeln('В файле нет такой записи');
          close(f);
          writeln('Данные выведены. Enter для продолжения...');
          readln;
          exit;
     end;
     seek(f,n-1);
     for i:=n-1 to filesize(f)-2 do
     begin
          seek(f,i+1);
          read(f,d);
          seek(f,i);
          write(f,d);
     end;
     seek(f,filesize(f)-1);
     truncate(f);
     close(f);
     writeln('Данные выведены. Enter для продолжения...');
     readln;
end;
procedure Menu;
begin
     clrscr;
     x:=loadpicture('44824.jpg');
     drawpicture(x,1,1,800,600);
     textout(300,25,'Меню');
     textout(100,100,'1-Вввод');
     textout(100,150,'2-Вывод');
     textout(100,200,'3-Поиск');
     textout(100,250,'4-редактирование');
     textout(100,300,'5-Удалить запись');
     textout(100,350,'0-Выход');
     SetwindowWidth(800);
     Setwindowheight(600);
end;
procedure Privetstvie;
begin

          x:=loadpicture('44824.jpg');
          drawpicture(x,1,1,800,600);
          SetwindowWidth(800);
          Setwindowheight(600);
          textout(300,50,'Хотите начать игру?');
          textout(200,85,'Да(Нажмите Y)');
          textout(455,85,'Нет(Нажмите N)');
          readln(y);

end;
begin

     Privetstvie;
     if y='n' then exit;
     Assign(f,'baza.txt');
     v:=1;
     repeat
     Menu;
     readln(v);
     case v of
     1: Vvod(f);
     2: Vyvod(f);
     3: poisk(f);
     4:redaktirovanie(f);
     5:Udalenie(f);
     end;
     until v=0;
end.
